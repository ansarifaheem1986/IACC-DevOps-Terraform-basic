provider "azurerm" {
  # Required AzureRM provider configuration.
  features {}

  # Provide this value through terraform.tfvars or TF_VAR_subscription_id.
  subscription_id = var.subscription_id
}