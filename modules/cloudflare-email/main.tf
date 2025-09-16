locals {
  forward_actions = [
    for email in var.email_forward_to : {
      type  = "forward"
      value = [email]
    }
  ]
}

# Add email forward addresses
resource "cloudflare_email_routing_address" "this" {
  for_each = toset(var.email_forward_to)

  account_id = var.account_id
  email      = each.key
}

# Add routing rules
resource "cloudflare_email_routing_rule" "this" {
  name    = ""
  zone_id = var.zone_id

  matchers = [{
    type  = "literal"
    field = "to"
    value = "${var.email_local_part}@${var.email_domain_part}"
  }]

  actions = local.forward_actions
}

resource "cloudflare_email_routing_catch_all" "this" {
  name    = ""
  zone_id = var.zone_id

  matchers = [{
    type = "all"
  }]

  actions = local.forward_actions
}
