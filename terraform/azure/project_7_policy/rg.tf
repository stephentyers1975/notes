resource "azurerm_resource_group" "policy_rg" {
  name     = "rg-policy-definitions"
  location = "eastus" # Choose an appropriate Azure region
}