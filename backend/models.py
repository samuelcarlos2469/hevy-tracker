from sqlalchemy import create_engine, Column, Integer, String, Float, ForeignKey, DateTime
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker

Base = declarative_base()

class Workout(Base):
    __tablename__ = 'workout'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    date = Column(DateTime)
    sets = relationship("WorkoutSet", back_populates="workout")

class Exercise(Base):
    __tablename__ = 'exercise'
    id = Column(Integer, primary_key=True)
    name = Column(String, unique=True)
    muscles = relationship("ExerciseMuscleMap", back_populates="exercise")

class WorkoutSet(Base):
    __tablename__ = 'workout_set'
    id = Column(Integer, primary_key=True)
    workout_id = Column(Integer, ForeignKey('workout.id'))
    exercise_id = Column(Integer, ForeignKey('exercise.id'))
    set_order = Column(Integer)
    reps = Column(Integer)
    weight = Column(Float)
    set_type = Column(String) # warmup, normal, failure, dropset
    
    workout = relationship("Workout", back_populates="sets")
    exercise = relationship("Exercise")

class Muscle(Base):
    __tablename__ = 'muscle'
    id = Column(Integer, primary_key=True)
    name = Column(String, unique=True)

class ExerciseMuscleMap(Base):
    __tablename__ = 'exercise_muscle_map'
    exercise_id = Column(Integer, ForeignKey('exercise.id'), primary_key=True)
    muscle_id = Column(Integer, ForeignKey('muscle.id'), primary_key=True)
    multiplier = Column(Float) # 0.1 a 1.0

    exercise = relationship("Exercise", back_populates="muscles")
    muscle = relationship("Muscle")

# Substitua com seus dados do docker-compose
DATABASE_URL = "postgresql://user:password@localhost:5432/hevy_data"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def init_db():
    Base.metadata.create_all(bind=engine)