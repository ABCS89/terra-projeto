module "app" {
  source            = "../app"
  app_instance_name = var.stage_instance_name
  app_instance_type = var.stage_instance_type
  app_environment   = var.stage_environment
  key_name          = var.stage_key_name
}
