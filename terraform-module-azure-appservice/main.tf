provider "azurerm" {
  features {}
}

resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
  }
}

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space

  tags = var.virtual_network_tags
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_app_service" "example" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.example.id

  site_config {
    # Configure app settings, connection strings, etc.
  }

  app_settings {
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "7"
  }

  site_config {
    always_on = true
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_virtual_network.example]
}

resource "azurerm_app_service_slot" "staging" {
  name                = "staging"
  app_service_name    = azurerm_app_service.example.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id                   = azurerm_app_service.example.id
  subnet_id                       = azurerm_subnet.example.id
  swift_network_settings {
    swift_managed_virtual_network_enabled = true
  }
}
