module "ec2" {
  source        = "../modulo/ec2"
  instance_tipo = var.app_instance_type
  instance_name = var.app_instance_name
  env           = var.app_environment
  chave         = var.key_name
}


# module "vpc_example_simple-vpc" {
#   source  = "terraform-aws-modules/vpc/aws//examples/simple-vpc"
#   version = "3.19.0"

# }