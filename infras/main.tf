terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 4.39.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.1.0"
    }
  }
  required_version = ">= 1.12.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = "${var.project_name}-rg"
  location = var.azure_region
}

resource "azurerm_kubernetes_cluster" "main" {

  name                = "${var.project_name}-aks"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  dns_prefix          = "${var.project_name}-aks-prefix"

  default_node_pool {
    name                 = "defaultnode"
    auto_scaling_enabled = true
    min_count            = 1
    max_count            = 2
    vm_size              = "Standard_D4s_v3"
  }

  identity {
    type = "SystemAssigned"
  }

  local_account_disabled = false

  azure_active_directory_role_based_access_control {
    tenant_id              = var.tenant_id
    azure_rbac_enabled     = true
    admin_group_object_ids = var.azure_admin_group_id
  }

}
