terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "backendstoragec"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}