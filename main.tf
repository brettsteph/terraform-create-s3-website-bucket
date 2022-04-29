terraform {
  # cloud {
  #   organization = "stebdev"

  #   workspaces {
  #     name = "gh-actions-resume"
  #   }
  # }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.10.0"
    }
  }
}
