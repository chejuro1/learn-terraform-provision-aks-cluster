# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "2.66.0"
#     }
#   }

#   required_version = ">= 0.14"
  
# }

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
      
  subscription_id = var.subscription_id
  client_id       = var.client_id 
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id 
    }
  }
}

# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}

#   provider "azurerm" {
#   features {}

#   subscription_id = var.subscription_id
#   client_id       = var.client_id 
#   client_secret   = var.client_secret
#   tenant_id       = var.tenant_id 
# }

