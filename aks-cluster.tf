#resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
  
 subscription_id = var.subscription_id
 client_id       = var.appId
 client_secret   = var.password
 tenant_id       = var.tenant_id 
}

resource "azurerm_resource_group" "default" {
  name     = "aks"
  location = "East US"

  tags = {
    environment = "Demo"
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
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}
