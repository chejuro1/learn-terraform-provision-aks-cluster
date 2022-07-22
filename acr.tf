resource "azurerm_container_registry" "acr" {
  name                =  var.acr
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku                 = "Premium"
}