variable "aws_region" {
  description = "AWS region for Project 3 resources."
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Project name used for AWS resource naming."
  type        = string
  default     = "project3-containerized-app-ecs"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "log_retention_days" {
  description = "CloudWatch log retention period in days."
  type        = number
  default     = 14
}
