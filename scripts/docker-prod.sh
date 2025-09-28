#!/bin/bash

# Docker Production Script for Task Management Frontend

echo "🚀 Starting Task Management Frontend in Production Mode"
echo "Frontend will be available at: http://localhost:80"
echo "Press Ctrl+C to stop"

# Build and start the production container
docker-compose --profile production up --build frontend-prod
