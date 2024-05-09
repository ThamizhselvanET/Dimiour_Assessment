resource "azurerm_app_service_slot" "staging_slot" {
  name                = "${var.app_service_name}-staging"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_name    = azurerm_app_service.app_service.name

  app_service_name = azurerm_app_service.app_service.name
}
