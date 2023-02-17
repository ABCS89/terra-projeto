variable "region" {
  type        = string
  description = "Região alocação"
  default     = ""
}

variable "profile" {
  type        = string
  description = "perfil a ser usado"
  default     = "André"
}

variable "app_instance_type" {
  type        = string
  description = "VM do Stage"
  default     = ""
}

variable "app_instance_name" {
  type        = string
  description = "Nome da instancia"
  default     = ""
}

variable "app_environment" {
  type        = string
  description = "nome do ambiente"
  default     = ""
}

variable "key_name" {
  type        = string
  description = "nome da chave"
  default     = "ec2_key_pair"
}
