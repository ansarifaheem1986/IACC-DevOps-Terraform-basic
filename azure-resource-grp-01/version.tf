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

  backend "azurerm" {
    resource_group_name  = "devops-iacc-dev-rg-01"
    storage_account_name = "tfstatefilesdev"
    container_name       = "githubaction"
    key                  = "azure_rg_create_destroy/rg.terraform.state"
  }
}

provider "azurerm" {
  # Required AzureRM provider configuration.
  features {}

  # Provide this value through terraform.tfvars or TF_VAR_subscription_id.
  subscription_id = var.subscription_id
}