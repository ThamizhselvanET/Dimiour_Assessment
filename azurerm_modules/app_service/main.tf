resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name

  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  # Other configurations for the app service
}

output "app_service_url" {
  description = "URL of the deployed Azure App Service"
  value       = azurerm_app_service.app_service.default_site_hostname
}
