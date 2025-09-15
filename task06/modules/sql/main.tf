resource "random_password" "sql_admin" {
  length           = 20
  special          = true
  min_numeric      = 2
  min_special      = 2
  min_upper        = 2
  min_lower        = 2
  override_special = "_%@#-"
}

resource "azurerm_mssql_server" "this" {
  name                          = var.sql_server_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.sql_admin_username
  administrator_login_password  = random_password.sql_admin.result
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
  tags                          = var.tags
}

# Allow Azure services
resource "azurerm_mssql_firewall_rule" "allow_azure" {
  name             = var.firewall_rule_azure_services_name
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Allow specific IP
resource "azurerm_mssql_firewall_rule" "allow_specific_ip" {
  name             = var.firewall_rule_specific_ip_name
  server_id        = azurerm_mssql_server.this.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

resource "azurerm_mssql_database" "this" {
  name           = var.sql_db_name
  server_id      = azurerm_mssql_server.this.id
  sku_name       = var.sql_db_sku
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = 50
  zone_redundant = false
  tags           = var.tags
}

# Store username in Key Vault
resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.kv_secret_sql_admin_name
  value        = var.sql_admin_username
  key_vault_id = var.kv_id
}

# Store password in Key Vault
resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.kv_secret_sql_admin_password
  value        = random_password.sql_admin.result
  key_vault_id = var.kv_id
}
