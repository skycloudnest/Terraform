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

resource "azurerm_role_assignment" "role_assignment" {
  for_each = { for idx, role in var.roles : idx => role }

  scope                = each.value.scope
  role_definition_name = each.value.role_name
  principal_id         = each.value.object_id
  principal_type       = each.value.principal_type
}