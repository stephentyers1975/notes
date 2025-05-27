# legacy resource providers - need to test with upgrade
resource "azurerm_app_service_plan" "asp" {
  name                = "${var.prefix}-asp"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "as" {
  name                = "${var.prefix}-webapp"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  app_service_plan_id = "${azurerm_app_service_plan.asp.id}"
}

resource "azurerm_app_service_slot" "slot" {
  name                = "${var.prefix}-staging"
  location            = "${azurerm_resource_group.rg.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  app_service_plan_id = "${azurerm_app_service_plan.asp.id}"
  app_service_name    = "${azurerm_app_service.as.name}"
}

resource "azurerm_app_service_source_control" "scm" {
  app_id   = azurerm_app_service.as.id
  repo_url = "https://github.com/piyushsachdeva/tf-sample-bg"
  branch   = "master"
  use_manual_integration = true
}

resource "azurerm_app_service_source_control_slot" "scm1" {
  slot_id   = azurerm_app_service_slot.slot.id
  repo_url = "https://github.com/stephentyers1975/awesome-terraform"
  branch   = "appServiceSlot_Working_DO_NOT_MERGE"
  use_manual_integration = true
}

resource "azurerm_web_app_active_slot" "active" {
  slot_id = azurerm_app_service_slot.slot.id
}

