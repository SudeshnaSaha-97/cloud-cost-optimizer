# Infra – Terraform + Kubernetes

This module provisions and manages infra:
- **Secure**: IAM roles, Secret Manager, SSL for Cloud SQL.
- **Scalable**: GKE cluster with separate node pools for frontend/backend.
- **Cost‑Optimized**: Optional toggles for Cloud SQL and Jenkins VM, lean instance types.

## Setup
```bash
cd infra/terraform
terraform init
terraform apply -var-file="terraform.tfvars"
