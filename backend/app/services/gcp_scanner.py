# backend/app/services/gcp_scanner.py
from google.cloud import compute_v1
import logging

logger = logging.getLogger("cloud-cost-optimizer")

def list_idle_instances(project_id: str, zone: str = None):
    """
    Fetch idle VM instances from GCP Compute Engine.
    Idle = stopped or terminated instances.
    """
    instances_client = compute_v1.InstancesClient()
    request = compute_v1.AggregatedListInstancesRequest(project=project_id)

    result = instances_client.aggregated_list(request=request)

    idle_instances = []
    for zone_name, response in result:
        if response.instances:
            for inst in response.instances:
                status = inst.status
                if status in ["TERMINATED", "STOPPED"]:
                    idle_instances.append(inst)

    logger.info(f"Found {len(idle_instances)} idle instances")
    return idle_instances
