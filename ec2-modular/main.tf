provider "aws" {
  region = var.region
  profile = var.profile
}

module "ec2" {
  source = "./ec2"
}

# module "vpc" {
#   source = "./network"
# }
