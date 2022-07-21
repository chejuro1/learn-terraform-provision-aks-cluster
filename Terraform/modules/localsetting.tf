locals {

  client_config = {
    subscription_id         = data.azurerm_client_config.current_client_config.subscription_id
    tenant_id               = data.azurerm_client_config.current_client_config.tenant_id
    object_id               = data.azurerm_client_config.current_client_config.object_id
    logged_user_objectId    = data.azurerm_client_config.current_client_config.object_id
    logged_aad_app_objectId = data.azurerm_client_config.current_client_config.object_id
    client_id               = data.azurerm_client_config.current_client_config.client_id
  }
}