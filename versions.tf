terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.66.0"
    }
  }

  required_version = ">= 0.14"
  
}



# # Configure the azurerm provider source and version requirements
# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~2.66.0"
#     }
#   }
# }
 
# # Configure the Microsoft Azure Provider
# provider "azurerm" {
#   features {}
 
#  subscription_id = var.subscription_id
#  client_id       = var.client_id 
#  client_secret   = var.client_secret
#  tenant_id       = var.tenant_id 
# }
