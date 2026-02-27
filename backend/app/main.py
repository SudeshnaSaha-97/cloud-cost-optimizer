from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import resources, auth
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("cloud-cost-optimizer")

app = FastAPI(title="Cloud Cost Optimizer - GCP")

# Allow frontend (React) to talk to backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=[
        "http://localhost:3000",
        "http://127.0.0.1:3000"
    ],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register routers
app.include_router(resources.router, prefix="/api/resources", tags=["resources"])
app.include_router(auth.router, prefix="/api/auth", tags=["auth"])

@app.get("/api")
def health_check():
    logger.info("Health check called")
    return {"status": "ok", "message": "API running"}
