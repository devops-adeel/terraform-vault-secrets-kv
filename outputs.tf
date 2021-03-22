output "backend_path" {
  description = "Secrets Backend Path as output"
  value       = vault_mount.default.path
}
