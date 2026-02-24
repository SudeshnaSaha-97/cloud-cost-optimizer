# CI/CD – Jenkins Pipelines

This module provides an **optional Jenkins VM** for hybrid CI/CD setups. It demonstrates enterprise‑ready flexibility while remaining secure and cost‑optimized.

---

## 🔒 Security
- Jenkins VM provisioned via Terraform with IAM roles.
- Service account keys stored in Kubernetes secrets.
- Role‑based access control for Jenkins users.

---

## 📈 Scalability
- Jenkins pipelines can integrate with enterprise systems (LDAP, custom agents).
- Supports complex workflows beyond GitHub Actions.
- Modular scripts (`build.sh`, `deploy.sh`, `push.sh`) for reusability.

---

## 💰 Cost Optimization
- Jenkins VM is **optional**: provision only if enterprise integration is required.
- Lean VM sizing (`e2-medium`) for MVP.
- Autoscaling node pools handle workload deployment, not Jenkins itself.

---

## 📂 Pipelines
- **Jenkinsfile** → Defines pipeline stages (build, push, deploy).
- **scripts/** → Modular shell scripts for each stage.

---

## ▶️ How to Run
1. Provision Jenkins VM via Terraform:
   ```bash
   cd infra/terraform
   terraform apply -var-file="terraform.tfvars"
2. Access Jenkins UI via GCP external IP.
3. Run pipeline:
    - Builds Docker images.
    - Pushes them to Artifact Registry.
    - Deploys workloads to GKE.

---

## 📌 Recruiter/Investor Highlights
- **Secure**: IAM, RBAC, secrets management.
- **Scalable**: Enterprise‑ready hybrid CI/CD.
- **Cost-Optimized**: Optional VM, lean sizing, modular scripts.