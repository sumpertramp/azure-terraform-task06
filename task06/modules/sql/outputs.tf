output "sql_server_fqdn" {
  description = "SQL Server FQDN"
  value       = azurerm_mssql_server.this.fully_qualified_domain_name
}

# Sensitive ADO.NET connection string for SQL authentication
output "sql_connection_string" {
  description = "ADO.NET connection string for the provisioned SQL DB"
  value = format(
    "Server=tcp:%s,1433;Initial Catalog=%s;Persist Security Info=False;User ID=%s;Password=%s;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;",
    azurerm_mssql_server.this.fully_qualified_domain_name,
    azurerm_mssql_database.this.name,
    var.sql_admin_username,
    random_password.sql_admin.result
  )
  sensitive = true
}
