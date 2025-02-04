output "ecrUrl" {
  value = aws_ecr_repository.particle41_ecr.repository_url
}

output "particle41RestAPIUrl" {
  value = "http://${aws_lb.eks_alb.dns_name}/api/time"
}
