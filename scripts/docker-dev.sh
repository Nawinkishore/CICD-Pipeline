#!/bin/bash

# Docker Development Script for Task Management Frontend

echo "🚀 Starting Task Management Frontend in Development Mode"
echo "Frontend will be available at: http://localhost:5173"
echo "Press Ctrl+C to stop"

# Build and start the development container
docker-compose up --build frontend-dev
