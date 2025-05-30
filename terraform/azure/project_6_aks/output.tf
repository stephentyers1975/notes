output "resource_group_name" {
  value = azurerm_resource_group.rg1.name
}

output "client_id" {
  description = "The application id of AzureAD application created."
  value       = module.ServicePrincipal.client_id
}

output "client_secret" {
  description = "Password for service principal."
  value       = module.ServicePrincipal.client_secret
  sensitive = true

}

output "public_ssh_key_openssh" {
  value = tls_private_key.ssh_key_pair.public_key_openssh
}

output "current_subscription_id_from_client_config" {
  description = "The ID of the Azure subscription currently being used."
  value       = data.azurerm_client_config.current.subscription_id
}