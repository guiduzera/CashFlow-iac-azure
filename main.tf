resource "azurerm_resource_group" "rg" {
  name     = "cashflow-rg-${terraform.workspace}"
  location = "brazilsouth"

  tags = {
    Iac         = "True"
    environment = terraform.workspace
  }
}
