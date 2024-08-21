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

  client_id       = "1d5a9622-41e9-454a-b0bf-eaabcf173e89"
  client_secret   = var.client_secret
  tenant_id       = "b61f1e4f-78cc-47e0-961b-d54ee7655ec8"
  subscription_id = "bbfb7373-5c19-4a95-8361-2b79fffd73ce"
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
