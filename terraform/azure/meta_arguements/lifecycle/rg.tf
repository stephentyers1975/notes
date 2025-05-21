resource "azurerm_resource_group" "example" {
  name     = "${var.environment}-rg"
  location = var.location
  tags = {
    "environment" = var.environment
  }

  lifecycle {
    create_before_destroy = true
    # prevent_destroy = true
    # replace_triggered_by = [ azurerm_storage_account.example ]
    precondition {
      condition = contains(var.allowed_locations, var.location)
      error_message = "Please enter a valid location"
    }
  }
}
