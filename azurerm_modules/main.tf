module "app_service_vnet" {
  source                  = "./app_service_vnet"
  resource_group_name     = var.resource_group_name
  location                = var.location
  app_service_name        = var.app_service_name
  virtual_network         = module.virtual_network.virtual_network_id
  staging_slot_enabled    = var.staging_slot_enabled
}

output "app_service_url" {
  value = module.app_service_vnet.app_service_url
}
