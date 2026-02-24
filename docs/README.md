# Cloud Cost Optimizer – SaaS MVP

This project is a **cost‑optimized SaaS MVP** designed to showcase cloud‑native infrastructure, CI/CD automation, and FinOps savings. It demonstrates how enterprises can reduce cloud waste and optimize costs. It combines **FastAPI**, **React**, **GKE**, **Cloud SQL**, and **CI/CD automation** into a lean, reproducible system.

--- 

## 🚀 Why This MVP Matters 

- **Secure by Design**
  - IAM‑based service accounts for CI/CD and workloads. 
  - Secrets managed via Google Secret Manager and Kubernetes CSI driver. 
  - TLS/SSL enforced for Cloud SQL connections.
  
- **Scalable Architecture** 
  - GKE cluster with separate node pools for frontend and backend workloads. 
  - Stateless containers for horizontal scaling.
  - Ingress routing for clean API/UI separation.

- **Cost‑Optimized** 
  - Lean instance types (`e2-medium`, `db-f1-micro`) for MVP. 
  - Autoscaling pools and modular toggles (enable/disable Cloud SQL, Jenkins VM). 
  - Artifact Registry for efficient image storage and reuse. 

---

## Modules
- **Backend**: FastAPI service with AWS resource scanning and savings calculation.
- **Frontend**: React + Tailwind dashboard for visualization.
- **Infra**: Terraform + Kubernetes manifests for reproducible infra.
- **CI/CD**: GitHub Actions and Jenkins pipelines for automated build/deploy.
- **Docs**: Architecture diagrams, roadmap, and recruiter‑friendly case studies.

---

## How to Run
1. Provision infra:
   ```bash
   cd infra/terraform
   terraform init
   terraform apply -var-file="terraform.tfvars"
2. Build & Push Images:
   - GitHub Actions auto‑runs on push to `main`.
   - Manual build:
    ```bash
    docker build -t backend:latest ./backend
    docker build -t frontend:latest ./frontend
3. Deploy Workloads
    ```bash
   kubectl apply -f infra/k8s/
   kubectl get pods
   kubectl get ingress
4. Access Application
- Frontend → via GCP Ingress load balancer.
- Backend API → /api path routed through ingress.

## 🧹 Teardown
To remove all infra and avoid costs:
   ```bash
    cd infra/terraform
    terraform destroy -auto-approve -var-file="terraform.tfvars"
```

---

## 📌 Recruiter/Investor Notes
- **Demonstrates FinOps principles:** idle resource detection, savings dashboard.
- **Enterprise‑ready patterns:** modular infra, CI/CD automation, secure secrets.
- **Lean MVP:** cost‑effective setup that can scale into a full Cloud Financial Intelligence Platform.