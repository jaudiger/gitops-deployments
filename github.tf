locals {
  # List all the GitHub repositories that need to be managed
  github_repositories = {
    "brainfuck-gui-rs" = {
      description = "Brainfuck interpreter GUI with Rust + egui (WebAssembly)"
      topics = [
        "rust",
        "egui",
        "ui",
        "webassembly",
        "wasm",
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
    "brainfuck-rs" = {
      description = "An other brainfuck interpreter"
      topics = [
        "rust",
        "brainfuck"
      ]
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
    "containerized-services" = {
      description = "Containerized services for development and testing"
      topics = [
        "service",
        "container",
        "docker",
        "docker-compose",
      ]
    },
    "distributed-job-system-rs" = {
      description = "Example of a distributed job system with Rust"
      topics = [
        "rust",
        "service",
        "container",
        "docker",
        "docker-compose",
      ]
    },
    "divan-bench-tools" = {
      description = "Python scripts for processing and comparing Divan benchmark results"
      topics = [
        "python",
        "divan",
        "benchmark",
      ]
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
    "hello-winxp-zig" = {
      description = "A minimal Windows XP-compatible GUI application written in Zig"
      topics = [
        "zig",
        "win32",
        "windows-xp",
        "cross-compilation",
      ]
    },
    "noalloc-slip-rs" = {
      description = "A Rust crate for encoding and decoding SLIP frames in no-std environments"
      topics = [
        "rust",
        "library",
        "crate",
        "no-std",
        "slip"
      ]
      actions_secrets = {
        "CRATES_IO_API_TOKEN" = var.crates_io_api_token
      }
    },
    "noalloc-vec-rs" = {
      description = "A Rust crate for handling vectors in no-std environments"
      topics = [
        "rust",
        "library",
        "crate",
        "no-std",
        "vec"
      ]
      actions_secrets = {
        "CRATES_IO_API_TOKEN" = var.crates_io_api_token
      }
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
