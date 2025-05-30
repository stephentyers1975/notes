output "sql_admin_password" {
  value = random_password.sql_admin_password.result
  sensitive = true
}

output "sql_server" {
  value = azurerm_mssql_server.sql_server.name
}