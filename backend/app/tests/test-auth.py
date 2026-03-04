from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_login_success(auth_payload_success):
    response = client.post("/api/auth/login", json=auth_payload_success)
    assert response.status_code == 200
    data = response.json()
    assert "token" in data
    assert data["token"] == "fake-jwt-token"  # matches backend dummy login


def test_login_failure(auth_payload_failure):
    response = client.post("/api/auth/login", json=auth_payload_failure)
    assert response.status_code == 200
    data = response.json()
    assert "error" in data
    assert data["error"] == "Invalid credentials"
