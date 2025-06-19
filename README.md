# FastAPI Dockerized with uv

This project is a minimal FastAPI app running in a Docker container, using uv as the Python package manager.

## Features
- FastAPI app in `app/main.py`
- Dockerfile using uv for dependency management
- Docker Compose for easy orchestration

## Usage

1. Build and start the app:
   ```bash
   docker compose up --build
   ```
2. Visit [http://localhost:8000](http://localhost:8000) to see the FastAPI app running.

## Dependency Management
- Use `uv` for all Python dependency management inside the container.
- Add packages to `requirements.txt` and rebuild the container.
