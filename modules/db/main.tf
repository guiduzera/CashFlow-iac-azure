resource "azurerm_mysql_flexible_server" "server" {
  name                   = var.server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  sku_name               = var.sku_name

  zone = var.zone

  tags = var.tags
}

resource "azurerm_mysql_flexible_server_firewall_rule" "db_firewall_rule" {
  name                = var.firewall_rule_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.server.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}

resource "azurerm_mysql_flexible_database" "database" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.server.name
  charset             = var.charset
  collation           = var.collation
}