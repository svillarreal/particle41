terraform {
  backend "s3" {
    bucket         = "terraform-remote-state-${var.project_name}-${var.env}"
    dynamodb_table = "terraform-remote-state-lock-${var.project_name}-${var.env}"
    key            = "${var.project_name}/${var.env}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}