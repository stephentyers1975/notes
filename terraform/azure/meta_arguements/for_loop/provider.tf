terraform {
  required_providers {
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