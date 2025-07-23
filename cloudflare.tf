# Manage the Cloudflare R2 Bucket
resource "cloudflare_r2_bucket" "terraform_state_bucket" {
  account_id    = var.cloudflare_account_id
  name          = "terraform-state-bucket"
  jurisdiction  = "eu"
  location      = "EEUR"
  storage_class = "Standard"
}

# Create tokens access
resource "cloudflare_account_token" "terraform_state_bucket_token" {
  account_id = var.cloudflare_account_id
  name       = "Terraform State R2 Bucket Account Token"
  policies = [{
    effect = "allow"
    permission_groups = [{
      id = "2efd5506f9c8494dacb1fa10a3e7d5b6"
    }]
    resources = {
      "com.cloudflare.edge.r2.bucket.98a29df1696812429cda3eae6250269c_eu_terraform-state-bucket" = "*"
    }
  }]
}
