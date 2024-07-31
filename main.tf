resource "azurerm_resource_group" "rg" {
  name     = "cashflow-rg-${terraform.workspace}"
  location = "brazilsouth"

  tags = {
    Iac         = "True"
    environment = terraform.workspace
  }
}

module "acr" {
  source              = "./modules/acr"
  acr_name            = "cashflow${terraform.workspace}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
  tags                = azurerm_resource_group.rg.tags
}
