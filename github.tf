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
      required_status_checks = [
        "rust-format (stable)",
        "rust-lint (stable)",
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
      required_status_checks = [
        "rust-format (stable)",
        "rust-lint (stable)",
        "rust-unit-tests",
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
      required_status_checks = [
        "rust-format (stable)",
        "rust-lint (stable)",
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
      required_status_checks = [
        "docker-lint",
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
      required_status_checks = [
        "docker-lint",
        "rust-format (stable)",
        "rust-lint (stable)",
      ]
    },
    "divan-bench-tools" = {
      description = "Python scripts for processing and comparing Divan benchmark results"
      topics = [
        "python",
        "divan",
        "benchmark",
      ]
      required_status_checks = [
        "python-format",
        "python-lint",
        "python-unit-tests",
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
      required_status_checks = [
        "nix-format (aarch64-darwin, macos-latest)",
        "nix-format (aarch64-linux, ubuntu-24.04-arm)",
        "nix-lint (aarch64-darwin, macos-latest)",
        "nix-lint (aarch64-linux, ubuntu-24.04-arm)",
      ]
    },
    "educational-game-rs" = {
      description = "An educational game built with Rust + Bevy"
      topics = [
        "rust",
        "bevy",
        "game",
      ]
      required_status_checks = [
        "rust-format (stable)",
        "rust-lint (stable)",
      ]
    },
    "gitops-deployments" = {
      description = "Source of truth of my deployments"
      topics = [
        "gitops",
        "iac",
        "terraform",
      ]
      required_status_checks = [
        "terraform-format",
        "terraform-lint",
        "terraform-plan",
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
      required_status_checks = [
        "zig-format",
        "zig-lint",
        "zig-system-test",
      ]
    },
    "kube-zig" = {
      description = "A Kubernetes client library written in Zig"
      topics = [
        "zig",
        "kubernetes",
        "openapi",
        "code-generation",
      ]
      required_status_checks = [
        "zig-format",
        "zig-lint",
        "zig-unit-tests",
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
      required_status_checks = [
        "rust-format (stable)",
        "rust-lint (stable)",
        "rust-unit-tests",
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
      required_status_checks = [
        "rust-format (stable)",
        "rust-lint (stable)",
        "rust-unit-tests",
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
      required_status_checks = [
        "shell-lint",
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
      required_status_checks = [
        "zig-unit-tests",
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
    "dev-containers" = {
      description = "Development containers"
      topics = [
        "dev-container",
        "development-environment",
      ]
      required_status_checks = [
        "shell-lint",
      ]
    },
    "zcodeprism" = {
      description = "A semantic code graph library, CLI, and MCP server written in Zig"
      topics = [
        "zig",
        "tree-sitter",
        "code-analysis",
        "mcp",
        "lsp",
      ]
      required_status_checks = [
        "zig-format",
        "zig-lint",
        "zig-unit-tests",
      ]
    },
  }
}
