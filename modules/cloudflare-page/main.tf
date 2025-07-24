resource "cloudflare_pages_project" "this" {
  account_id        = var.account_id
  name              = var.name
  production_branch = "main"

  lifecycle {
    # Ignore changes to build_config and deployment_configs
    ignore_changes = [
      build_config,
      deployment_configs
    ]
  }
}

# DNS record for root domain
resource "cloudflare_pages_domain" "root" {
  for_each = var.domain.owner ? toset([var.domain.name]) : toset([])

  account_id   = var.account_id
  project_name = var.name
  name         = each.key
}

resource "cloudflare_dns_record" "root" {
  for_each = var.domain.owner ? toset([var.domain.name]) : toset([])

  zone_id = var.zone_id
  name    = each.key
  type    = "CNAME"
  content = cloudflare_pages_project.this.subdomain
  ttl     = 1 # Automatically managed by Cloudflare
  proxied = true
}

# DNS record for subdomain(s)
resource "cloudflare_pages_domain" "subdomain" {
  for_each = toset(var.subdomains)

  account_id   = var.account_id
  project_name = var.name
  name         = "${each.key}.${var.domain.name}"
}

resource "cloudflare_dns_record" "subdomain" {
  for_each = toset(var.subdomains)

  zone_id = var.zone_id
  name    = "${each.key}.${var.domain.name}"
  type    = "CNAME"
  content = cloudflare_pages_project.this.subdomain
  ttl     = 1 # Automatically managed by Cloudflare
  proxied = true
}
