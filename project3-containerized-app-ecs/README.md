# Project 3 - Containerized App on ECS Fargate

This project deploys a containerized Python Flask application to AWS ECS Fargate using Docker, Amazon ECR, ECS, an Application Load Balancer, VPC networking, CloudWatch Logs, Terraform, and GitHub Actions.

## Project Goal

Build and deploy a stateless containerized Flask API on AWS ECS Fargate.

## Completed So Far

- Created Project 3 folder structure
- Built Flask API
- Added health check endpoint
- Added CRUD-style project endpoints
- Created Dockerfile
- Built Docker image successfully
- Ran Docker container locally
- Verified API endpoint from container
- Verified Gunicorn logs from container

## Local Endpoints

| Method | Endpoint | Purpose |
|---|---|---|
| GET | / | App metadata |
| GET | /health | Health check endpoint |
| GET | /api/projects | List projects |
| POST | /api/projects | Create project |
| GET | /api/projects/<project_id> | Get project |
| DELETE | /api/projects/<project_id> | Delete project |

## Run Locally with Python

1. Create virtual environment.
2. Activate virtual environment.
3. Install dependencies from app/requirements.txt.
4. Run app/app.py.
5. Test http://localhost:5000/health.

## Run Locally with Docker

Build the image:

docker build -t project3-ecs-flask:local .

Run the container:

docker run --rm -d -p 5000:5000 --name project3-ecs-flask project3-ecs-flask:local

Test:

Invoke-RestMethod http://localhost:5000/health
Invoke-RestMethod http://localhost:5000/
Invoke-RestMethod http://localhost:5000/api/projects

Check logs:

docker logs project3-ecs-flask

Stop the container:

docker stop project3-ecs-flask

## Planned AWS Architecture

User traffic will flow through an Application Load Balancer to an ECS Fargate service running the Flask container.

User -> Application Load Balancer -> ECS Fargate Service -> Flask Container

Container image: Amazon ECR
Logs: CloudWatch Logs
Infrastructure: Terraform
Deployment: GitHub Actions

## Planned AWS Resources

- Amazon ECR repository
- ECS cluster
- ECS task definition
- ECS Fargate service
- Application Load Balancer
- ALB listener
- ALB target group
- VPC
- Public subnets
- Internet gateway
- Route tables
- Security groups
- CloudWatch log group
- GitHub Actions deployment workflow
