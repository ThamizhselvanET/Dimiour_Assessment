terraform {
  required_providers{
    azurerm = {
      source = "hashicorp/azurerm"
      version = "<=3.80.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "<=2.28.0"
    }
  }
    required_version = ">=0.13"
}
