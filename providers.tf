terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                   = "eu-west-2"
  shared_credentials_files = ["~/.aws/credentials"]
  # profile                  = "vscode"
}
