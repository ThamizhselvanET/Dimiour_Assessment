variable "subscription" {
  description = "The name of the subscription."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Virtual Network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space of the Virtual Network."
  type        = list(string)
}

variable "virtual_network_tags" {
  description = "Tags to be applied to the Virtual Network."
  type        = map(string)
}

variable "subnet_name" {
  description = "The name of the Subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the Subnet."
  type        = list(string)
}
