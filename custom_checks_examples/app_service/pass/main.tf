provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-exampleresources-dev-westeur"
  location = "West Europe"
  tags = {
    "CostCenter" = "it"
  }  
}

resource "azurerm_service_plan" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
  tags = {
    "CostCenter" = "it"
  }

}

resource "azurerm_linux_web_app" "example" {
  name                = "example"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id
  tags = {
    "CostCenter" = "it"
  }

  site_config {}
}
