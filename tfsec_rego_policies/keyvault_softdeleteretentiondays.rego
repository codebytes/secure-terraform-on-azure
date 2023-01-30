package custom.azure.keyvault.softdeleteretentiondays

deny[msg] {
    kv := input.azure.keyvault.vaults[_]
    kv.softdeleteretentiondays.value < 14
    msg := "Key Vault Soft Delete Retention Days is less than 14 days"
}

