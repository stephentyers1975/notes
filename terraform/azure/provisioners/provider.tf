terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.4.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.8.0"
    }
  }
  required_version = ">=1.11.0"
}

provider "azurerm" {
  features {

  }
}