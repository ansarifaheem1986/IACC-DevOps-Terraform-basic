variable "subscription_id" {
  description = "The subscription ID to use for the Azure provider."
  type        = string
  nullable    = false

  validation {
    condition     = length(var.subscription_id) > 0
    error_message = "The subscription ID must not be empty."
  }
}

variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
  default     = "devops-iacc-dev-rg-01"
  nullable    = false

  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name must not be empty."
  }
}

variable "resource_group_location" {
  description = "The location of the resource group to create."
  type        = string
  default     = "eastus"
  nullable    = false

  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The resource group location must not be empty."
  }
}

variable "tags" {
  description = "A map of tags to assign to the resource group."
  type        = map(string)
  default = {
    Environment = "Dev"
    Project     = "IACC"
    ManagedBy   = "Terraform"
  }
  nullable = false
}