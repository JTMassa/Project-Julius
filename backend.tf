terraform {
  backend "s3" {
    bucket         = "w7-julio-terra-project"   # Replace with your bucket name
    key            = "env/dev/terraform.tfstate"   # Path inside the bucket
    region         = "us-east-1"                   # Bucket region
    encrypt        = true                          # Enable server-side encryption
    
  }
}