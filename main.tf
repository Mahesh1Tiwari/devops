module "azurerm_resource_group_name" {
    source = "../module/azurerm_rg"
    azurerm_resource_group_name     = "todoapp-rg"
    azurerm_resource_group_location = "West Europe"

}
module "azurerm_virtual_network_name" {
    depends_on = [ module.azurerm_resource_group_name ]
    source = "../module/azurerm_vnet"
    azurerm_virtual_network_name     = "todoapp-vnet"
    azurerm_resource_group_name      = "todoapp-rg"
    azurerm_resource_group_location  = "West Europe"
    address_space                    = ["10.0.0.0/16"]
}
module "azurerm_subnet_name1" {
    depends_on = [ module.azurerm_virtual_network_name ]
    source = "../module/azurerm_subnet"
    azurerm_subnet_name     = "todoapp-subnet"
    azurerm_resource_group_name = "todoapp-rg"
    azurerm_virtual_network_name  = "todoapp-vnet"
    address_prefixes              = ["10.0.1.0/24"]
}
module "azurerm_subnet_name2" {
    depends_on = [module.azurerm_virtual_network_name]
    source = "../module/azurerm_subnet"
    azurerm_subnet_name     = "todoapp-subnet2"
    azurerm_resource_group_name = "todoapp-rg"
    azurerm_virtual_network_name  = "todoapp-vnet"
    address_prefixes              = ["10.0.2.0/24"]
    }

module "azurerm_public_ip_name1" {
    depends_on = [ module.azurerm_resource_group_name ]
    source = "../module/azurerm_pip"
    azurerm_public_ip_name     = "todoapp-pip1"
    azurerm_resource_group_name = "todoapp-rg"
    azurerm_resource_group_location  = "West Europe"
}
module "azurerm_public_ip_name2" {
    depends_on = [ module.azurerm_resource_group_name ]
    source = "../module/azurerm_pip"
    azurerm_public_ip_name     = "todoapp-pip2"
    azurerm_resource_group_name = "todoapp-rg"
    azurerm_resource_group_location  = "West Europe"
}

module "azurerm_virtual_machine_name" {  
    source = "../module/azurerm_vertual machine"

    vm_name   = "todoapp-vm"
    azurerm_network_interface_name   = "todoapp-nic"
    azurerm_resource_group_name      = "todoapp-rg"
    azurerm_resource_group_location  = "westeurope"
    vm_size                          = "Standard_B1ms"
    admin_username                   = "adminuser"
    admin_password                   = "Shiva@809057"
    os_profile_computer_name         = "todoapp-vm"
    image_publisher                  = "Canonical"
    image_offer                      = "0001-com-ubuntu-server-jammy"
    image_sku                        = "22_04-lts"
    image_version                    = "latest"
    azurerm_subnet_id = "/subscriptions/5550159f-a390-4764-9640-fc8da172b2d3/resourceGroups/todoapp-rg/providers/Microsoft.Network/virtualNetworks/todoapp-vnet/subnets/todoapp-subnet"
    os_disk_name                     = "todoapp-osdisk"
    os_disk_caching                  = "ReadWrite"
    public_ip_address_id = "/subscriptions/5550159f-a390-4764-9640-fc8da172b2d3/resourceGroups/todoapp-rg/providers/Microsoft.Network/publicIPAddresses/todoapp-pip"
    os_disk_create_option            = "FromImage"
    os_disk_managed_disk_type        = "Standard_LRS"
}

module "azurerm_virtual_machine_name2" {  
    source = "../module/azurerm_vertual machine"

    vm_name   = "todoapp-vm2"
    azurerm_network_interface_name   = "todoapp-nic2"
    azurerm_resource_group_name      = "todoapp-rg"
    azurerm_resource_group_location  = "westeurope"
    vm_size                          = "Standard_B1ms"
    admin_username                   = "adminuser"
    admin_password                   = "Shiva@809057"
    os_profile_computer_name         = "todoapp-vm"
    image_publisher                  = "Canonical"
    image_offer                      = "0001-com-ubuntu-server-jammy"
    image_sku                        = "22_04-lts"
    image_version                    = "latest"
    azurerm_subnet_id = "//subscriptions/5550159f-a390-4764-9640-fc8da172b2d3/resourceGroups/todoapp-rg/providers/Microsoft.Network/virtualNetworks/todoapp-vnet/subnets/todoapp-subnet2"
    os_disk_name                     = "todoapp-osdisk2"
    os_disk_caching                  = "ReadWrite"
    public_ip_address_id = "/subscriptions/5550159f-a390-4764-9640-fc8da172b2d3/resourceGroups/todoapp-rg/providers/Microsoft.Network/publicIPAddresses/todoapp-pip2"
    os_disk_create_option            = "FromImage"
    os_disk_managed_disk_type        = "Standard_LRS"
}