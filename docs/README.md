# Cloud Cost Optimizer – SaaS MVP

This project is a **cost‑optimized SaaS MVP** designed to showcase cloud‑native infrastructure, CI/CD automation, and FinOps savings. It demonstrates:

- **Security**: IAM‑based access, Secret Manager integration, TLS/SSL for Cloud SQL.
- **Scalability**: GKE cluster with separate node pools for frontend and backend workloads.
- **Cost Optimization**: Lean resource sizing (`e2-medium`, `db-f1-micro`), autoscaling, and modular toggles for optional services (Cloud SQL, Jenkins VM).

## Modules
- **Backend**: FastAPI service with AWS resource scanning and savings calculation.
- **Frontend**: React + Tailwind dashboard for visualization.
- **Infra**: Terraform + Kubernetes manifests for reproducible infra.
- **CI/CD**: GitHub Actions and Jenkins pipelines for automated build/deploy.
- **Docs**: Architecture diagrams, roadmap, and recruiter‑friendly case studies.

## How to Run
1. Provision infra:
   ```bash
   cd infra/terraform
   terraform init
   terraform apply -var-file="terraform.tfvars"
2. Build images 