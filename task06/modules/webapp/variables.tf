variable "location" { type = string }
variable "resource_group_name" { type = string }
variable "app_service_plan_name" { type = string }
variable "app_name" { type = string }
variable "app_service_plan_sku" { type = string }
variable "dotnet_version" { type = string }

variable "sql_connection_string" {
  description = "ADO.NET connection string"
  type        = string
  sensitive   = true
}

variable "tags" {
  type = map(string)
}
