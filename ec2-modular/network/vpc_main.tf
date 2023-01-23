# resource "aws_vpc" "VPC" {
#   cidr_block = var.vpc_cidr
# }

# resource "aws_subnet" "subnet" {
#   vpc_id = aws_vpc.VPC.id
#   cidr_block = var.subnet_cidr
#   availability_zone = var.az
#   map_public_ip_on_launch = var.map_lauch
# }

# resource "aws_internet_gateway" "IG" {
#   vpc_id = aws_vpc.VPC.id
# }

# resource "aws_route_table" "RT" {
#   vpc_id = aws_vpc.VPC.id

#   route {
#     cidr_block = var.rt_cidr
#   }
# }

# resource "aws_route_table_association" "subnet-to-RT" {
#   subnet_id = aws_subnet.subnet.id
#   route_table_id = aws_route_table.RT.id
# }