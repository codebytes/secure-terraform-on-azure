
resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo-${var.env}"
  location = var.location
}

resource "azurerm_storage_account" "state-demo" {
  name                     = "statedemocayers${var.env}"
  resource_group_name      = azurerm_resource_group.state-demo-secure.name
  location                 = azurerm_resource_group.state-demo-secure.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
  
  tags = {
    environment            = var.env
  }
}