resource "azurerm_api_management_named_value" "named_value" {
  for_each            = { for named_value in var.named_values : named_value.name => named_value }
  name                = each.value.name
  resource_group_name = var.resource_group_name
  api_management_name = var.api_management_name
  display_name        = each.value.name
  value               = each.value.value
  secret              = each.value.key_vault_secret_id != null ? true : each.value.encrypt

  dynamic "value_from_key_vault" {
    for_each = each.value.key_vault_secret_id != null ? [1] : []

    content {
      secret_id = each.value.key_vault_secret_id
    }
  }
}