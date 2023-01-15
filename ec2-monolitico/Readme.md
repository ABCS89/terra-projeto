> <h1>Terraform Basic Study</h1>

> Status: Complete

This is a Terraform script that configures an AWS environment. The script does the following:

1 - Configures the AWS provider with the chosen region.

2 - Creates a VPC with with chosen CIDR block and enables DNS hostnames.

3 - Creates a subnet within the VPC with chosen CIDR in availability the defined zone.

4 - Creates an Internet Gateway and associates it with the VPC.

5 - Creates a Route Table, associates it with the VPC, and adds this Route Table for the Internet Gateway.

6 - Associates the Subnet with the Route Table.

7 - Creates a Securoty Group that allows SSH and HTTP access.

8 - Creates a EC2 Instance(VM) defining Instance size and OS Image.

9 - Creates a S3 bucket including Tgas Name and Environment.

10 - Associates a Key Pair to the EC2 instance.

Please note that the  script assumes that the Key Pair is located in the following directory in line 96.
