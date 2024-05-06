resource "azurerm_virtual_network" "vnet01" {
    address_space = [ var.vnetcidr ]
    location = var.location
    name = "vnet01"
    resource_group_name = var.resource_group    
}

resource "azurerm_subnet" "web-subnet" {
    address_prefixes = [ var.websubnetcidr ]
    name = "web-subnet"
    resource_group_name = var.resource_group
    virtual_network_name = azurerm_virtual_network.vnet01.name    
}

resource "azurerm_subnet" "app-subnet" {
    address_prefixes = [ var.appsubnetcidr ]
    name = "app-subnet"
    resource_group_name = var.resource_group
    virtual_network_name = azurerm_virtual_network.vnet01.name    
}

resource "azurerm_subnet" "db-subnet" {
    address_prefixes = [ var.dbsubnetcidr ]
    name = "db-subnet"
    resource_group_name = var.resource_group
    virtual_network_name = azurerm_virtual_network.vnet01.name    
}

