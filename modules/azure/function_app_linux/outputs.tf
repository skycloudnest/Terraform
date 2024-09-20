output "name" {
  value = azurerm_linux_function_app.function_app.name
}

output "principal_id" {
  value = var.use_managed_identity ? azurerm_logic_app_workflow.workflow.identity[0].principal_id : null
}
