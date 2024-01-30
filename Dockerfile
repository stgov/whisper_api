# syntax=docker/dockerfile:1

# Base image
ARG PYTHON_VERSION=3.10
FROM python:${PYTHON_VERSION}-slim as base

# Set environment variables
ENV MODEL_SIZE=small

# Copy application code
WORKDIR /app
COPY . /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 80

# Run the application
CMD uvicorn 'app:app' --host=0.0.0.0 --port=80

