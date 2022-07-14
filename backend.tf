terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount"
    storage_account_name = "backendstoragec"
    container_name       = "backend"
    key                  = "terraform.tfstate"
  }
}
