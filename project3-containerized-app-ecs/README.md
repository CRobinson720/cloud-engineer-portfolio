\# Project 3 - Containerized App on ECS Fargate



This project deploys a containerized Python Flask application to AWS ECS Fargate using Docker, Amazon ECR, Amazon ECS, Application Load Balancer, VPC networking, CloudWatch Logs, Terraform, and GitHub Actions.



\## Live Application



Application Load Balancer URL:



http://p3-ecs-dev-alb-14670194.us-west-2.elb.amazonaws.com



Health check endpoint:



http://p3-ecs-dev-alb-14670194.us-west-2.elb.amazonaws.com/health



Projects API endpoint:



http://p3-ecs-dev-alb-14670194.us-west-2.elb.amazonaws.com/api/projects



\## Project Goal



The goal of this project is to demonstrate container-based cloud deployment skills by building a Flask API, packaging it as a Docker image, pushing it to Amazon ECR, and running it on AWS ECS Fargate behind an Application Load Balancer.



\## Architecture



User traffic flows through an Application Load Balancer to an ECS Fargate service running a Flask container.



Architecture flow:



User -> Application Load Balancer -> ECS Fargate Service -> Flask Container



Supporting services:



\- Amazon ECR stores the Docker container image.

\- Amazon ECS Fargate runs the container without managing servers.

\- Application Load Balancer exposes the app publicly over HTTP.

\- CloudWatch Logs captures application container logs.

\- Terraform provisions the AWS infrastructure.

\- GitHub Actions builds, pushes, deploys, and smoke tests the app.



\## AWS Resources



\- Amazon ECR repository

\- ECR lifecycle policy

\- ECS cluster

\- ECS task definition

\- ECS Fargate service

\- ECS task execution IAM role

\- Application Load Balancer

\- ALB target group

\- ALB HTTP listener

\- VPC

\- Public subnets

\- Internet gateway

\- Public route table

\- Route table associations

\- Security group for the ALB

\- Security group for ECS tasks

\- CloudWatch log group



\## Application Endpoints



| Method | Endpoint | Purpose |

|---|---|---|

| GET | / | Application metadata |

| GET | /health | ALB and ECS health check |

| GET | /api/projects | List projects |

| POST | /api/projects | Create project |

| GET | /api/projects/<project\_id> | Get one project |

| DELETE | /api/projects/<project\_id> | Delete one project |



\## Deployment Validation



The live ECS Fargate deployment was validated with:



Invoke-RestMethod http://p3-ecs-dev-alb-14670194.us-west-2.elb.amazonaws.com/health



Expected result:



\- app: project3-containerized-app-ecs

\- environment: dev

\- status: healthy



The API route was validated with:



Invoke-RestMethod http://p3-ecs-dev-alb-14670194.us-west-2.elb.amazonaws.com/api/projects



Expected result:



\- count: 1

\- project id: project3-containerized-app-ecs

\- platform: AWS ECS Fargate

\- status: in-progress



\## CI/CD Pipeline



GitHub Actions deploys the containerized application to ECS.



Pipeline flow:



1\. Checkout repository

2\. Configure AWS credentials with GitHub OIDC

3\. Log in to Amazon ECR

4\. Build Docker image

5\. Tag image with latest and Git commit SHA

6\. Push Docker image to ECR

7\. Force ECS service deployment

8\. Wait for ECS service stability

9\. Smoke test the ALB /health endpoint



The workflow uses GitHub OIDC to assume an AWS IAM role without storing long-lived AWS access keys in GitHub.



\## Terraform



Terraform is stored in the terraform directory.



Main infrastructure layers:



\- ECR and CloudWatch Logs

\- VPC networking and security groups

\- Application Load Balancer

\- ECS Fargate service and task definition



\## Skills Demonstrated



\- Docker image creation

\- Flask API development

\- Amazon ECR image storage

\- ECS Fargate container orchestration

\- Application Load Balancer routing

\- ALB health checks

\- VPC networking

\- Security group design

\- CloudWatch logging

\- Terraform infrastructure as code

\- GitHub Actions CI/CD

\- GitHub OIDC authentication to AWS

\- Deployment smoke testing

