resource "azurerm_resource_group" "rg" {
  name     = "vmss-rg"
  location = "uksouth"

  tags = local.common_tags
}