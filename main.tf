# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}

#------------------Network-----------------
# Create a VPC
resource "aws_vpc" "VPC_EC2" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    "Name" = "VPC-terraform"
  }
}

# Create a subnet
 resource "aws_subnet" "subnet" {
   vpc_id            = aws_vpc.VPC_EC2.id
   cidr_block        = "10.0.1.0/24"
   availability_zone = "us-east-1a"
   map_public_ip_on_launch = true

   tags = {
     "Name" = "Public-Sub-terraform"
   }
}

# Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.VPC_EC2.id

  tags = {
    "Name" = "IG-terraform"
  }
}

# Create Route table
resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.VPC_EC2.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    "Name" = "RT-terraform"
  }
}

# Associate Subnet with Route table
resource "aws_route_table_association" "Subnet-to-RT" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.RT.id
}

# Create a security group
resource "aws_security_group" "SG" {
  name        = "allow_ssh"
  description = "Allow SSH access"
  vpc_id      = aws_vpc.VPC_EC2.id

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

resource "aws_key_pair" "chave" {
  key_name = "chave"
  public_key = file("/home/andre/.ssh/chave.pub")
}


#------------------VM------------------------
# Create an EC2 instance
resource "aws_instance" "EC2" {
  ami           = "ami-0574da719dca65348"
  instance_type = "t2.micro"

  tags = {
    "Name" = "EC2-Terraform"
  }
  vpc_security_group_ids = [aws_security_group.SG.id]
  subnet_id              = aws_subnet.subnet.id
  security_groups        = [aws_security_group.SG.id]

   # Assign a public IP address
  associate_public_ip_address = true

  # Add a key pair for SSH access
  key_name = "chave"
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.EC2.public_ip
}