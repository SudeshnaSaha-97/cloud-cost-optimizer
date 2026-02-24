from dotenv import load_dotenv
import os

# Load environment variables from .env file
load_dotenv()

GCP_PROJECT_ID = os.getenv("GCP_PROJECT_ID", "your-project-id")
GCP_ZONE = os.getenv("GCP_ZONE", "us-central1-a")
GOOGLE_APPLICATION_CREDENTIALS = os.getenv("GOOGLE_APPLICATION_CREDENTIALS")

DB_HOST = os.getenv("DB_HOST", "localhost")
DB_PORT = int(os.getenv("DB_PORT", 5432))
DB_NAME = os.getenv("DB_NAME", "cloud_cost_optimizer")
DB_USER = os.getenv("DB_USER", "postgres")
DB_PASSWORD = os.getenv("DB_PASSWORD", "password")

JWT_SECRET = os.getenv("JWT_SECRET", "changeme")
JWT_ALGORITHM = os.getenv("JWT_ALGORITHM", "HS256")
