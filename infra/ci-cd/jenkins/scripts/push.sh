#!/bin/bash
set -e
COMPONENT=$1

gcloud auth configure-docker us-central1-docker.pkg.dev -q

if [ "$COMPONENT" == "frontend" ]; then
  docker push $FRONTEND_IMAGE
elif [ "$COMPONENT" == "backend" ]; then
  docker push $BACKEND_IMAGE
else
  echo "Unknown component: $COMPONENT"
  exit 1
fi
