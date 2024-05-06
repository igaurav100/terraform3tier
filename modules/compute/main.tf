resource "azurerm_network_interface" "web-net-interface" {
    location = var.location
    name = "web-network"
    resource_group_name = var.resource_group
    ip_configuration {
        name = "web-server"
        private_ip_address_allocation = "Dynamic"
        subnet_id = var.web_subnet_id
    }    
}

resource "azurerm_linux_virtual_machine" "web-vm" {
    admin_username = "azureuser"
    admin_password = "*jsy3ad#d4S"
    disable_password_authentication = false
    location = var.location
    name = "web-vm"
    network_interface_ids = [ azurerm_network_interface.web-net-interface.id ]
    resource_group_name = var.resource_group
    size = "Standard_D2s_v3"
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer = "UbuntuServer"
      sku = "18.04-LTS"
      version = "latest"
    }   
}


# App Tier 
resource "azurerm_network_interface" "app-net-interface" {
    location = var.location
    name = "app-network"
    resource_group_name = var.resource_group
    ip_configuration {
        name = "app-server"
        private_ip_address_allocation = "Dynamic"
        subnet_id = var.app_subnet_id
    }    
}

resource "azurerm_linux_virtual_machine" "app-vm" {
    admin_username = "azureuser"
    admin_password = "*jsy3ad#d4S"
    disable_password_authentication = false
    location = var.location
    name = "app-vm"
    network_interface_ids = [ azurerm_network_interface.app-net-interface.id ]
    resource_group_name = var.resource_group
    size = "Standard_D2s_v3"
    os_disk {
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Canonical"
      offer = "UbuntuServer"
      sku = "18.04-LTS"
      version = "latest"
    }   
}