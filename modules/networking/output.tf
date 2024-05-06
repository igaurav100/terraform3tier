output "network_name" {
  value = azurerm_virtual_network.vnet01.name
}

output "network_id" {
  value = azurerm_virtual_network.vnet01.id
}

output "web_subnet_id" {
  value = azurerm_subnet.web-subnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app-subnet.id
}
