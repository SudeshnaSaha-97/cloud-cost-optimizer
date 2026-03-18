output "cluster_outputs" {
  value = module.cluster
  sensitive = true
}

output "workloads_outputs" {
  value = module.workloads
}
