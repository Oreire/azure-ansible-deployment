variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for resource deployment"
  type        = string
  default     = "UK West"
}

variable "vm_size" {
  description = "Size of the Azure Virtual Machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key file"
  type        = string
}

output "vm_public_ip" {
  description = "Public IP address of the Azure VM"
  value       = azurerm_public_ip.main.ip_address
}


output "resource_group" {
  description = "Name of the resource group"
  value       = azurerm_resource_group.main.name
}

