resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
  tags                = var.tags
}

resource "azurerm_linux_web_app" "app" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.asp.id
  https_only          = true
  tags                = var.tags

  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }

  app_settings = {
    WEBSITES_PORT = "8080"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
}
