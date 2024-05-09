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

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}
