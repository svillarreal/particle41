terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-particle41-dev"
    dynamodb_table = "terraform-remote-state-lock-particle41-dev"
    key            = "particle41/dev/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}