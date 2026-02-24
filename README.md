# Cloud Cost Optimizer – SaaS MVP

This repository contains a **cloud‑native SaaS MVP** that demonstrates how enterprises can reduce cloud waste and optimize costs. It combines **FastAPI**, **React**, **GKE**, **Cloud SQL**, and **CI/CD automation** into a lean, reproducible system.

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

## 📂 Repository Structure

- **backend/** → FastAPI service (AWS resource scanning, savings calculation).
- **frontend/** → React + Tailwind dashboard (visualization, login, resource table).
- **infra/** → Terraform + Kubernetes manifests