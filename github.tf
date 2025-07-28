locals {
  # List all the GitHub repositories that need to be managed
  github_repositories = {
    "brainfuck-rs" = {
      description = "An other brainfuck interpreter"
      topics = [
        "rust",
        "brainfuck"
      ]
      deployment = {
        enabled = false
      }
    },
    "bevy-calculator" = {
      description = "Calculator made with Bevy (Wasm)"
      topics = [
        "rust",
        "bevy",
        "ui",
        "wasm"
      ]
      deployment = {
        enabled = true
        domain = {
          name  = "jaudiger.dev"
          owner = false
        }
        subdomains = [
          "bevy-calculator",
        ]
      }
      actions_secrets = {
        "CLOUDFLARE_API_TOKEN"  = cloudflare_account_token.pages_token.value
        "CLOUDFLARE_ACCOUNT_ID" = var.cloudflare_account_id
      }
    },
    "dotfiles" = {
      description = "Those are designed for my use cases ;)"
      topics = [
        "dotfiles",
        "nix",
        "flakes",
        "home-manager",
        "nix-darwin",
      ]
      deployment = {
        enabled = false
      }
    },
    "gitops-deployments" = {
      description = "Source of truth of my deployments"
      topics = [
        "gitops",
        "iac",
        "terraform",
      ]
      deployment = {
        enabled = false
      }
    },
    "personal-website" = {
      description = "The source code of my personal website"
      topics = [
        "static-website",
        "zine",
        "superhtml",
        "supermd",
        "scripty"
      ]
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
      actions_secrets = {
        "CLOUDFLARE_API_TOKEN"  = cloudflare_account_token.pages_token.value
        "CLOUDFLARE_ACCOUNT_ID" = var.cloudflare_account_id
      }
    },
    "reusable-workflows" = {
      description = "Reusable GitHub Actions workflows"
      topics = [
        "github-actions",
        "workflow-call",
      ]
      deployment = {
        enabled = false
      }
    }
  }
}
