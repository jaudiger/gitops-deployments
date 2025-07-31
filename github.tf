locals {
  # List all the GitHub repositories that need to be managed
  github_repositories = {
    "brainfuck-rs" = {
      description = "An other brainfuck interpreter"
      topics = [
        "rust",
        "brainfuck"
      ]
    },
    "brainfuck-gui-rs" = {
      description = "Brainfuck interpreter GUI made with egui (Wasm)"
      topics = [
        "rust",
        "egui",
        "ui",
        "wasm"
      ]
      deployment = {
        domain = {
          name  = "jaudiger.dev"
          owner = false
        }
        subdomains = [
          "brainfuck-gui-rs",
        ]
      }
      actions_secrets = {
        "CLOUDFLARE_API_TOKEN"  = cloudflare_account_token.pages_token.value
        "CLOUDFLARE_ACCOUNT_ID" = var.cloudflare_account_id
      }
    },
    "calculator-gui-rs" = {
      description = "Calculator GUI with Rust + Bevy (WebAssembly)"
      topics = [
        "rust",
        "bevy",
        "ui",
        "webassembly",
        "wasm"
      ]
      deployment = {
        domain = {
          name  = "jaudiger.dev"
          owner = false
        }
        subdomains = [
          "calculator-gui-rs",
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
    },
    "gitops-deployments" = {
      description = "Source of truth of my deployments"
      topics = [
        "gitops",
        "iac",
        "terraform",
      ]
    },
    "personal-scripts" = {
      description = "The scripts I use to automate my daily tasks"
      topics = [
        "automation",
        "script",
        "bash",
        "nushell"
      ]
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
    },
    "vscode-dev-containers" = {
      description = "Development containers for Visual Studio Code"
      topics = [
        "vscode",
        "dev-container",
        "development-environment",
      ]
    },
  }
}
