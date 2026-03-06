# Project Specification: Hevy Tracker Backend

## Overview
This document describes the current state of the Hevy Tracker backend, focusing on structure, key files, and initial components related to muscle mapping and data handling.

## Directory Structure
The project is organized with a `backend/` directory containing the core Python logic and a `frontend/` directory suggesting a decoupled client application (though this spec focuses on the backend).

- `/home/pc/projects/hevy-tracker`
    - `docker-compose.yml`: Configuration for containerization, likely orchestrating services like the database and the backend application.
    - `backend/`: Contains all Python backend source files.
        - `main.py`: Likely the entry point or main application file (e.g., FastAPI or Flask application).
        - `models.py`: Contains definitions for data models (e.g., database schemas using an ORM like SQLAlchemy or Pydantic models).
        - `etl.py`: Suggests Extract, Transform, Load processes, likely for initial data loading or complex data manipulation tasks.
        - `seed_muscles.py`: A script intended to populate the database with initial muscle data.
        - `muscle_mapping.json`: Configuration or mapping data related to muscle groups or exercises.
        - `historico_treinos.md`: A markdown file, potentially for logging or documenting training history structure.
    - `backend/.venv/`: Python virtual environment directory.
    - `frontend/`: Contains the frontend source code (appears to be a React/TypeScript project based on files like `tsconfig.json`, `vite.config.ts`, `App.tsx`).

## Key Backend Components & Functionality

### Data Models (`backend/models.py`)
This file defines the structure of the data handled by the application. Based on the file names, we expect models related to users, workouts, exercises, and muscles.

### Data Seeding and Mapping
1.  **Muscle Data (`backend/muscle_mapping.json`):** This JSON file is used for muscle control/mapping.
2.  **Seeding Script (`backend/seed_muscles.py`):** This script utilizes the mapping data to initialize the database with muscle information.

### Data Processing (`backend/etl.py`)
This module handles ETL operations. Given the project context (workout tracker), this might be involved in:
*   Ingesting external workout data.
*   Aggregating or transforming historical workout data.

### Application Entry Point (`backend/main.py`)
This file likely initializes the application framework, configures middleware, and defines the main API endpoints.

## Version and Feature Control
Currently, version and feature control is implicit via the file structure and manual separation. The creation of this specification document is the first step towards formalizing this aspect. Future steps should involve incorporating versioning within the API design (e.g., `/api/v1/`) and potentially using configuration files to manage feature flags.

## Next Steps (Conceptual)
1.  Formalize API versioning strategy.
2.  Implement configuration management for feature toggles.
3.  Establish a process for documenting new features alongside this specification.