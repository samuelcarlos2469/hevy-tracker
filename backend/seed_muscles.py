import json
from models import SessionLocal, Muscle, Exercise, ExerciseMuscleMap

def seed_from_json():
    session = SessionLocal()
    with open('muscle_mapping.json', 'r', encoding='utf-8') as f:
        mapping_data = json.load(f)

    try:
        for muscle_name, info in mapping_data.items():
            # Garante que o músculo principal existe
            muscle = session.query(Muscle).filter_by(name=muscle_name).first()
            if not muscle:
                muscle = Muscle(name=muscle_name)
                session.add(muscle)
                session.flush()

            for ex_name in info['exercises']:
                exercise = session.query(Exercise).filter_by(name=ex_name).first()
                if exercise:
                    # Adiciona músculo principal
                    new_map = ExerciseMuscleMap(exercise_id=exercise.id, muscle_id=muscle.id, multiplier=info['multiplier'])
                    session.merge(new_map) # Merge evita erro de duplicata

                    # Adiciona sinergistas
                    for syn_name, mult in info.get('synergists', {}).items():
                        syn_muscle = session.query(Muscle).filter_by(name=syn_name).first()
                        if not syn_muscle:
                            syn_muscle = Muscle(name=syn_name)
                            session.add(syn_muscle)
                            session.flush()
                        
                        syn_map = ExerciseMuscleMap(exercise_id=exercise.id, muscle_id=syn_muscle.id, multiplier=mult)
                        session.merge(syn_map)
        
        session.commit()
        print("Mapeamento completo sincronizado!")
    finally:
        session.close()