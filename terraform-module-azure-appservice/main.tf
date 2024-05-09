provider "azurerm" {
  features {}
  skip_provider_registration = true
  subscription_id = var.subscription_id
}

resource "azurerm_app_service_plan" "main" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
    capacity = var.service_plan.capacity
  }
}

resource "azurerm_virtual_network" "main" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space

  tags = var.virtual_network_tags
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes
}

### App Service Definition

resource "azurerm_app_service" "main" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.main.id

  site_config {
    always_on                 = true
    dotnet_framework_version  = "v2.0"
    ftps_state                = "FtpsOnly"
    managed_pipeline_mode     = "Integrated"
    use_32_bit_worker_process = true
    windows_fx_version        = "DOTNETCORE|2.1"
  }

  app_settings {
    "WEBSITE_HTTPLOGGING_RETENTION_DAYS" = "7"
    APPINSIGHTS_PROFILERFEATURE_VERSION             = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION             = "1.0.0"
    DiagnosticServices_EXTENSION_VERSION            = "~3"
    }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [azurerm_virtual_network.main]
}

resource "azurerm_app_service_slot" "staging" {
  name                = "staging"
  app_service_name    = azurerm_app_service.main.name
  resource_group_name = var.resource_group_name
}

resource "azurerm_app_service_virtual_network_swift_connection" "main" {
  app_service_id                   = azurerm_app_service.main.id
  subnet_id                       = azurerm_subnet.main.id
  swift_network_settings {
    swift_managed_virtual_network_enabled = true
  }
}
