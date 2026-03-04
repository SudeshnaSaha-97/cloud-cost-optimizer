import pytest

class DummyInstance:
    def __init__(self, id, name, status):
        self.id = id
        self.name = name
        self.status = status

@pytest.fixture
def dummy_instances():
    """Fixture that returns a list of dummy GCP instances."""
    return [
        DummyInstance(id=1, name="instance-1", status="RUNNING"),
        DummyInstance(id=2, name="instance-2", status="STOPPED"),
    ]

@pytest.fixture
def dummy_savings():
    """Fixture that returns a predictable savings estimate."""
    return lambda inst: 100.0 if inst.status == "STOPPED" else 0.0

@pytest.fixture
def auth_payload_success():
    """Fixture for valid login payload."""
    return {"username": "admin", "password": "admin"}

@pytest.fixture
def auth_payload_failure():
    """Fixture for invalid login payload."""
    return {"username": "wrong", "password": "wrong"}
