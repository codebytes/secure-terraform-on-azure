package accurics

azureKeyVaultSoftDeleteRetentionDays[resource.id] {
    resource := input.azurerm_key_vault[_]
    resource.type == "azurerm_key_vault"
    properties := resource.config
    properties.soft_delete_retention_days < 14
}
