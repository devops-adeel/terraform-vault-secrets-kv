# SET A TF WORKSPACE VARIABLE FOR "tf_token" with the TFC API Token
# https://www.terraform.io/docs/providers/tfe/index.html
# Configure the Terraform Enterprise Provider
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
#default = ["devcib", "devet", "devcpbb"


