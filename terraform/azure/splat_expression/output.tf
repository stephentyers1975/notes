output "rgname" {
  value = azurerm_resource_group.example[*].name
}

output "environment" {
  value = var.environment
}

output "demo" {
  value = [for count in local.nsg_rules : count.description]
}

output "splat" {
  value = local.nsg_rules[*]
}

output "selective_splat" {
  value = local.nsg_rules[*].allow_http
}

output "selective_splat2" {
  value = local.nsg_rules[*].allow_http.description
}