variable "location" {
  description = "Azure region for App Service resources"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where App Service resources are deployed"
  type        = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_name" {
  description = "Name of the Linux Web App"
  type        = string
}

variable "app_service_plan_sku" {
  description = "SKU of the App Service Plan"
  type        = string
}

variable "dotnet_version" {
  description = "Runtime version for .NET on Linux Web App"
  type        = string
}

variable "sql_connection_string" {
  description = "Sensitive ADO.NET connection string passed from SQL module"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to App Service resources"
  type        = map(string)
}

