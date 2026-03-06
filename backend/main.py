from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from sqlalchemy import func
from models import SessionLocal, Workout, WorkoutSet, Exercise, ExerciseMuscleMap, Muscle
from datetime import datetime, timedelta

app = FastAPI(title="Hevy Data Tracker API")

# Dependency para o banco
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/exercises")
def list_exercises(db: Session = Depends(get_db)):
    # Faz um JOIN com WorkoutSet para contar as ocorrências
    results = db.query(
        Exercise.id,
        Exercise.name,
        func.count(WorkoutSet.id).label('frequency')
    ).outerjoin(WorkoutSet).group_by(Exercise.id).order_by(func.count(WorkoutSet.id).desc()).all()
    
    return [
        {"id": r.id, "name": r.name, "frequency": r.frequency} 
        for r in results
    ]

@app.get("/metrics/volume/{muscle_id}")
def get_muscle_volume(muscle_id: int, gym: str = None, db: Session = Depends(get_db)):
    query = db.query(
        func.date_trunc('week', Workout.date).label('week'),
        func.sum(WorkoutSet.reps * WorkoutSet.weight * ExerciseMuscleMap.multiplier).label('volume')
    ).join(WorkoutSet, Workout.id == WorkoutSet.workout_id)\
     .join(ExerciseMuscleMap, WorkoutSet.exercise_id == ExerciseMuscleMap.exercise_id)\
     .filter(ExerciseMuscleMap.muscle_id == muscle_id)
    
    # Adiciona o filtro por academia se o usuário enviar
    if gym:
        query = query.filter(Workout.gym == gym)
        
    results = query.group_by('week').order_by('week').all()
    return [{"week": r.week, "volume": r.volume} for r in results]

@app.get("/metrics/progression/{exercise_id}")
def get_progression(exercise_id: int, db: Session = Depends(get_db)):
    # Cálculo de 1RM estimado via Brzycki
    results = db.query(
        Workout.date,
        func.max(WorkoutSet.weight / (1.0278 - (0.0278 * WorkoutSet.reps))).label('estimated_1rm')
    ).join(WorkoutSet).filter(WorkoutSet.exercise_id == exercise_id)\
     .group_by(Workout.date).order_by(Workout.date).all()
    
    return [{"date": r.date, "1rm": round(r.estimated_1rm, 2)} for r in results]