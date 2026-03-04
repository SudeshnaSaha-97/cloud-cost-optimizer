from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.routes import resources, auth
from app.utils.logger import logger

app = FastAPI(
    title="Cloud Cost Optimizer - GCP",
    description="""
Cloud Cost Optimizer is a SaaS MVP for identifying idle resources, estimating savings, 
and providing actionable insights across GCP environments.

**Features:**
- Authentication endpoints (`/api/auth/login`)
- Resource scanning (`/api/resources/`)
- Health check (`/`)

Use the interactive docs below to test APIs directly.
    """,
    version="0.1.0",
    contact={
        "name": "Sudeshna Saha",
        "url": "https://github.com/sudeshnasaha",  # replace with your project site if available
        "email": "sudeshna@example.com",
    },
    license_info={
        "name": "MIT License",
        "url": "https://opensource.org/licenses/MIT",
    },
    docs_url="/api/docs",       # Swagger UI
    redoc_url="/api/redoc",     # ReDoc
    openapi_url="/api/openapi.json"
)

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

@app.get("/")
def root_health_check():
    logger.info("Root health check called")
    return {"status": "ok", "message": "Backend healthy"}

@app.get("/api")
def api_index():
    return {
        "resources": "/api/resources",
        "auth_login": "/api/auth/login",
        "health": "/"
    }
