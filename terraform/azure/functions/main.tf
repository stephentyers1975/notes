locals {
  formatted_name = lower(replace(var.project_name, " ", "_"))
  merged_tags = merge(var.default_tags, var.environment_tags)
  storage_formatted = replace(lower(substr(var.storage_account_name,0,23)),"-","")
  formatted_ports = split(",", var.allowed_ports)
  nsg_rules = [for port in local.formatted_ports : {
    name = "port-${port}"
    port = port
    description = "Allowed traffic on port: ${port}"
  }]
} 

resource "azurerm_resource_group" "rg" {
  name = "${local.formatted_name}-rg"
  location = "uksouth"

  tags = local.merged_tags
}

resource "azurerm_storage_account" "example" {
  name                     = local.storage_formatted
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.merged_tags
}

resource "azurerm_network_security_group" "example" {
  name                = "${local.formatted_name}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  dynamic "security_rule" {
    for_each = local.nsg_rules
    content {
      name = security_rule.value.name
      priority = 100
      direction = "Inbound"
      access = "Allow"
      protocol = "Tcp"
      source_port_range = "*"
      destination_port_range = security_rule.value.port
      source_address_prefix = "*"
      destination_address_prefix = "*"
      description = security_rule.value.description
    }
  }

  tags = {
    environment = "Production"
  }
}