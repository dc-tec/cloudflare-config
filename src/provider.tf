provider "cloudflare" {
  api_token = data.vault_secret.cloudflare_api_token.data["api_token"]
}

provider "azurerm" {
  features {
    key_vault {}
  }
}

