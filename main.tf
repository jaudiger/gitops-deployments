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
  visibility             = try(each.value.visibility, null)
  github_topics          = try(each.value.topics, null)
  github_actions_secrets = try(each.value.actions_secrets, null)
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

# Ensure each Cloudflare Email redirection exists, and properly configured
module "cloudflare_email" {
  for_each = {
    for key, value in local.cloudflare_emails :
    key => {
      local_part  = split("@", key)[0]
      domain_part = split("@", key)[1]
      forward_to  = value.forward_to
    }
  }
  source = "./modules/cloudflare-email"

  account_id        = var.cloudflare_account_id
  zone_id           = data.cloudflare_zone.domain_zone[each.value.domain_part].zone_id
  email_domain_part = each.value.domain_part
  email_local_part  = each.value.local_part
  email_forward_to  = each.value.forward_to
}
