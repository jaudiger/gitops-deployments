terraform {
  required_version = "~> 1.12"

  required_providers {
    # Token retrieved from 'gh auth login'
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
