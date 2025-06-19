# Dockerfile for FastAPI + uv
FROM python:3.11-slim

# Install uv
RUN pip install uv

# Set workdir
WORKDIR /app

# Copy project files
COPY . /app

# Install dependencies with uv
RUN uv pip install --system -r requirements.txt

# Expose port
EXPOSE 8000

# Start FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
