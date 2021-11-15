# Configure the Hashicorp Vault Provider
# https://registry.terraform.io/providers/hashicorp/vault/latest/docs#provider-arguments
terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
    }
  }
}
provider "vault" {
  # Configuration option
}


