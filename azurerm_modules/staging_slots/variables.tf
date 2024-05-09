variable "location" {
  description = "The Azure region to deploy the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service."
  type        = string
}
