# CI/CD – GitHub Actions & Jenkins

This module automates build and deploy:
- **Secure**: Service account authentication via GitHub Secrets.
- **Scalable**: Automated rollouts with rollback monitoring.
- **Cost‑Optimized**: GitHub Actions for lean CI/CD, optional Jenkins VM for hybrid setups.

## GitHub Actions
- `build.yml` → builds and pushes Docker images.
- `deploy.yml` → deploys workloads to GKE.

## Jenkins
- `Jenkinsfile` + scripts for build/deploy/push.
