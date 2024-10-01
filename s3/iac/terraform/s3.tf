resource "aws_s3_bucket" "my-s3-bucket" {
  tags = {
    Name        = "My bucket"
    region = "eu-central-1"
    Environment = "Dev"
  }
}