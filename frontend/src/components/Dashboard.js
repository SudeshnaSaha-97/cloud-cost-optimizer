import React, { useEffect, useState } from "react";
import api from "../services/api";
import ResourceTable from "./ResourceTable";

function Dashboard() {
  const [resources, setResources] = useState([]);

  useEffect(() => {
    const fetchResources = async () => {
      const response = await api.get("/resources");
      setResources(response.data);
    };
    fetchResources();
  }, []);

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Cloud Cost Dashboard</h1>
      <ResourceTable resources={resources} />
    </div>
  );
}

export default Dashboard;
