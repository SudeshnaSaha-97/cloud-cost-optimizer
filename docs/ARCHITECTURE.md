## 🔄 CI/CD Pipeline Flow (Mermaid Sequence Diagram)

```mermaid
sequenceDiagram
    participant Dev as Developer
    participant GitHub as GitHub Repo
    participant Actions as GitHub Actions
    participant Registry as Artifact Registry
    participant GKE as GKE Cluster
    participant Slack as Slack Channel

    Dev->>GitHub: Push code (frontend/backend)
    GitHub->>Actions: Trigger workflow (build + deploy)
    Actions->>Registry: Build & push Docker images
    Actions->>GKE: Apply Kubernetes manifests
    GKE->>GKE: Rollout deployments (frontend + backend)
    GKE-->>Actions: Rollout status (success/failure)
    Actions->>Slack: Send notification with cluster status
```

---

## ⚖️ CI/CD Comparison – GitHub Actions vs Jenkins

| Feature                | GitHub Actions                                | Jenkins VM (Optional)                          |
|-------------------------|-----------------------------------------------|------------------------------------------------|
| **Security**            | GitHub Secrets + IAM roles, no hard‑coded keys | IAM roles, RBAC, secrets stored in Kubernetes |
| **Scalability**         | Stateless workflows, parallel jobs, auto‑rollback | Enterprise integrations (LDAP, custom agents) |
| **Cost Optimization**   | Pay‑per‑use runners, lean builds, no idle VM costs | Optional VM only when needed, lean sizing     |
| **Ease of Use**         | Native GitHub integration, YAML workflows     | Customizable pipelines, modular shell scripts |
| **Best For**            | Lean startups, MVP deployments, rapid iteration | Enterprises needing hybrid CI/CD flexibility |
| **Deployment Target**   | GKE via Kubernetes manifests                  | GKE via Terraform + Jenkins pipelines         |
| **Maintenance**         | Zero infra overhead (managed by GitHub)       | Requires VM provisioning and patching         |

---

## 🖼️ CI/CD Architecture Diagram (Mermaid)

```mermaid
flowchart LR
    Dev[Developer Pushes Code] --> GitHub[GitHub Repo]

    GitHub --> Actions[GitHub Actions Workflow]
    GitHub --> Jenkins[Jenkins VM Pipeline]

    Actions --> Registry[Artifact Registry]
    Jenkins --> Registry

    Registry --> GKE[GKE Cluster]

    GKE --> FrontendPods[Frontend Pods - React + Nginx]
    GKE --> BackendPods[Backend Pods - FastAPI + Cloud SQL Proxy]

    Actions --> Slack[Slack Notifications]
    Jenkins --> Slack[Slack Notifications]

```

---

## 📌 Recruiter/Investor Highlights
- **GitHub Actions** → Lean, secure, cost‑optimized CI/CD for MVP and startups.
- **Jenkins VM** → Enterprise‑ready flexibility for hybrid CI/CD, optional to avoid unnecessary costs.
- Supporting both demonstrates **scalability and adaptability**: lean for MVP, enterprise‑ready for adoption.  
