output "app_service_url" {
  description = "URL of the deployed Azure App Service"
  value       = module.app_service_vnet.app_service_url
}
