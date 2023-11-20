
terraform {

  backend "azurerm" {
    resource_group_name  = "aa-prd-scus-hub-1-unmanaged-rg"
    storage_account_name = "automationadminstorage"
    container_name       = "tfstate"
    key                  = "nonprd/hub/scus/stage1/none/sic_mgmt.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.20.0"
    }
  }
  required_version = "1.2.0"
}

provider "azurerm" {
  client_id                  = var.client_id
  client_secret              = var.client_secret
  subscription_id            = var.subscription_id
  tenant_id                  = var.tenant_id
  skip_provider_registration = true
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "azurerm" {
  client_id                  = trimspace(var.client_id)
  client_secret              = trimspace(var.client_secret)
  tenant_id                  = trimspace(var.tenant_id)
  alias                      = "domain-subscription"
  skip_provider_registration = true
  subscription_id            = trimspace(var.subscription_id)
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

provider "azurerm" {
  client_id     = trimspace(var.client_id)
  client_secret = trimspace(var.client_secret)
  tenant_id     = trimspace(var.tenant_id)
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  alias                      = "hub-subscription"
  skip_provider_registration = true
  subscription_id            = trimspace(var.hub_subscription_id)
}

provider "azuread" {
  client_id     = trimspace(var.client_id)
  client_secret = trimspace(var.client_secret)
  tenant_id     = trimspace(var.tenant_id)
}