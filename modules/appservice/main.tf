resource "azurerm_service_plan" "plan" {
  name                = var.plan_name
  resource_group_name = var.plan_resource_group_name
  location            = var.plan_location
  os_type             = var.plan_os_type
  sku_name            = var.plan_sku_name

  tags = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_service_name
  resource_group_name = var.app_service_resource_group_name
  location            = azurerm_service_plan.plan.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
      docker_registry_username = var.docker_registry_username
      docker_registry_password = var.docker_registry_password
      docker_image_name = var.docker_image_name
      docker_registry_url = var.docker_registry_url
    }
  }

  app_settings = var.app_settings

  tags = var.tags
}