locals {
  application_name = "terraform-modules-development-kv"
  env              = "dev"
  service          = "integration_test"
}

data "vault_auth_backend" "default" {
  path = "approle"
}

module "default" {
  source     = "./module"
  entity_ids = [module.vault_approle.entity_id]
}

module "vault_approle" {
  source           = "git::https://github.com/devops-adeel/terraform-vault-approle.git?ref=v0.6.1"
  application_name = local.application_name
  env              = local.env
  service          = local.service
  mount_accessor   = data.vault_auth_backend.default.accessor
}

resource "vault_approle_auth_backend_login" "default" {
  backend   = data.vault_auth_backend.default.path
  role_id   = module.vault_approle.approle_id
  secret_id = module.vault_approle.approle_secret
}

resource "vault_generic_secret" "default" {
  path = format("secret/%s-%s", local.env, local.service)

  data_json = <<EOT
{
  "password": "fake_password"
}
EOT
}
