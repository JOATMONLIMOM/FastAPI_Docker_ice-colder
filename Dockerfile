FROM python:3.12-slim

# Set workdir
WORKDIR /app

# Copy dependency files first for better caching
COPY pyproject.toml ./

# Install pip tools to convert pyproject.toml to requirements.txt
RUN pip install pip-tools

# Compile requirements.txt from pyproject.toml
RUN pip-compile pyproject.toml

# Install dependencies
RUN pip install -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose port
EXPOSE 8000

# Start FastAPI app with uvicorn
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]