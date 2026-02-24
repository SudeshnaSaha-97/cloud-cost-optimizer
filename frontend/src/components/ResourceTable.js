import React from "react";

function ResourceTable({ resources }) {
  return (
    <table className="table-auto w-full border-collapse border border-gray-300">
      <thead>
        <tr className="bg-gray-200">
          <th className="border px-4 py-2">ID</th>
          <th className="border px-4 py-2">Name</th>
          <th className="border px-4 py-2">Status</th>
          <th className="border px-4 py-2">Cost Estimate ($)</th>
        </tr>
      </thead>
      <tbody>
        {resources.map((res) => (
          <tr key={res.id}>
            <td className="border px-4 py-2">{res.id}</td>
            <td className="border px-4 py-2">{res.name}</td>
            <td className="border px-4 py-2">{res.status}</td>
            <td className="border px-4 py-2">{res.cost_estimate}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}

export default ResourceTable;
