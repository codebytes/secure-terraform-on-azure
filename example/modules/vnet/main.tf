data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "snet" {
  name                 = "internal"
  virtual_network_name = azurerm_virtual_network.rg.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.0.1.0/24"]
}