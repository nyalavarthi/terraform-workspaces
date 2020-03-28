# we provision resources only in aws region which is defined by the variables
provider "aws" {
  region = "us-east-1"
}

# Terraform state
terraform {
  backend "s3" {}
}