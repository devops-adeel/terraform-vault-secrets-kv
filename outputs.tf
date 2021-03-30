output "backend_path" {
  description = "Secrets Backend Path as output"
  value       = vault_mount.default.path
}

output "identity_group_id" {
  description = "ID of the created Vault Identity Group."
  value       = vault_identity_group.default.id
  sensitive   = true
}
