resource "azurerm_resource_group" "example" {
  name     = "rg-app-env-region"
  location = "West Europe"
  tags = {
    "CostCenter" = "it"
  }
}
