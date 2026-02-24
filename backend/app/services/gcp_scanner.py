import json
import os
from google.cloud import compute_v1
from app.utils.logger import logger

def list_idle_instances():
    try:
        project = os.getenv("GCP_PROJECT_ID")
        zone = os.getenv("GCP_ZONE", "us-central1-a")
        creds_path = os.getenv("GOOGLE_APPLICATION_CREDENTIALS")
        logger.info(f"Using credentials file: {creds_path}")

        if not os.path.exists(creds_path):
            logger.error(f"Credentials file not found at {creds_path}")
            return []

        with open(creds_path) as f:
            creds = json.load(f)
        project = creds.get("project_id")

        client = compute_v1.InstancesClient()

        instances = []
        logger.info(f"Scanning GCP project {project} in zone {zone}")
        for instance in client.list(project=project, zone=zone):
            if instance.status == "TERMINATED":
                instances.append(instance)
        return instances
    except Exception as e:
        logger.error(f"GCP scan failed: {e}")
        return []
