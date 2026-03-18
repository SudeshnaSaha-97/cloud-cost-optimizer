# Cloud SQL DB credentials
cloudsql_db_user     = "appuser"
cloudsql_db_password = "StrongPassword123!"
cloudsql_db_name     = "appdb"

# GCP Service Account JSON
gcp_service_account_json = <<EOT
{
  "type": "service_account",
  "project_id": "cloud-cost-optimizer-488008",
  "private_key_id": "xxxx",
  "private_key": "-----BEGIN PRIVATE KEY-----\n...\n-----END PRIVATE KEY-----\n",
  "client_email": "cloud-cost-optimizer@cloud-cost-optimizer-488008.iam.gserviceaccount.com",
  "client_id": "1234567890",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cloud-cost-optimizer%40cloud-cost-optimizer-488008.iam.gserviceaccount.com"
}
EOT

# Local Postgres credentials
postgres_user     = "postgres"
postgres_password = "password"
postgres_db       = "cloud_cost_db"
