variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan."
  type        = string
}

variable "app_service_plan_sku_tier" {
  description = "The SKU tier of the App Service Plan."
  type        = string
}

variable "app_service_plan_sku_size" {
  description = "The SKU size of the App Service Plan."
  type        = string
}

variable "service_plan.capacity" {
  description = "The Capacity of the App Service Plan."
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

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}
