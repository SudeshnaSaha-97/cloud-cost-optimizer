# Backend – FastAPI Service

This module provides the **API layer** for the SaaS MVP:
- **Secure**: JWT‑based authentication, IAM‑based service account integration.
- **Scalable**: Stateless FastAPI app deployed on GKE with autoscaling.
- **Cost‑Optimized**: Lean container image, minimal dependencies, modular services.

## Setup
```bash
cd backend
pip install -r requirements.txt
uvicorn app.main:app --reload
