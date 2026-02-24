#!/bin/bash
set -e
COMPONENT=$1

if [ "$COMPONENT" == "frontend" ]; then
  docker build -t $FRONTEND_IMAGE -f ./frontend/Dockerfile ./frontend
elif [ "$COMPONENT" == "backend" ]; then
  docker build -t $BACKEND_IMAGE -f ./backend/Dockerfile ./backend
else
  echo "Unknown component: $COMPONENT"
  exit 1
fi
