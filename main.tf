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
  admin_enabled       = true
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

module "appservice" {
  source                          = "./modules/appservice"
  plan_name                       = "cashflow-${terraform.workspace}-plan"
  plan_resource_group_name        = azurerm_resource_group.rg.name
  plan_location                   = azurerm_resource_group.rg.location
  plan_os_type                    = "Linux"
  plan_sku_name                   = "B1"
  app_service_name                = "cashflow-${terraform.workspace}-api"
  app_service_resource_group_name = azurerm_resource_group.rg.name
  docker_image_name               = "cashflowapi"
  docker_registry_url             = module.acr.acr_login_server
  docker_registry_username        = module.acr.acr_admin_username
  docker_registry_password        = module.acr.acr_admin_password
  dotnet_version                  = "8.0"
  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    WEBSITES_PORT                       = "8080"
  }

  tags = azurerm_resource_group.rg.tags
}