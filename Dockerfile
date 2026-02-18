# Stage 1: Build
FROM python:3.9-slim AS build

WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY . .

# Stage 2: Production
FROM python:3.9-slim

WORKDIR /app

# Copy only the necessary files from build stage
COPY --from=build /app /app

# Command to run the FastAPI application using Gunicorn
CMD ["gunicorn", "-w", "4", "-k", "uvicorn.workers.UvicornWorker", "app.main:app", "--host", "0.0.0.0", "--port", "80"]