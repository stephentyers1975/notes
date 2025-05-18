resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = var.allowed_locations[2]
}
