output "kube_config" {
  description = "Kubeconfig file content for the AKS cluster"
  value       = azurerm_kubernetes_cluster.main.kube_admin_config_raw
  sensitive   = true
}
