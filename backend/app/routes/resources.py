# backend/app/routes/resources.py
from fastapi import APIRouter
from app.services.gcp_scanner import list_idle_instances
from app.services.savings_calc import estimate_savings
from app.models.resource import Resource
import os

router = APIRouter()

PROJECT_ID = os.getenv("GCP_PROJECT_ID", "cloud-cost-optimizer-488008")

@router.get("/", response_model=list[Resource])
def get_resources():
    instances = list_idle_instances(PROJECT_ID)
    resources = []
    for inst in instances:
        resources.append(Resource(
            id=str(inst.id),
            name=inst.name,
            status=inst.status,
            cost_estimate=estimate_savings(inst, PROJECT_ID)
        ))
    return resources
