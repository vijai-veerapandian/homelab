provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  alias  = "bootstrap"
  region = "us-east-1"
}