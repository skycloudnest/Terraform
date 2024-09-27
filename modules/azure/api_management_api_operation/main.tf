resource "azurerm_api_management_api_operation" "operation" {
  operation_id        = var.operation_id
  api_name            = var.api_name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  display_name        = var.operation_display_name
  method              = var.http_method
  url_template        = var.url_template
  description         = var.description
  
  dynamic "template_parameter" {
    for_each = var.template_parameters

    content {
      name        = template_parameter.value.name
      type        = template_parameter.value.type
      required    = template_parameter.value.required
    }
  }
}

resource "azurerm_api_management_api_operation_policy" "operation-policies" {
  api_name            = var.api_name
  api_management_name = var.api_management_name
  resource_group_name = var.resource_group_name
  operation_id        = var.operation_id

  xml_content = <<XML
<policies>
  <inbound>
  <base />
    %{if var.custom_xml_policy_prepend != null}
      ${var.custom_xml_policy_prepend}
      %{endif}
    %{if var.custom_xml_policy_append != null}
    ${var.custom_xml_policy_append}
    %{endif}
  </inbound>

  <backend>    
    %{if var.custom_backend_policy != null}
    ${var.custom_backend_policy}
    %{else}
    <base />
    %{endif}
  </backend>

  <outbound> 
    <base />
    %{if var.custom_outbound_policy != null}
    ${var.custom_outbound_policy}
    %{endif}
  </outbound>
</policies>
XML
  
  depends_on = [
    azurerm_api_management_api_operation.operation
  ]
}