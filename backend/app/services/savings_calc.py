# backend/app/services/savings_calc.py
from google.cloud import billing_v1
import logging

logger = logging.getLogger("cloud-cost-optimizer")

def estimate_savings(instance, project_id="cloud-cost-optimizer-488008"):
    """
    Estimate savings using Cloud Billing Catalog API.
    Looks up machine type SKU and returns hourly cost.
    """

    # Extract machine type (e.g., "n1-standard-1")
    machine_type = instance.machine_type.split("/")[-1]

    # Initialize Cloud Catalog client
    client = billing_v1.CloudCatalogClient()

    # Fetch all SKUs for Compute Engine
    service_name = "services/6F81-5844-456A"  # Compute Engine service ID
    skus = client.list_skus(parent=service_name)

    # Try to match SKU by machine type
    for sku in skus:
        if machine_type in sku.name or machine_type in sku.description:
            pricing_info = sku.pricing_info[0]
            if pricing_info.pricing_expression.tiered_rates:
                rate = pricing_info.pricing_expression.tiered_rates[0].unit_price
                # Convert to USD (unit_price is a Decimal with nanos)
                cost_per_hour = rate.units + rate.nanos / 1e9
                logger.info(f"Matched {machine_type} → ${cost_per_hour}/hour")
                return round(cost_per_hour * 24 * 30, 2)  # monthly estimate

    logger.warning(f"No SKU match for {machine_type}, defaulting to $10")
    return 10.0
