variable "resource_group_name" {
  description = "Name of the resource group where resources will be created"
}

variable "location" {
  description = "Azure region where resources will be deployed"
}

variable "app_service_name" {
  description = "Name of the Azure App Service"
}

variable "staging_slot_enabled" {
  description = "Enable staging slots for the App Service"
  type        = bool
  default     = true
}
