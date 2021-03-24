/**
 * Usage:
 *
 * ```hcl
 *
 * module "vault_kv" {
 *   source      = "git::https://github.com/devops-adeel/terraform-vault-secrets-kv.git?ref=v0.1.0"
 *   entity_ids = [module.vault_approle.entity_id]
 * }
 * ```
 */


locals {
  member_entity_ids = var.entity_ids != [] ? var.entity_ids : [vault_identity_entity.default.id]
  secret_type       = "secret"
}

resource "vault_mount" "default" {
  path        = "secret"
  type        = "kv-v2"
  description = "Default Mount for KV Secrets Engine"
}

data "vault_policy_document" "default" {
  rule {
    path         = "${local.secret_type}/+/{{identity.entity.metadata.env}}-{{identity.entity.metadata.service}}"
    capabilities = ["read"]
    description  = "allow read of static secret object named after metadata keys"
  }
  rule {
    path         = "auth/token/*"
    capabilities = ["create", "read", "update", "delete", "list"]
    description  = "create child tokens"
  }
}

resource "vault_policy" "default" {
  name   = "${local.secret_type}-creds-tmpl"
  policy = data.vault_policy_document.default.hcl
}

resource "vault_identity_group" "default" {
  name              = "${local.secret_type}-creds"
  type              = "internal"
  external_policies = true
  member_entity_ids = local.member_entity_ids
}

resource "vault_identity_group_policies" "default" {
  group_id  = vault_identity_group.default.id
  exclusive = false
  policies = [
    "default",
    vault_policy.default.name,
  ]
}

data "vault_identity_entity" "default" {
  entity_id = vault_identity_entity.default.id
}

resource "vault_identity_entity" "default" {
  name = "${local.secret_type}-creds-default"
  metadata = {
    env     = "dev"
    service = "example"
  }
}
