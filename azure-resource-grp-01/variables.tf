# Azure subscription where Terraform will create the resource group.
# Set this in terraform.tfvars (do not commit your real values) or with
# the TF_VAR_subscription_id environment variable.
variable "subscription_id" {
  description = "The subscription ID to use for the Azure provider."
  type        = string
  nullable    = false

  # Reject an empty subscription ID before provider initialization.
  validation {
    condition     = length(var.subscription_id) > 0
    error_message = "The subscription ID must not be empty."
  }
}

# Resource group name; override the default in terraform.tfvars if needed.
variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
  default     = "devops-iacc-dev-rg-01"
  nullable    = false

  # Resource group names must be provided as non-empty strings.
  validation {
    condition     = length(var.resource_group_name) > 0
    error_message = "The resource group name must not be empty."
  }
}

# Azure region in which the resource group will be created.
variable "resource_group_location" {
  description = "The location of the resource group to create."
  type        = string
  default     = "eastus"
  nullable    = false

  # Require a non-empty region value.
  validation {
    condition     = length(var.resource_group_location) > 0
    error_message = "The resource group location must not be empty."
  }
}

# Tags applied to the resource group for organization and cost tracking.
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