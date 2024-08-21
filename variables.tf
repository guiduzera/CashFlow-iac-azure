variable "administrator_password" {
  description = "The administrator password for the Azure Database for MySQL server"
  type        = string
  sensitive   = true
}

variable "acr_admin_password" {
  description = "The admin password for the Azure Container Registry"
  type        = string
  sensitive   = true
}

variable "client_secret" {
  description = "The client secret for the Azure Service Principal"
  type        = string
  sensitive   = true
}