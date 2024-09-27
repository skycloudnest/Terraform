variable "operation_id" {
  type = string
  description = "The operation id"
}

variable "description" {
  type = string
  description = "The operation description"
}

variable "http_method" {
  type = string
  description = "The HTTP method. Valid values: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/api_management_api_operation#method"
}

variable "url_template" {
  type = string
  description = "The URL template"
}

variable "operation_display_name" {
  type = string
  description = "The APIM operation display name"
}

variable "api_name" {
  type = string
  description = "The name of API Management API"
}

variable "api_management_name" {
  type        = string
  description = "The name of the APIM instance where the named value should be."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group where the APIM is located."
}

variable "custom_xml_policy_append" {
  type        = string
  description = "Additional xml policies to add to the policy"
  default     = null
}

variable "custom_xml_policy_prepend" {
  type        = string
  description = "Additional xml policies to add to the policy before the default authentification policies are applied"
  default     = null
}

variable "custom_outbound_policy" {
  type        = string
  description = "Additional outbound xml policies"
  default     = null
}

variable "custom_backend_policy" {
  type        = string
  description = "Additional backend xml policies"
  default     = null
}

variable "template_parameters" {
  type = list(object({
    name      = string
    type      = string
    required  = bool
  }))
  default = []
}