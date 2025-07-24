# Ensure each Cloudflare domain exists, and properly configured
resource "cloudflare_registrar_domain" "this" {
  for_each = local.cloudflare_domains

  account_id  = var.cloudflare_account_id
  domain_name = each.key
  auto_renew  = each.value.auto_renew
  locked      = true
  privacy     = true
}

# Ensure each GitHub repository exists, and properly configured
module "github_repository" {
  for_each = local.github_repositories
  source   = "./modules/github-repository"

  name                   = each.key
  description            = each.value.description
  github_actions_secrets = try(each.value.github_actions_secrets, {})
}

# Ensure each Cloudflare Page exists, and properly configured
module "cloudflare_page" {
  for_each = {
    for key, value in local.github_repositories :
    key => value
    # Only create a Cloudflare Page if the repository has a deployment
    if value.deployment.enabled
  }
  source = "./modules/cloudflare-page"

  account_id = var.cloudflare_account_id
  zone_id    = data.cloudflare_zone.domain_zone[each.value.deployment.domain.name].zone_id
  name       = each.key
  domain     = each.value.deployment.domain
  subdomains = each.value.deployment.subdomains
}
