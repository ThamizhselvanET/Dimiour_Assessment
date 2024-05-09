# Terraform Azure App Service Module

This Terraform module deploys an Azure App Service within a Virtual Network, including staging slots.

## Usage

```hcl
module "azure_app_service" {
  source                      = "github.com/your_organization/terraform-module-azure-appservice"
  location                    = "East US"
  resource_group_name         = "my-resource-group"
  app_service_plan_name       = "my-app-service-plan"
  app_service_plan_sku_tier   = "Standard"
  app_service_plan_sku_size   = "S1"
  virtual_network_name        = "my-virtual-network"
  virtual_network_address_space = ["10.0.0.0/16"]
  virtual_network_tags        = { environment = "production" }
  subnet_name                 = "my-subnet"
  subnet_address_prefixes     = ["10.0.1.0/24"]
  app_service_name            = "my-app-service"
}
