output "app_service_id" {
  description = "The ID of the deployed App Service."
  value       = azurerm_app_service.example.id
}

output "staging_slot_id" {
  description = "The ID of the staging slot."
  value       = azurerm_app_service_slot.staging.id
}
