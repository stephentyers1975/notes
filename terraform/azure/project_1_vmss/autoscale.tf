# create autoscale resource that will decrease the number of instances if the azurerm_orchestrated_scale set cpu usaae is below 10% for 2 minutes
resource "azurerm_monitor_autoscale_setting" "autoscale" {
  name                = "autoscale"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  target_resource_id  = azurerm_orchestrated_virtual_machine_scale_set.vmss_terraform_tutorial.id
  enabled             = true
  profile {
    name = "autoscale"
    capacity {
      default = 3
      minimum = 1
      maximum = 10
    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_orchestrated_virtual_machine_scale_set.vmss_terraform_tutorial.id
        time_grain         = "PT1M" # 1 minute granularity
        statistic          = "Average"
        time_window        = "PT5M" # Over 5 minutes
        operator           = "GreaterThan"
        threshold          = 80 # Scale out when CPU > 80%
        time_aggregation   = "Average"
      }
      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = 1      # Increase by 1 instance
        cooldown  = "PT5M" # 5-minute cooldown
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_orchestrated_virtual_machine_scale_set.vmss_terraform_tutorial.id
        time_grain         = "PT1M" # 1 minute granularity
        statistic          = "Average"
        time_window        = "PT5M" # Over 5 minutes
        operator           = "LessThan"
        threshold          = 10 # Scale in when CPU < 10%
        time_aggregation   = "Average"
      }
      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = 1      # Decrease by 1 instance
        cooldown  = "PT5M" # 5-minute cooldown
      }
    }

  }
}