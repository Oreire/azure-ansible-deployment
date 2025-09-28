data "azurerm_client_config" "current" {}

output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.main.ip_address
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.main.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.main.name
}

output "subscription_id" {
  description = "The Azure subscription ID"
  value       = data.azurerm_client_config.current.subscription_id
}

