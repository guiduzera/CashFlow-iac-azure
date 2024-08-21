terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.93.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "cashflow-rg-production"
    storage_account_name = "cashflowproduction"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  skip_provider_registration = true

  features {
    resource_group {
      prevent_deletion_if_contains_resources = true
    }
  }

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_storage_account" "tfstate" {
  name                            = "cashflow${terraform.workspace}"
  resource_group_name             = "cashflow-rg-${terraform.workspace}"
  location                        = "brazilsouth"
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  allow_nested_items_to_be_public = false

  tags = {
    environment = "staging"
    Iac         = "True"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
