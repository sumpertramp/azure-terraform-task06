variable "name_prefix" {
  description = "Common prefix/pattern for resource names"
  type        = string
  default     = "cmaz-vf06h1cc-mod6"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US 2"
}

variable "kv_rg_name" {
  description = "Existing Key Vault resource group name"
  type        = string
  default     = "cmaz-vf06h1cc-mod6-kv-rg"
}

variable "kv_name" {
  description = "Existing Key Vault name"
  type        = string
  default     = "cmaz-vf06h1cc-mod6-kv"
}

variable "allowed_ip_address" {
  description = "IP allowed to access SQL Server (e.g. your public IP for dev, then set to verification agent IP)"
  type        = string
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default = {
    Creator = "sumeyye_unal@epam.com"
  }
}

variable "sql_admin_username" {
  description = "SQL admin username (will be saved to Key Vault)"
  type        = string
  default     = "sqladmin-sumeyye"
}

# KV secret names per task parameters
variable "kv_secret_sql_admin_name" {
  type    = string
  default = "sql-admin-name"
}

variable "kv_secret_sql_admin_password" {
  type    = string
  default = "sql-admin-password"
}

# DB SKU per task
variable "sql_db_sku" {
  type    = string
  default = "S2"
}

# App Service Plan SKU per task
variable "app_service_plan_sku" {
  type    = string
  default = "P0v3"
}

variable "dotnet_version" {
  description = "Linux Web App .NET version"
  type        = string
  default     = "8.0"
}
