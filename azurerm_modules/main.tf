# Initialize Terraform configuration
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.0"
    }
  }
}

# Configure Azure provider
provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = var.subscription_id
}

# Include module declarations for app_service, virtual_network, and staging_slots
module "app_service" {
  source = "./app_service"
}

module "virtual_network" {
  source = "./virtual_network"
}

module "staging_slots" {
  source = "./staging_slots"
}
