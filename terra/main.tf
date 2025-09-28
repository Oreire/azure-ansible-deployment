resource "azurerm_resource_group" "main" {
  name     = "rg-terraform-demo"
  location = "UK South"
}

resource "azurerm_virtual_network" "main" {
  name                = "vnet-terraform-demo"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = "subnet-terraform-demo"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "main" {
  name                = "publicip-terraform-demo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static" # was "Dynamic"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "main" {
  name                = "nic-terraform-demo"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                = "vm-terraform-demo"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  size                = "Standard_B2s"
  admin_username      = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  admin_ssh_key {
    username   = "azureuser"
    # public_key = file("/c/Users/ajayi/.ssh/id_rsa.pub")
    # public_key = file("${path.module}/id_rsa.pub")
    public_key = file(var.ssh_public_key_path)



  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

