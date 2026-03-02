import axios from "axios";

const api = axios.create({
  // Use relative path so it works in production (Ingress routes /api to backend)
  // and in local dev (React dev server proxy can forward /api to 127.0.0.1:8000).
  baseURL: "/api", // backend FastAPI server
});

api.interceptors.request.use((config) => {
  const token = localStorage.getItem("token");
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export default api;
