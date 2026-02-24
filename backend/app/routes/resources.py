from fastapi import APIRouter
from app.services.gcp_scanner import list_idle_instances
from app.services.savings_calc import estimate_savings
from app.models.resource import Resource

router = APIRouter()

@router.get("/", response_model=list[Resource])
def get_resources():
    instances = list_idle_instances()
    resources = []
    for inst in instances:
        resources.append(Resource(
            id=str(inst.id),
            name=inst.name,
            status=inst.status,
            cost_estimate=estimate_savings(inst)
        ))
    return resources
