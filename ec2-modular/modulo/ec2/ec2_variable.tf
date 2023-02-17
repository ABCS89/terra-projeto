variable "ami" {
  type        = string
  description = "AMI instance"
  default     = "ami-00874d747dde814fa"
}

variable "instance_tipo" {
  type        = string
  description = "tipo da VM"
  default     = ""
}

variable "instance_name" {
  type        = string
  description = "nome da VM"
  default     = ""
}

variable "env" {
  type        = string
  description = "nome do ambiente"
  default     = ""
}

variable "chave" {
  type        = string
  description = "nome da chave"
  default     = ""
}