variable "stage_environment" {
  type        = string
  description = "ambiente STAGE"
  default     = "STAGE"
}

variable "region" {
  type        = string
  description = "local de alocação da aplicação do stage"
  default     = "us-east-1"
}

variable "profile" {
  type        = string
  description = "prefil a ser usado"
  default     = "André"
}

variable "stage_instance_type" {
  type        = string
  description = "instancia do stage"
  default     = "t2.micro"
}

variable "stage_instance_name" {
  type        = string
  description = "nome da instancia do stage"
  default     = "STAGE passando pelo app"
}

variable "stage_key_name" {
  type        = string
  description = "nome da chave no stage"
  default     = "stage_key_pair"
}