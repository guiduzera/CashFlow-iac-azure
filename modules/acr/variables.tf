variable "acr_name" {
  description = "The name of the Azure Container Registry"
  type        = string
  sensitive = false
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Azure Container Registry should be created"
  type        = string
  sensitive = false
}

variable "location" {
  description = "The location of the Azure Container Registry"
  type        = string
  sensitive = false
}

variable "sku" {
  description = "The SKU of the Azure Container Registry"
  type        = string
  sensitive = false
}

variable "tags" {
  description = "A map of tags to assign to the Azure Container Registry"
  type        = map(string)
  default     = {
    Iac         = "True"
    environment = "homolog"
  }
  sensitive = false
}