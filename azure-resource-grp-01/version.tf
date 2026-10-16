# Pin supported Terraform and AzureRM provider versions for consistent runs.
terraform {
  required_version = ">= 1.16.5, < 2.0.0"

  # Declare the AzureRM provider and its compatible version range.
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5.8.0"
    }
  }
}