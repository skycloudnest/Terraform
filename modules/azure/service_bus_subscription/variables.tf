variable "name" {
  type        = string
  description = "Name of the storage account."
}

variable "topic_id" {
  type        = string
  description = "ID of the topic to subscribe to."
}

variable "max_delivery_count" {
  type        = number
  description = "Maximum number of deliveries."
  default     = 1 # Default portal value.
}

variable "lock_duration" {
  type        = string # ISO 8601
  description = "The lock duration for the subscription."
  default     = "PT1M"
}

variable "requires_session" {
  type        = bool
  description = "Boolean flag which controls whether this Subscription supports the concept of a session."
  default     = false
}

variable "default_message_ttl" {
  type        = string # ISO 8601
  description = "The Default message timespan to live."
  default     = "P14D"
}

variable "dead_lettering_on_message_expiration" {
  type        = bool
  description = "Boolean flag which controls whether the Subscription has dead letter support when a message expires."
  default     = false
}

variable "dead_lettering_on_filter_evaluation_error" {
  type        = bool
  description = "Boolean flag which controls whether the Subscription has dead letter support on filter evaluation exceptions."
  default     = false
}

variable "enable_batched_operations" {
  type        = bool
  description = "Boolean flag which controls whether the Subscription supports batched operations."
  default     = true
}

variable "auto_delete_on_idle" {
  type        = string # ISO 8601
  description = "The idle interval after which the topic is automatically deleted."
  default     = "P10675199DT2H48M5.4775807S"
}

variable "sql_filter_query" {
  type        = string
  description = "Represents a filter written in SQL language-based syntax that to be evaluated against a BrokeredMessage."
  default     = null
}

variable "correlation_filter" {
  type = object({
    id                  = optional(string), //correlation_Id
    label               = optional(string),
    content_type        = optional(string),
    message_id          = optional(string),
    reply_to            = optional(string),
    reply_to_session_id = optional(string),
    session_id          = optional(string),
    to                  = optional(string),
    properties          = optional(any),
  })
  description = "Represents a correlation filter to be evaluated against a BrokeredMessage."
  default     = null
}

variable "forward_to" {
  type        = string
  description = "The name of a Queue or Topic to automatically forward messages to."
  default     = null
}