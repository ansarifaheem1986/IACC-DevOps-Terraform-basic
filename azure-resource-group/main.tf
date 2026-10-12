terraform {
  required_version = ">= 1.16.5, < 2.0.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.8.0"
    }
  }
}

provider "azurerm" {
  features {}

  # Replace with your Azure subscription ID.
  subscription_id = "ca96aa9c-57ea-4595-972b-15cf344b72e3"

  # Creating a resource group requires no additional service registrations.
  resource_provider_registrations = "none"
}

resource "azurerm_resource_group" "this" {
  name     = "devops-iacc-dev-rg-01"
  location = "eastus"

  tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    Project     = "IACC-DevOps-IaC"
  }
}

output "resource_group_id" {
  description = "Azure resource ID of the created resource group."
  value       = azurerm_resource_group.this.id
}

output "resource_group_name" {
  description = "Name of the created resource group."
  value       = azurerm_resource_group.this.name
}

output "resource_group_location" {
  description = "Azure region of the created resource group."
  value       = azurerm_resource_group.this.location
}

output "resource_group_tags" {
  description = "Tags applied to the created resource group."
  value       = azurerm_resource_group.this.tags
}