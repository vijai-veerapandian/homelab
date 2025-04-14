provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

provider "aws" {
  alias   = "bootstrap"
  region  = "us-east-1"
  profile = "terraform"
}

# Create S3 bucket in AWS
resource "aws_s3_bucket" "terraform_state" {
  provider = aws.bootstrap
  bucket   = "mytf-state-app-bucket"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Bootstrap"
  }
}

#  Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Block public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "terraform_state_block" {
  bucket = aws_s3_bucket.terraform_state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
