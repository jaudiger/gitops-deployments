# Enable Email Routing
resource "cloudflare_email_routing_settings" "this" {
  zone_id = var.zone_id
}

resource "cloudflare_email_routing_address" "this" {
  account_id = var.account_id
  email      = var.email_forward_to
}

# Add alias with catch-all behavior
resource "cloudflare_email_routing_rule" "this" {
  name    = ""
  zone_id = var.zone_id

  matchers = [{
    type  = "literal"
    field = "to"
    value = "${var.email_local_part}@${var.email_domain_part}"
  }]

  actions = [{
    type  = "forward"
    value = [cloudflare_email_routing_address.this.email]
  }]
}

resource "cloudflare_email_routing_catch_all" "this" {
  name    = ""
  zone_id = var.zone_id

  matchers = [{
    type = "all"
  }]

  actions = [{
    type  = "forward"
    value = [cloudflare_email_routing_address.this.email]
  }]
}

resource "cloudflare_email_routing_dns" "this" {
  zone_id = var.zone_id
  name    = var.email_domain_part
}
