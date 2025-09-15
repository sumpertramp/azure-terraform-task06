locals {
  # name_prefix = "cmaz-vf06h1cc-mod6"  # variable'dan geliyor

  rg_name         = format("%s-rg", var.name_prefix)
  sql_server_name = format("%s-sql", var.name_prefix)
  sql_db_name     = format("%s-sql-db", var.name_prefix)
  asp_name        = format("%s-asp", var.name_prefix)
  app_name        = format("%s-app", var.name_prefix)

  # Firewall rule names
  fw_rule_azure_services = "allow-azure-services"
  fw_rule_specific_ip    = "allow-verification-ip" # görevde istenen ad
}
