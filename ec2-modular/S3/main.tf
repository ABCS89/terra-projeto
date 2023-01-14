resource "aws_s3_bucket_configuration" "s3" {
  bucket = aws_s3_bucket.s3.id
  rule {
    id = "increase-capacity"
    status = "Enabled"
    prefix = ""
    enabled = true

    transition {
        days = 30
        storage_class = "STANDARD_IA"
    }
  }
}