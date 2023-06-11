provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "Test" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "TestVnet" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Test.location
  resource_group_name = azurerm_resource_group.Test.name
}

resource "azurerm_subnet" "TestSubnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.Test.name
  virtual_network_name = azurerm_virtual_network.TestVnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_network_interface" "TestNIC" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.Test.location
  resource_group_name = azurerm_resource_group.Test.name

  ip_configuration {
    name                          = "config"
    subnet_id                     = azurerm_subnet.TestSubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "TestVM" {
  name                  = var.virtual_machine_name
  location              = azurerm_resource_group.Test.location
  resource_group_name   = azurerm_resource_group.Test.name
  vm_size               = var.virtual_machine_size
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "20h2-pro"
    version   = "latest"
  }

  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    enable_automatic_upgrades = true
    provision_vm_agent        = true
  }

  network_interface_ids = [azurerm_network_interface.TestNIC.id]
}