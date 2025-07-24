locals {
  # List all the GitHub repositories that need to be managed
  github_repositories = {
    "bevy-calculator" = {
      description = "Bevy calculator (Wasm)"
      deployment = {
        enabled = true
        domain = {
          name  = "jaudiger.dev"
          owner = false
        }
        subdomains = [
          "bevy-calculator",
        ],
      }
      github_actions_secrets = {
        "CLOUDFLARE_API_TOKEN"  = cloudflare_account_token.pages_token.value
        "CLOUDFLARE_ACCOUNT_ID" = var.cloudflare_account_id
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
        domain = {
          name  = "jaudiger.dev"
          owner = true
        }
        subdomains = [
          "personal-website",
          "www",
        ],
      }
      github_actions_secrets = {
        "CLOUDFLARE_API_TOKEN"  = cloudflare_account_token.pages_token.value
        "CLOUDFLARE_ACCOUNT_ID" = var.cloudflare_account_id
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
