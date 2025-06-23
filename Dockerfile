# Dockerfile for FastAPI + uv
FROM python:3.11-slim

# Install uv
RUN pip install uv

# Set workdir
WORKDIR /app

# Ensure /app is in PYTHONPATH
ENV PYTHONPATH=/app

# Copy dependency files first for better caching
COPY pyproject.toml uv.lock ./

# Install dependencies with uv
RUN uv pip sync pyproject.toml --system

# Copy the rest of the project files
COPY . .

# Expose port
EXPOSE 8000

# Start FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
