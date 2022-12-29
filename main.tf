# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

#------------------Network-----------------
# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    "Name" = "VPC-terraform"
  }
}

# Create a subnet
 resource "aws_subnet" "public" {
   vpc_id            = aws_vpc.main.id
   cidr_block        = "10.0.1.0/24"
   availability_zone = "us-east-1a"

   tags = {
     "Name" = "Sub-terraform"
   }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IG-terraform"
  }
}

# Route Table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

# Create a security group
resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  vpc_id      = aws_vpc.main.id

  tags = {
    "Name" = "SG-Terraform"
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#---------------------Chave------------------
variable "key_name" {default="chave"}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.example.public_key_openssh}"
}

# Save the private key to a file
resource "local_file" "private_key" {
  content  = tls_private_key.example.public_key_openssh
  filename = "/home/andre/.ssh/chave.pem"
}


#------------------VM------------------------
# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = "ami-0574da719dca65348"
  instance_type = "t2.micro"

  tags = {
    "Name" = "EC2-Terraform"
  }
  
  vpc_security_group_ids = [aws_security_group.ssh.id]
  subnet_id              = aws_subnet.public.id

   # Assign a public IP address
  associate_public_ip_address = true


  # Add a key pair for SSH access
  key_name = "chave"
}