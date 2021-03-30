![inspec-test](https://github.com/devops-adeel/terraform-vault-secrets-kv/actions/workflows/terraform-apply.yml/badge.svg)

## Terraform Vault Secrets KV

This terraform module mounts a static secret engine and ties a template ACL
policy to an identity group.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Usage:

```hcl

module "vault_static_secrets" {
  source      = "git::https://github.com/devops-adeel/terraform-vault-secrets-kv.git?ref=v0.2.0"
}
```

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vault_identity_group.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group) | resource |
| [vault_identity_group_policies.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/identity_group_policies) | resource |
| [vault_mount.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.default](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend_path"></a> [backend\_path](#output\_backend\_path) | Secrets Backend Path as output |
| <a name="output_identity_group_id"></a> [identity\_group\_id](#output\_identity\_group\_id) | ID of the created Vault Identity Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
