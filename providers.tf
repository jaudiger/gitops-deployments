terraform {
  required_version = "~> 1.12"

  # Use Cloudflare R2 as the backend storage for Terraform state
  backend "s3" {
    bucket                      = "terraform-state-bucket"
    key                         = "gitops-deployments/cloudflare/terraform.tfstate"
    region                      = "auto"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
    use_path_style              = true
    endpoints                   = { s3 = "https://98a29df1696812429cda3eae6250269c.eu.r2.cloudflarestorage.com" }
  }

  required_providers {
    # Authentication retrieved from environment variables 'CLOUDFLARE_EMAIL' and 'CLOUDFLARE_API_KEY'
    # Wait Registrar scoped permission (see https://developers.cloudflare.com/fundamentals/api/get-started/account-owned-tokens/#compatibility-matrix) for compatibility, before switching to 'CLOUDFLARE_API_TOKEN'
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}
