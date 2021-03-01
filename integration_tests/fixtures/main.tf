locals {
  application_name = "terraform-modules-development-kv"
  env              = "dev"
  service          = "adeel"
}

module "default" {
  source     = "./module"
  entity_ids = [module.vault_approle.entity_id]
}

data "vault_auth_backend" "default" {
  path = "approle"
}

module "vault_approle" {
  source           = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.6.1"
  application_name = local.application_name
  env              = local.env
  service          = local.service
  mount_accessor   = data.vault_auth_backend.default.accessor
}

resource "vault_generic_secret" "default" {
  path = format("secret/%s-%s", local.env, local.service)

  data_json = <<EOT
{
  "integration_test": "fake_password"
}
EOT
}
