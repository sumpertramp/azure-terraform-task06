# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

# Read existing Key Vault
data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

module "sql" {
  source = "./modules/sql"

  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sql_server_name     = local.sql_server_name
  sql_db_name         = local.sql_db_name
  sql_admin_username  = var.sql_admin_username
  sql_db_sku          = var.sql_db_sku

  firewall_rule_azure_services_name = local.fw_rule_azure_services
  firewall_rule_specific_ip_name    = local.fw_rule_specific_ip
  allowed_ip_address                = var.allowed_ip_address

  kv_id                        = data.azurerm_key_vault.kv.id
  kv_secret_sql_admin_name     = var.kv_secret_sql_admin_name
  kv_secret_sql_admin_password = var.kv_secret_sql_admin_password

  tags = var.tags
}

module "webapp" {
  source = "./modules/webapp"

  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  app_service_plan_name = local.asp_name
  app_name              = local.app_name
  app_service_plan_sku  = var.app_service_plan_sku
  dotnet_version        = var.dotnet_version

  # Pass sensitive SQL connection string from SQL module
  sql_connection_string = module.sql.sql_connection_string

  tags = var.tags
}
