variable "cloudflare_account_id" {
  description = "Cloudflare account ID."
  type        = string
  default     = "98a29df1696812429cda3eae6250269c"
}

variable "crates_io_api_token" {
  description = "Crates.io API token."
  type        = string
  sensitive   = true
}
