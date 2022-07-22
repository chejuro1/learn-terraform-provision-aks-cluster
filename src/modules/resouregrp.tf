resource "azurerm_resource_group" "default" {
  name     = "aks"
  location = "East US"

  tags = {
    environment = "Dev"
  }
}