output "ecr_repository_name" {
  description = "Name of the ECR repository."
  value       = aws_ecr_repository.app.name
}

output "ecr_repository_url" {
  description = "URL of the ECR repository."
  value       = aws_ecr_repository.app.repository_url
}

output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch log group."
  value       = aws_cloudwatch_log_group.app.name
}
