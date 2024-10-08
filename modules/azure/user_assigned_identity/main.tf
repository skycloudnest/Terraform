terraform {
  required_version = "~> 1.3"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.48"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

resource "azurerm_user_assigned_identity" "identity" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
}