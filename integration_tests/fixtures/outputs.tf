output "token" {
  value = vault_approle_auth_backend_login.default.client_token
}

output "url" {
  value = var.vault_address
}

output "namespace" {
  value = "admin/terraform-vault-secrets-kv/"
}

output "path" {
  value = format("secret/%s-%s", local.env, local.service)
}
