resource "aws_s3_bucket" "S3" {
  bucket = var.bucket
  
  tags = {
    Name = "var.bucket_name"
    Environment = "var.env"
    Managedby = "var.manager"
  }
}

resource "aws_s3_bucket_acl" "se_acl" {
  bucket = aws.s3_bucket.S3.id
  acl = var.acl
}

output "instance_public_ip" {
  description = "Public IP addree of the EC2"
  value = aws_instance.EC2.puclic_ip
}