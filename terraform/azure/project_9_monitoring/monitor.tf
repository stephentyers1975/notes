resource "azurerm_monitor_action_group" "main" {
  name                = "example-actiongroup"
  resource_group_name = azurerm_resource_group.app_rg.name
  short_name          = "exampleact"

  email_receiver {
    name = "sendtoadmin"
    email_address = var.email_address
  }
}

resource "azurerm_monitor_metric_alert" "example" {
  name                = "example-metricalert"
  resource_group_name = azurerm_resource_group.app_rg.name
  scopes              = [azurerm_linux_virtual_machine.demo_vm.id]
  description         = "Action will be triggered when Average CPu > 60 for 5 minutes"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 60

  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}

resource "azurerm_monitor_metric_alert" "disk" {
  name                = "example-metricalert2"
  resource_group_name = azurerm_resource_group.app_rg.name
  scopes              = [azurerm_linux_virtual_machine.demo_vm.id]
  description         = "Action will be triggered when free disk < 20%"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Available Memory Bytes"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 20

  }

  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}