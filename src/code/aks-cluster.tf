#resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
  
#  subscription_id = var.subscription_id
#  client_id       = var.appId
#  client_secret   = var.password
#  tenant_id       = var.tenant_id 
}

resource "azurerm_resource_group" "default" {
  name     = "aks"
  location = "East US"

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "aks-cluster"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "aks-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "containerRegistryc"
  resource_group_name = azurerm_resource_group.default.name
  location            = azurerm_resource_group.default.location
  sku                 = "Premium"
}
# resource "azurerm_api_management" "apim" {
#   name                = "aks-apimc"
#   location            = azurerm_resource_group.default.location
#   resource_group_name = azurerm_resource_group.default.name
#   publisher_name      = "chejuro"
#   publisher_email     = "julestl@yahoo.fr"

#   sku_name = "Developer_1"
# }
terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount"
    storage_account_name = "backendstoragec"
    container_name       = "backend"
    key                  = "terraform.tfstate"
    access_key = "ldkKRivxYRsW5D+CW1YN/1QlBjrdu04SIIHJXFjBln9/zl8Zkx6AqaL9/FH61C4VGngFSRkw+ZS9+AStJTzcCA=="
  }
}
