data "azurerm_resource_group" "rg" {
  name = var.rg_name
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.prefix}-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/16"]
  security_group_id   = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet" "snet" {
  name                 = "internal"
  virtual_network_name = azurerm_virtual_network.rg.name
  resource_group_name  = azurerm_resource_group.rg.name
  address_prefixes     = ["10.0.1.0/24"]
}
