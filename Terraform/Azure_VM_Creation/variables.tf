variable "resource_group_name" {
  description = "The name of the Azure resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created"
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Azure virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Azure subnet"
  type        = string
}

variable "network_interface_name" {
  description = "The name of the Azure network interface"
  type        = string
}

variable "admin_username" {
  description = "The username for the VM administrator"
  type        = string
}

variable "admin_password" {
  description = "The password for the VM administrator"
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "computer_name" {
  description = "The computer name for the virtual machine"
  type        = string
}