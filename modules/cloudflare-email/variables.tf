variable "account_id" {
  description = "Cloudflare account ID."
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "Cloudflare zone ID."
  type        = string
}

variable "email_domain_part" {
  description = "Root domain name."
  type        = string
}

variable "email_local_part" {
  description = "Local part of the email address."
  type        = string
}

variable "email_forward_to" {
  description = "Email forwarding address."
  type        = string
}
