resource "azurerm_resource_group" "rg" {
  name     = "mysql-server-rg"
  location = "uksouth"
}

resource "random_password" "sql_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+" # Customize allowed special characters if needed
  min_upper        = 1
  min_lower        = 1
  min_numeric      = 1
  min_special      = 1
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = "my-sql-server-121275"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladm"
  administrator_login_password = random_password.sql_admin_password.result
}

resource "azurerm_mssql_database" "sampledb" {
  name      = "sampledb"
  server_id = azurerm_mssql_server.sql_server.id
}

resource "azurerm_mssql_firewall_rule" "sql_fwrule" {
  name = "my-sql-server-fw-rule"
  start_ip_address = "82.9.138.189"
  end_ip_address = "82.9.138.189"
  server_id = azurerm_mssql_server.sql_server.id
}


