resource "azurerm_app_service_slot" "staging_slot" {
  count               = var.staging_slot_enabled ? 1 : 0
  name                = "${var.app_service_name}-staging"
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_name    = azurerm_app_service.app_service.name

  # Other configurations for the staging slot
}
