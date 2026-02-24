#!/bin/bash
set -e

kubectl apply -f infra/k8s/
kubectl rollout status deployment/frontend-deployment
kubectl rollout status deployment/backend-deployment
