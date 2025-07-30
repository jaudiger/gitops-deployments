variable "account_id" {
  description = "Cloudflare account ID."
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "Cloudflare zone ID."
  type        = string
}

variable "name" {
  description = "Name of the repository to create."
  type        = string
}

variable "domain" {
  description = "Root domain name."
  type = object({
    name  = string
    owner = optional(bool, false)
  })
}

variable "subdomains" {
  description = "List of sub-domain names to add as DNS records."
  type        = list(string)
  default     = []
  nullable    = true
}
