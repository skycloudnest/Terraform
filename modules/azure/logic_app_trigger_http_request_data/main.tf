terraform {
  required_version = "~> 1.3"

  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.4"
    }
  }

  backend "azurerm" {}
}

provider "azapi" {
}

data "azapi_resource_action" "logicapp_callbackurl" {
  resource_id            = "${var.logic_app_id}/triggers/${var.trigger_name}"
  action                 = "listCallbackUrl"
  type                   = "Microsoft.Logic/workflows/triggers@2018-07-01-preview"
  response_export_values = ["value"]
}