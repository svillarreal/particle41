resource "aws_ecr_repository" "particle41_ecr" {
  name                 = "${var.project_name}-ecr-${var.env}"
  image_tag_mutability = "MUTABLE"
  force_delete         = true // To make it simpler to delete (just for pracice purpose, not real production scenario)
  image_scanning_configuration {
    scan_on_push = true
  }
}
