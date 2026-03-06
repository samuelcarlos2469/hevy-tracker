import re
import json
import psycopg2
from datetime import datetime
from models import SessionLocal, Workout, Exercise, WorkoutSet

# Configuração da conexão (ajuste conforme seu docker-compose)
DB_CONFIG = "postgresql://user:password@localhost:5432/hevy_data"

def parse_workout_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Divide por treinos (separados por ---)
    workouts_raw = content.split('---')
    parsed_data = []

    for raw_workout in workouts_raw:
        # Extrai Nome do Treino e Data
        workout_match = re.search(r'## (.*?)\n\*\*Data:\*\* (.*?)\n', raw_workout)
        if not workout_match:
            continue
        
        workout_name = workout_match.group(1).strip()
        workout_date = datetime.strptime(workout_match.group(2).strip(), '%d/%m/%Y %H:%M')
        
        exercises = []
        # Divide por exercícios (iniciam com ###)
        exercises_raw = re.split(r'### ', raw_workout)[1:]
        
        for raw_ex in exercises_raw:
            lines = raw_ex.strip().split('\n')
            ex_name = lines[0].strip()
            
            sets = []
            for line in lines:
                # Regex para capturar: reps, peso e tipo (warmup, failure, etc)
                set_match = re.search(r'- (\d+) reps \| ([\d.]+|None) kg \((.*?)\)', line)
                if set_match:
                    reps = int(set_match.group(1))
                    weight = 0.0 if set_match.group(2) == 'None' else float(set_match.group(2))
                    set_type = set_match.group(3)
                    sets.append({
                        "reps": reps,
                        "weight": weight,
                        "set_type": set_type
                    })
            
            if sets:
                exercises.append({
                    "name": ex_name,
                    "sets": sets
                })
        
        parsed_data.append({
            "name": workout_name,
            "date": workout_date,
            "exercises": exercises
        })
    
    return parsed_data
def save_to_db(parsed_data):
    session = SessionLocal()
    try:
        for w_data in parsed_data:
            # Cria o treino
            new_workout = Workout(name=w_data['name'], date=w_data['date'])
            session.add(new_workout)
            session.flush() # Gera o ID do treino antes do commit

            for ex_data in w_data['exercises']:
                # Busca ou cria o exercício
                exercise = session.query(Exercise).filter_by(name=ex_data['name']).first()
                if not exercise:
                    exercise = Exercise(name=ex_data['name'])
                    session.add(exercise)
                    session.flush()

                # Adiciona as séries
                for i, s_data in enumerate(ex_data['sets']):
                    new_set = WorkoutSet(
                        workout_id=new_workout.id,
                        exercise_id=exercise.id,
                        set_order=i,
                        reps=s_data['reps'],
                        weight=s_data['weight'],
                        set_type=s_data['set_type']
                    )
                    session.add(new_set)
        
        session.commit()
        print("Dados persistidos com sucesso!")
    except Exception as e:
        session.rollback()
        print(f"Erro ao salvar: {e}")
    finally:
        session.close()

if __name__ == "__main__":
    # 1. Parseia o arquivo
    data = parse_workout_file('historico_treinos.md')
    print(f"Extraídos {len(data)} treinos com sucesso.")
    
    # 2. SALVA NO BANCO (Descomente e chame a função)
    save_to_db(data)