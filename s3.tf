resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucketmimbiss"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}