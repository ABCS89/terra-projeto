resource "aws_instance" "EC2" {
  ami           = var.ami
  instance_type = var.instance_tipo


  tags = {
    Name        = var.instance_name
    environment = var.env
  }
}

resource "tls_private_key" "ssh_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.chave
  public_key = tls_private_key.ssh_key_pair.public_key_openssh
  depends_on = [
    tls_private_key.ssh_key_pair
  ]
}

resource "local_file" "private_key" {
  content  = tls_private_key.ssh_key_pair.public_key_openssh
  filename = "/home/andre/.ssh/${var.chave}.pem"
}
