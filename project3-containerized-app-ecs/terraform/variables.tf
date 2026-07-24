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

variable "vpc_cidr" {
  description = "CIDR block for the Project 3 VPC."
  type        = string
  default     = "10.30.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets."
  type        = list(string)
  default     = ["10.30.1.0/24", "10.30.2.0/24"]
}

variable "app_port" {
  description = "Container port exposed by the Flask app."
  type        = number
  default     = 5000
}
