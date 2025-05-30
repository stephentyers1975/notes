variable "day" {
  default = "importing"
}

variable "location" {
  default = "uksouth"
}

resource "azurerm_resource_group" "rg" {
  name = "${var.day}-rg"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "vnet" {
  name = "import-vnet"
  address_space = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}

resource "azurerm_subnet" "subnet" {
  name = "default"
  resource_group_name = azurerm_resource_group.rg.name
  address_prefixes = ["10.0.0.0/24"]
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_service_plan" "app_plan" {
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  name = "ASP-importingrg-b901"
  os_type = "Linux"
  sku_name = "F1"
}

resource "azurerm_linux_web_app" "app" {
  name = "import-webapp"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  site_config {
    application_stack {
      node_version = "18-lts"
    }
  }
  
  service_plan_id = azurerm_service_plan.app_plan.id
}