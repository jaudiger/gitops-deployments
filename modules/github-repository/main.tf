locals {
  protect_default_branch = coalesce(
    var.repository_policies.protect_default_branch,
    var.fork_from == null
  )
  workflow_permissions      = var.repository_policies.workflows == "read-write" ? "write" : "read"
  can_approve_pull_requests = var.repository_policies.workflows == "read-write"
}

# Manage the GitHub repository
resource "github_repository" "this" {
  name        = var.name
  description = var.description

  fork         = var.fork_from != null
  source_owner = try(var.fork_from.owner, null)
  source_repo  = try(var.fork_from.repo, null)

  visibility = var.visibility

  has_issues   = false
  has_projects = false
  has_wiki     = false

  allow_auto_merge       = true
  delete_branch_on_merge = true
}

# Create a ruleset for main branch protection
resource "github_repository_ruleset" "this" {
  # Private repository rulesets require GitHub Pro, so only public repositories get one
  count = local.protect_default_branch && var.visibility == "public" ? 1 : 0

  name        = "main-branch-protection"
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["~DEFAULT_BRANCH"]
      exclude = []
    }
  }

  bypass_actors {
    actor_id    = "5" # Administrator
    actor_type  = "RepositoryRole"
    bypass_mode = "always"
  }

  rules {
    deletion                = true
    required_linear_history = true
    required_signatures     = true
    non_fast_forward        = true

    pull_request {
      dismiss_stale_reviews_on_push     = true
      required_review_thread_resolution = true
      required_approving_review_count   = 1
    }

    dynamic "required_status_checks" {
      for_each = length(var.required_status_checks) > 0 ? [1] : []

      content {
        dynamic "required_check" {
          for_each = var.required_status_checks

          content {
            context = required_check.value
          }
        }
      }
    }
  }
}

# Enable Dependabot vulnerability alerts
resource "github_repository_vulnerability_alerts" "this" {
  count = var.repository_policies.dependency_alerts ? 1 : 0

  repository = github_repository.this.name
}

# Configure GitHub Actions workflow permissions
resource "github_workflow_repository_permissions" "this" {
  repository                       = github_repository.this.name
  default_workflow_permissions     = local.workflow_permissions
  can_approve_pull_request_reviews = local.can_approve_pull_requests
}

# Add topics to the repository if any
resource "github_repository_topics" "this" {
  count = length(var.github_topics) > 0 ? 1 : 0

  repository = github_repository.this.name
  topics     = var.github_topics
}

# Add secrets for GitHub Actions if any
resource "github_actions_secret" "this" {
  for_each = var.github_actions_secrets

  repository  = github_repository.this.name
  secret_name = each.key
  value       = each.value
}
