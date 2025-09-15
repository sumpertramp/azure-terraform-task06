variable "location" {
  description = "Azure region for SQL resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where SQL resources are deployed"
  type        = string
}

variable "sql_server_name" {
  description = "Name of the Azure SQL logical server"
  type        = string
}

variable "sql_db_name" {
  description = "Name of the Azure SQL Database"
  type        = string
}

variable "sql_admin_username" {
  description = "SQL Server administrator login name"
  type        = string
}

variable "sql_db_sku" {
  description = "SKU of the Azure SQL Database (DTU or vCore SKU)"
  type        = string
}

variable "firewall_rule_azure_services_name" {
  description = "Firewall rule name allowing Azure services (0.0.0.0)"
  type        = string
}

variable "firewall_rule_specific_ip_name" {
  description = "Firewall rule name allowing specific IP"
  type        = string
}

variable "allowed_ip_address" {
  description = "IPv4 address to allow through SQL firewall"
  type        = string
}

variable "kv_id" {
  description = "Resource ID of the existing Key Vault to store secrets"
  type        = string
}

variable "kv_secret_sql_admin_name" {
  description = "Key Vault secret name for the SQL admin username"
  type        = string
}

variable "kv_secret_sql_admin_password" {
  description = "Key Vault secret name for the SQL admin password"
  type        = string
}

variable "tags" {
  description = "Tags to apply to SQL resources"
  type        = map(string)
}

