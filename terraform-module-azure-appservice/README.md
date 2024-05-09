# Terraform Azure App Service Module

This Terraform module deploys an Azure App Service within a Virtual Network, including staging slots.

## Usage

```hcl
module "azure_app_service" {
  source                      = "github.com/ThamizhselvanET/Dimiour_Assessment/main/terraform-module-azure-appservice"
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


Inputs
location: The Azure region to deploy the resources.
resource_group_name: The name of the resource group.
app_service_plan_name: The name of the App Service Plan.
app_service_plan_sku_tier: The SKU tier of the App Service Plan.
app_service_plan_sku_size: The SKU size of the App Service Plan.
virtual_network_name: The name of the Virtual Network.
virtual_network_address_space: The address space of the Virtual Network.
virtual_network_tags: Tags to be applied to the Virtual Network.
subnet_name: The name of the Subnet.
subnet_address_prefixes: The address prefixes of the Subnet.
app_service_name: The name of the App Service.
Outputs
app_service_id: The ID of the deployed App Service.
staging_slot_id: The ID of the staging slot.
