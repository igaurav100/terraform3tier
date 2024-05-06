resource "azurerm_mssql_server" "primary" {
    location = var.location
    name = "primarydbmsnjw"
    resource_group_name = var.name
    version = "12.0"
    administrator_login = "mradmin" 
    administrator_login_password = "Kmsb#mahr34"   
}

resource "azurerm_mssql_database" "mysql" {
    name = "example-db"
    server_id = azurerm_mssql_server.primary.id
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 1
    read_scale     = false
    sku_name       = "S0"
    zone_redundant = false
    # enclave_type = "VBS"
}