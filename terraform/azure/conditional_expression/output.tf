output "rgname" {
  value = azurerm_resource_group.example[*].name
}

output "environment" {
  value = var.environment
}
