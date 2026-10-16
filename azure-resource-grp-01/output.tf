# Expose key resource group attributes after Terraform creates the resource.
output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.this.name
}

# Return the Azure region used by the resource group.
output "resource_group_location" {
  description = "The location of the resource group."
  value       = azurerm_resource_group.this.location
}

# Return the tags applied to the resource group.
output "resource_group_tags" {
  description = "The tags assigned to the resource group."
  value       = azurerm_resource_group.this.tags
}
