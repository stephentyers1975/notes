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
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0" # Use an appropriate version
    }
  }
  required_version = ">=1.11.0"
}

provider "azurerm" {
  features {

  }
}