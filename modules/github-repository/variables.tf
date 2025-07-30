variable "name" {
  description = "Name of the repository to create."
  type        = string
}

variable "description" {
  description = "Description of the repository."
  type        = string
}

variable "visibility" {
  description = "Visibility of the repository."
  type        = string
  default     = "public"
  nullable    = false

  validation {
    condition     = contains(["public", "private"], var.visibility)
    error_message = "Visibility must be one of 'public' or 'private'."
  }
}

variable "github_topics" {
  description = "List of topics to add to the repository."
  type        = list(string)
  default     = []
  nullable    = false
}

variable "github_actions_secrets" {
  description = "List of secrets to add to GitHub Actions."
  type        = map(string)
  default     = {}
  nullable    = false
}
