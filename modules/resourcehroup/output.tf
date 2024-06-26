output "resource_group_name" {
  value = azurerm_resource_group.azure-stack-rs.name
}

output "location_id" {
  value = azurerm_resource_group.azure-stack-rs.id
}

output "resource_group_location" {
  value = azurerm_resource_group.azure-stack-rs.location
}