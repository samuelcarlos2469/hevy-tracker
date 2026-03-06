import re
from datetime import datetime
from models import SessionLocal, Workout, Exercise, WorkoutSet

# Constante de peso base conforme seu plano "Secar no Talo"
CURRENT_BW = 94.0 #

def get_gym_from_notes(notes):
    notes_lower = notes.lower()
    if "skyfit" in notes_lower: return "Skyfit"
    if "boa forma" in notes_lower: return "Boa Forma"
    if "bem estar" in notes_lower: return "Bem Estar"
    return "Outra"

def calculate_real_weight(ex_name, weight, set_type):
    # Se o peso for 0 (None no MD) e for um exercício de peso corporal
    if weight == 0:
        # Se for assistido, o peso é menor que o BW (mas aqui assumimos BW base se não houver nota)
        # Em exercícios como Chin Up/Dip puro, usamos o BW total
        return CURRENT_BW
    
    # Lógica para Graviton/Assisted: BW - Peso da Máquina
    if "assisted" in ex_name.lower() or "graviton" in ex_name.lower():
        return max(0, CURRENT_BW - weight)
    
    return weight

def parse_and_save_with_intel(filepath):
    session = SessionLocal()
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    workouts_raw = content.split('---')
    
    for raw_workout in workouts_raw:
        workout_match = re.search(r'## (.*?)\n\*\*Data:\*\* (.*?)\n', raw_workout)
        if not workout_match: continue
        
        # Pega a academia nas notas do treino inteiro se houver
        gym_name = get_gym_from_notes(raw_workout)
        
        new_workout = Workout(
            name=workout_match.group(1).strip(),
            date=datetime.strptime(workout_match.group(2).strip(), '%d/%m/%Y %H:%M'),
            gym=gym_name
        )
        session.add(new_workout)
        session.flush()

        exercises_raw = re.split(r'### ', raw_workout)[1:]
        for raw_ex in exercises_raw:
            lines = raw_ex.strip().split('\n')
            ex_name = lines[0].strip()
            
            # Busca ou cria exercício
            exercise = session.query(Exercise).filter_by(name=ex_name).first()
            if not exercise:
                exercise = Exercise(name=ex_name)
                session.add(exercise)
                session.flush()

            for line in lines:
                set_match = re.search(r'- (\d+) reps \| ([\d.]+|None) kg \((.*?)\)', line)
                if set_match:
                    reps = int(set_match.group(1))
                    raw_weight = 0.0 if set_match.group(2) == 'None' else float(set_match.group(2))
                    
                    # APLICA A INTELIGÊNCIA DE PESO
                    final_weight = calculate_real_weight(ex_name, raw_weight, set_match.group(3))
                    
                    new_set = WorkoutSet(
                        workout_id=new_workout.id,
                        exercise_id=exercise.id,
                        reps=reps,
                        weight=final_weight,
                        set_type=set_match.group(3)
                    )
                    session.add(new_set)
    
    session.commit()
    
if __name__ == "__main__":
    parse_and_save_with_intel('historico_treinos.md')
    print("Carga concluída com sucesso com inteligência de peso e academia!")