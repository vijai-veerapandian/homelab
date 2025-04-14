terraform {
  backend "s3" {
    bucket         = "mytf-state-app-bucket"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}