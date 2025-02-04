resource "aws_ecr_repository" "particle41_ecr" {
  name                 = "${var.project_name}-ecr-${var.env}"
  image_tag_mutability = "MUTABLE"
  force_delete         = true
  image_scanning_configuration {
    scan_on_push = true
  }
}
