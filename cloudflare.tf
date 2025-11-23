locals {
  # List all the domains that need to be managed
  cloudflare_domains = {
    "jaudiger.dev" = {
      auto_renew = true
    },
  }

  # List all the email addresses that need to be forwarded
  cloudflare_emails = {
    "contact@jaudiger.dev" = {
      forward_to = [
        "jeremy.audiger@icloud.com",
        "jeremy.audiger@outlook.fr",
      ]
    },
  }
}

data "cloudflare_zone" "domain_zone" {
  for_each = local.cloudflare_domains

  filter = {
    name       = each.key
    account_id = var.cloudflare_account_id
  }
}

# Manage the Cloudflare R2 Bucket
resource "cloudflare_r2_bucket" "terraform_state_bucket" {
  account_id    = var.cloudflare_account_id
  name          = "terraform-state-bucket"
  jurisdiction  = "eu"
  location      = "EEUR"
  storage_class = "Standard"
}

# Manage the Cloudflare Bot Management (one per zone)
resource "cloudflare_bot_management" "bot_management" {
  for_each = data.cloudflare_zone.domain_zone

  zone_id            = each.value.zone_id
  ai_bots_protection = "block"
  auto_update_model  = true
  crawler_protection = "enabled"
  enable_js          = true
  fight_mode         = true
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
    resources = jsonencode({
      "com.cloudflare.edge.r2.bucket.98a29df1696812429cda3eae6250269c_eu_terraform-state-bucket" = "*"
    })
  }]
}

resource "cloudflare_account_token" "pages_token" {
  account_id = var.cloudflare_account_id
  name       = "Pages Account Token"
  policies = [{
    effect = "allow"
    permission_groups = [{
      id = "8d28297797f24fb8a0c332fe0866ec89"
    }]
    resources = jsonencode({
      "com.cloudflare.api.account.98a29df1696812429cda3eae6250269c" = "*"
    })
  }]
}
