#!/bin/bash
# Re-authenticate with GCP and refresh kubeconfig for GKE cluster

# Variables (replace with your actual values)
PROJECT_ID="cloud-cost-optimizer-488008"
CLUSTER_NAME="cloud-cost-cluster"
CLUSTER_ZONE="us-central1-a"

echo "🔑 Authenticating with Google Cloud..."
gcloud auth login --quiet

echo "📌 Setting project to $PROJECT_ID..."
gcloud config set project $PROJECT_ID

echo "🔗 Fetching cluster credentials for $CLUSTER_NAME..."
gcloud container clusters get-credentials $CLUSTER_NAME --zone $CLUSTER_ZONE --project $PROJECT_ID

echo "✅ Verifying cluster access..."
kubectl cluster-info
kubectl get nodes
kubectl get pods -A --no-headers | head -10

echo "🎉 Done! Your kubeconfig is refreshed and cluster access verified."
