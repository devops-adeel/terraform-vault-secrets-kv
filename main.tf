/**
 * Usage:
 *
 * ```hcl
 *
 * module "vault_static_secrets" {
 *   source      = "git::https://github.com/devops-adeel/terraform-vault-secrets-kv.git"
 * }
 * ```
 */


locals {
  secret_type = "secret"
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
  name                       = "${local.secret_type}-creds"
  type                       = "internal"
  external_policies          = true
  external_member_entity_ids = true
}

resource "vault_identity_group_policies" "default" {
  group_id  = vault_identity_group.default.id
  exclusive = true
  policies = [
    "default",
    vault_policy.default.name,
  ]
}
