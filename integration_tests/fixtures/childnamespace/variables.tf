variable "vault_address" {
  description = "Vault Address URL"
  type        = string
}

variable "vault_sub_app_namespace" {
  description = "Vault sub app namespace"
  type        = string
}

variable "enable_vault_secret_kv" {
  description = "enable default kv secrets"
  type        = bool
  default     = false
}
