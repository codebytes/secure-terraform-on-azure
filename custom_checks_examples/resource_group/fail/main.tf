resource "azurerm_resource_group" "example" {
  name     = "rg-bad-name"
  location = "West Europe"
  tags = {
    "CostCenter" = "it"
  }
}
