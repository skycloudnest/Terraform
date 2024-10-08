variable "location" {
  type        = string
  description = "A datacenter location in Azure."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group."
}

variable "name" {
  type        = string
  description = "Specifies the name of the function app."
}

variable "dotnet_version" {
  type        = string
  description = "Specifies the version of dotnet."
  default     = ""
}

variable "dotnet_isolated" {
  type        = string
  description = "Specifies if it is isolated function app."
  default     = false
}

variable "service_plan_id" {
  type        = string
  description = "The ID of the Service Plan within which to create this Function App."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "ID of a log analytics workspace (optional)."
  default     = null
}

variable "storage_account_name" {
  type        = string
  description = "The backend storage account name which will be used by this Function App (such as the dashboard, logs)."
}

variable "storage_account_access_key" {
  type        = string
  description = " The access key which will be used to access the backend storage account for the Function App."
}

variable "app_settings" {
  type        = map(any)
  description = "The app settings of this app service."
  default     = {}
}

variable "runtime_version" {
  type        = string
  description = "The runtime version associated with the Function App."
  default     = "~4"
}

variable "always_on" {
  type        = bool
  description = "Should the Function App be loaded at all times?"
  default     = false
}

variable "connection_strings" {
  type = list(object({
    name  = string
    type  = string
    value = string
  }))
  description = "Connection strings for the function app."
  default     = []
}

variable "integration_subnet_id" {
  type        = string
  description = "Define the subnet in which the Function App runs."
  default     = null
}

variable "route_all_outbound_traffic" {
  type        = bool
  description = "Defines whether all outbound traffic of the Function App is routed."
  default     = false
}

variable "ip_restrictions" {
  type = list(object({
    ip_address                = optional(string),
    service_tag               = optional(string),
    virtual_network_subnet_id = optional(string),
    name                      = optional(string),
    priority                  = optional(number),
    action                    = optional(string),

    headers = optional(list(object({
      x_azure_fdid      = optional(list(string)),
      x_fd_health_probe = optional(list(string)),
      x_forwarded_for   = optional(list(string)),
      x_forwarded_host  = optional(list(string))
    })))
  }))
  description = "A List of objects representing ip restrictions."
  default     = []
}

variable "use_32_bit_worker" {
  type        = bool
  description = "Should the Linux Web App use a 32-bit worker process."
  default     = true
}

variable "app_scale_limit" {
  type = number
  description = "The number of workers this function app can scale out to. Only applicable to apps on the Consumption and Premium plan."
  default = 200
}

variable "use_managed_identity" {
  type        = bool
  description = "Use Managed Identity for this logic app"
  default     = false
}

variable "user_assigned_identity_ids" {
  description = "List of user-assigned managed identity IDs"
  type        = list(string)
  default     = []
}