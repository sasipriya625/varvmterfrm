resource "azurerm_virtual_network" "vnet" {
    name = var.vnet
    address_space = [var.cidr_block] 
    location = var.location
    resource_group_name = var.resource_group
    }
resource "azurerm_subnet" "vsub" { 
    name  = var.vsub
    resource_group_name = var.resource_group 
    virtual_network_name = var.vnet
    address_prefixes  = [var.ip_address]
    }
resource "azurerm_network_interface" "nic" { 
    name = var.nic
    location = var.location
    resource_group_name = var.resource_group
ip_configuration {
    name = var.ipconfig 
    subnet_id  = azurerm_subnet.vsub.id
    private_ip_address_allocation = "Dynamic"
    }
}

