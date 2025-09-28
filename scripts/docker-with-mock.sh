#!/bin/bash

# Docker Script with Mock Backend for Task Management Frontend

echo "🚀 Starting Task Management Frontend with Mock Backend"
echo "Frontend will be available at: http://localhost:5173"
echo "Mock Backend API will be available at: http://localhost:8080"
echo "Press Ctrl+C to stop"

# Build and start both frontend and mock backend
docker-compose --profile mock up --build frontend-dev mock-backend
