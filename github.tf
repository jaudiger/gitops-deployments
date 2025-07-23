locals {
  # List all the GitHub repositories that need to be managed
  github_repositories = {
    "bevy-calculator" = {
      description = "Bevy calculator (Wasm)"
      deployment = {
        enabled = true
      }
    },
    "dotfiles" = {
      description = "Those are designed for my use cases ;)"
      deployment = {
        enabled = false
      }
    },
    "gitops-deployments" = {
      description = "Source of truth of my deployments"
      deployment = {
        enabled = false
      }
    },
    "personal-website" = {
      description = "The source code of my personal website"
      deployment = {
        enabled = true
      }
    },
    "reusable-workflows" = {
      description = "Reusable GitHub Actions workflows"
      deployment = {
        enabled = false
      }
    }
  }
}
