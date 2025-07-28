# Manage the GitHub repository
resource "github_repository" "this" {
  name        = var.name
  description = var.description

  visibility = "public"

  has_downloads = false
  has_issues    = false
  has_projects  = false
  has_wiki      = false

  delete_branch_on_merge = true
}

# Create a ruleset for main branch protection
resource "github_repository_ruleset" "this" {
  name        = "main-branch-protection"
  repository  = github_repository.this.name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = ["refs/heads/main"]
      exclude = []
    }
  }

  rules {
    deletion                = true
    required_linear_history = true
    non_fast_forward        = true
  }
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

  repository      = github_repository.this.name
  secret_name     = each.key
  plaintext_value = each.value
}
