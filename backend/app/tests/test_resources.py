from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_health_check():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_get_resources_empty(monkeypatch):
    from app.routes import resources
    monkeypatch.setattr(resources, "list_idle_instances", lambda: [])
    monkeypatch.setattr(resources, "estimate_savings", lambda inst: 0.0)

    response = client.get("/api/resources/")
    assert response.status_code == 200
    assert response.json() == []


def test_get_resources_with_fixture(monkeypatch, dummy_instances, dummy_savings):
    from app.routes import resources
    monkeypatch.setattr(resources, "list_idle_instances", lambda: dummy_instances)
    monkeypatch.setattr(resources, "estimate_savings", dummy_savings)

    response = client.get("/api/resources/")
    assert response.status_code == 200
    data = response.json()

    assert len(data) == 2
    assert data[0]["id"] == "1"
    assert data[0]["name"] == "instance-1"
    assert data[0]["status"] == "RUNNING"
    assert data[0]["cost_estimate"] == 0.0

    assert data[1]["id"] == "2"
    assert data[1]["name"] == "instance-2"
    assert data[1]["status"] == "STOPPED"
    assert data[1]["cost_estimate"] == 100.0
