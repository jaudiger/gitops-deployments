# Ensure each GitHub repository exists, and properly configured
module "github_repository" {
  for_each = local.github_repositories
  source   = "./modules/github-repository"

  name                      = each.key
  description               = each.value.description
  static_website_deployment = each.value.deployment.enabled
  github_actions_secrets    = try(each.value.github_actions_secrets, {})
}
