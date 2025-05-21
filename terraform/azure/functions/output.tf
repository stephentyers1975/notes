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