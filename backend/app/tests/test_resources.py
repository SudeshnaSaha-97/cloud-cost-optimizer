from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)


def test_health_check():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json()["status"] == "ok"


def test_get_resources_empty(monkeypatch):
    from app.routes import resources
    # Patch with correct signature
    monkeypatch.setattr(resources, "list_idle_instances", lambda project_id: [])
    monkeypatch.setattr(resources, "estimate_savings", lambda inst: 0.0)

    response = client.get("/api/resources/")
    assert response.status_code == 200
    assert response.json() == []


def test_get_resources_with_fixture(monkeypatch):
    from app.routes import resources

    # Create dynamic dummy instances
    class DummyInstance:
        def __init__(self, id, name, status):
            self.id = id
            self.name = name
            self.status = status

    dummy_instances = [
        DummyInstance(id="1", name="instance-1", status="RUNNING"),
        DummyInstance(id="2", name="instance-2", status="STOPPED"),
    ]

    # Patch with correct signature
    monkeypatch.setattr(resources, "list_idle_instances", lambda project_id: dummy_instances)
    monkeypatch.setattr(resources, "estimate_savings", lambda inst: 0.0 if inst.status == "RUNNING" else 100.0)

    response = client.get("/api/resources/")
    assert response.status_code == 200
    data = response.json()

    # Dynamic assertions
    assert len(data) == len(dummy_instances)
    for i, inst in enumerate(dummy_instances):
        assert data[i]["id"] == inst.id
        assert data[i]["name"] == inst.name
        assert data[i]["status"] == inst.status
        # Savings logic matches our patched function
        expected_savings = 0.0 if inst.status == "RUNNING" else 100.0
        assert data[i]["cost_estimate"] == expected_savings
