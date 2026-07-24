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

output "vpc_id" {
  description = "ID of the Project 3 VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = aws_subnet.public[*].id
}

output "alb_security_group_id" {
  description = "Security group ID for the Application Load Balancer."
  value       = aws_security_group.alb.id
}

output "ecs_tasks_security_group_id" {
  description = "Security group ID for ECS Fargate tasks."
  value       = aws_security_group.ecs_tasks.id
}
