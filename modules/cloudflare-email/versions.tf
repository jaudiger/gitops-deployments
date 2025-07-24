terraform {
  required_version = "~> 1.12"

  required_providers {
    # Authentication retrieved from environment variables 'CLOUDFLARE_EMAIL' and 'CLOUDFLARE_API_KEY'
    # Wait Registrar scoped permission (see https://developers.cloudflare.com/fundamentals/api/get-started/account-owned-tokens/#compatibility-matrix) for compatibility, before switching to 'CLOUDFLARE_API_TOKEN'
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5"
    }
  }
}
