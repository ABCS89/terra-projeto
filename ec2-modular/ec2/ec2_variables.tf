
variable "ami" {
  type    = string
  default = "ami-00874d747dde814fa"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "tags" {
  type = string
  description = "tags"
  default = "EC-na-variable"
}