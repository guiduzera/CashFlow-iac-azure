variable "plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "plan_location" {
  description = "The location of the App Service Plan"
  type        = string
}

variable "plan_resource_group_name" {
  description = "The name of the resource group in which the App Service Plan should be created"
  type        = string
}

variable "plan_os_type" {
  description = "The operating system of the App Service Plan"
  type        = string
}

variable "plan_sku_name" {
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "app_service_resource_group_name" {
  description = "The name of the resource group in which the App Service should be created"
  type        = string
}

variable "docker_image_name" {
  description = "The name of the Docker image to deploy to the App Service"
  type        = string
}

variable "docker_registry_url" {
  description = "The URL of the Docker registry"
  type        = string
}

variable "docker_registry_username" {
  description = "The username for the Docker registry"
  type        = string
}

variable "docker_registry_password" {
  description = "The password for the Docker registry"
  type        = string
}

variable "app_settings" {
  description = "A map of app settings to assign to the App Service"
  type        = map(string)
  default     = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
    WEBSITES_PORT                      = "8080"
  }
}

variable "tags" {
  description = "A map of tags to assign to the App Service"
  type        = map(string)
  default     = {
    Iac         = "True"
    environment = "homolog"
  }
}