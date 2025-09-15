variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "sql_server_name" { type = string }
variable "sql_db_name" { type = string }
variable "sql_admin_username" { type = string }
variable "sql_db_sku" { type = string }

variable "firewall_rule_azure_services_name" { type = string }
variable "firewall_rule_specific_ip_name" { type = string }
variable "allowed_ip_address" { type = string }

variable "kv_id" { type = string }
variable "kv_secret_sql_admin_name" { type = string }
variable "kv_secret_sql_admin_password" { type = string }

variable "tags" {
  type = map(string)
}
