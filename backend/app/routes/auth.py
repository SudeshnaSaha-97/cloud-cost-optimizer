from fastapi import APIRouter
from pydantic import BaseModel

router = APIRouter()

class LoginRequest(BaseModel):
    username: str
    password: str

@router.post("/login")
def login(request: LoginRequest):
    # Dummy login for MVP
    if request.username == "admin" and request.password == "admin":
        return {"token": "fake-jwt-token"}
    return {"error": "Invalid credentials"}
