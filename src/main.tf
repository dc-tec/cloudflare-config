terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.36.0"
    }
  }
  required_version = "1.8.4"
}

data "azurerm_key_vault" "main" {
  name                = "kv-lab-infra-prd-westeu"
  resource_group_name = "rg-dct-prd-westeu"
}

data "azurerm_key_vault_secret" "cloudflare" {
  name         = local.cloudflare_kv_secret_name
  key_vault_id = data.azurerm_key_vault.main.id
}

data "cloudflare_accounts" "main" {
  name = var.account_name
}
