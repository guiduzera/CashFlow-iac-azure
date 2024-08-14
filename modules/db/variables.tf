variable "server_name" {
  description = "The name of the Azure Database for MySQL server"
  type        = string
  sensitive = false
}

variable "database_name" {
  description = "The name of the Azure Database for MySQL database"
  type        = string
  sensitive = false
}

variable "resource_group_name" {
  description = "The name of the resource group in which the Azure Database for MySQL server should be created"
  type        = string
  sensitive = false
}

variable "location" {
  description = "The location of the Azure Database for MySQL server"
  type        = string
  sensitive = false
}

variable "zone" {
  description = "The zone of the Azure Database for MySQL server"
  type        = number
  default     = 3
  sensitive = false
}

variable "sku_name" {
  description = "The SKU of the Azure Database for MySQL server"
  type        = string
  sensitive = false
}

variable "administrator_login" {
  description = "The administrator login for the Azure Database for MySQL server"
  type        = string
  sensitive = false
}

variable "administrator_password" {
  description = "The administrator password for the Azure Database for MySQL server"
  type        = string
  sensitive = true
}

variable "charset" {
  description = "The charset of the Azure Database for MySQL database"
  type        = string
  default     = "utf8"
  sensitive = false
}

variable "collation" {
  description = "The collation of the Azure Database for MySQL database"
  type        = string
  default     = "utf8_unicode_ci"
  sensitive = false
}

variable "tags" {
  description = "A map of tags to assign to the Azure Database for MySQL server"
  type        = map(string)
  default     = {
    Iac         = "True"
    environment = "homolog"
  }
  sensitive = false
}