variable "name" {
  description = "Name of the repository to create."
  type        = string
}

variable "description" {
  description = "Description of the repository."
  type        = string
}

variable "static_website_deployment" {
  description = "Whether to enable static website deployment."
  type        = bool
  default     = false
}

variable "github_actions_secrets" {
  description = "List of secrets to add to GitHub Actions."
  type        = map(string)
  default     = {}
}
