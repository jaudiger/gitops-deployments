variable "name" {
  description = "Name of the repository to create."
  type        = string
}

variable "description" {
  description = "Description of the repository."
  type        = string
}

variable "github_actions_secrets" {
  description = "List of secrets to add to GitHub Actions."
  type        = map(string)
  default     = {}
}
