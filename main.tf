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

module "db" {
  source                 = "./modules/db"
  server_name            = "cashflow${terraform.workspace}"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  zone                   = 3
  database_name          = "cashflowdb"
  administrator_login    = "cashflowadmin"
  administrator_password = var.administrator_password
  sku_name               = "B_Standard_B1s"
  charset                = "utf8"
  collation              = "utf8_general_ci"

  tags = azurerm_resource_group.rg.tags
}
