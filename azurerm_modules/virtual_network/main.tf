resource "azurerm_virtual_network" "virtual_network" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name

  # Other configurations for the virtual network
}

output "virtual_network_id" {
  description = "ID of the deployed Virtual Network"
  value       = azurerm_virtual_network.virtual_network.id
}
