data "azurerm_subscription" "current" {
}


resource "azurerm_policy_definition" "policy" {
  name         = "accTestPolicy"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "acceptance test policy definition"

  metadata = <<METADATA
    {
    "category": "General"
    }

METADATA


  policy_rule = <<POLICY_RULE
 {
    "if": {
      "not": {
        "field": "location",
        "in": "[parameters('allowedLocations')]"
      }
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE


  parameters = <<PARAMETERS
 {
    "allowedLocations": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "Allowed locations",
        "strongType": "location"
      },
      "defaultValue": ${jsonencode(var.allowed_locations)}
    }
  }
PARAMETERS

}

resource "azurerm_subscription_policy_assignment" "locations_assignment" {
  name = "locations-assignment"
  policy_definition_id = azurerm_policy_definition.policy.id
  subscription_id = data.azurerm_subscription.current.id
}

resource "azurerm_policy_definition" "policy_vmsizes" {
  name         = "vmSizeTestPolicy"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed VM Sizes"

  metadata = <<METADATA
    {
    "category": "General"
    }

METADATA


  policy_rule = <<POLICY_RULE
 {
    "if": {
      "not": {
        "field": "Microsoft.Compute/virtualMachines/sku.name",
        "in": "[parameters('vmSizes')]"
      }
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE


  parameters = <<PARAMETERS
 {
    "vmSizes": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed vm sizes.",
        "displayName": "Allowed vm sizes",
        "strongType": "vmsizes"
      },
      "defaultValue": ${jsonencode(var.vm_sizes)}
    }
  }
PARAMETERS

}

resource "azurerm_subscription_policy_assignment" "vm_sizes_assignment" {
  name = "vmsizes-assignment"
  policy_definition_id = azurerm_policy_definition.policy_vmsizes.id
  subscription_id = data.azurerm_subscription.current.id
}