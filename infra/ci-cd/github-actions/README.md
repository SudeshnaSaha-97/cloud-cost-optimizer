# CI/CD – GitHub Actions Workflows

This module automates **build and deploy pipelines** using GitHub Actions. It is designed to be **secure, scalable, and cost‑optimized**, making it recruiter‑ and investor‑friendly.

---

## 🔒 Security
- Uses **GitHub Secrets** to store service account keys.
- IAM roles restrict access to GCP resources.
- No hard‑coded credentials in workflows.

---

## 📈 Scalability
- Stateless workflows triggered on `push` or `pull_request`.
- Parallel jobs for build and deploy.
- Rollback monitoring ensures safe deployments.

---

## 💰 Cost Optimization
- GitHub Actions runners are **pay‑per‑use** (no idle VM costs).
- Artifact Registry caching reduces redundant builds.
- Lean Docker images minimize storage and transfer costs.

---

## 📂 Workflows
- **build.yml** → Builds backend/frontend Docker images and pushes to Artifact Registry.
- **deploy.yml** → Applies Kubernetes manifests to GKE cluster.

---

## ▶️ How to Run
1. Push code to `main` branch.
2. GitHub Actions automatically:
    - Builds Docker images.
    - Pushes them to Artifact Registry.
    - Deploys workloads to GKE.

---

## 📌 Recruiter/Investor Highlights
- **Secure**: IAM + GitHub Secrets.
- **Scalable**: Automated rollouts with rollback monitoring.
- **Cost‑Optimized**: Pay‑per‑use runners, lean builds.
