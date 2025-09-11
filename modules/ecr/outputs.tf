output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.my_ecr_repo.repository_url
}

output "aws_ecr_arn" {
  description = "The ARN of the ECR repository"
  value       = aws_ecr_repository.my_ecr_repo.arn
}
