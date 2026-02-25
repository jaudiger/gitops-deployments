# GitOps Deployments

## Getting Started

This repository is the source of truth for all my public deployments. I'm currently using [Terraform](https://www.hashicorp.com/en/products/terraform) to manage my infrastructure as code.

The Terraform state is not stored locally, and is retrieved from a Cloudflare R2 object storage. To init Terraform, run this command:

```bash
export BACKEND_ACCESS_KEY="..." BACKEND_SECRET_KEY="..."
terraform init -backend-config=access_key=$BACKEND_ACCESS_KEY -backend-config=secret_key=$BACKEND_SECRET_KEY
```

Then, to apply the changes, run this command:

```bash
export CLOUDFLARE_API_KEY="..." CLOUDFLARE_EMAIL="..." TF_VAR_crates_io_api_token="..."
terraform apply
```
