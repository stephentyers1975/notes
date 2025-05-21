output "rgname" {
  value = azurerm_resource_group.rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "nsg_rules" {
  value = local.nsg_rules
}

output "security_rule_name" {
  value = azurerm_network_security_group.example.name
}

output "vm_size" {
  value = local.vm_size
}

output "backup" {
  value = var.backup_name
}

output "credential" {
  value = var.credential
  sensitive = true
}

output "unique_location" {
  value = local.unique_location
}

output "max_cost" {
  value = local.max_cost
}

output "positive" {
  value = local.positive_cost
}

output "resource_tag" {
  value = local.tag_date
}

output "config_loaded" {
  value = jsondecode(local.config_content)
  sensitive = true
}