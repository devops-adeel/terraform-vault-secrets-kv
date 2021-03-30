output "token" {
  description = "Vault Client Token"
  value       = vault_approle_auth_backend_login.default.client_token
}

output "url" {
  description = "Vault URL Address"
  value       = var.vault_address
}

output "namespace" {
  description = "Vault Namespace"
  value       = "admin/terraform-vault-secrets-kv/"
}

output "path" {
  description = "Vault API Endpoint"
  value       = format("secret/data/%s-%s", local.env, local.service)
}
