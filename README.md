# Cloud Engineer Portfolio

## Overview

This portfolio demonstrates practical cloud engineering skills using AWS, Terraform, GitHub Actions, and serverless architecture.

The portfolio includes a static frontend website hosted on Amazon S3 and delivered through Amazon CloudFront, along with a serverless backend API built with API Gateway, AWS Lambda, and DynamoDB.

The project also includes infrastructure as code, CI/CD automation, remote Terraform state, AWS OIDC authentication, monitoring, alerting, deployment validation, and documentation.

## Portfolio Projects

| Project                             | Description                                                   | README                              |
| ----------------------------------- | ------------------------------------------------------------- | ----------------------------------- |
| Project 1 - Static Website Frontend | Static frontend hosted on S3 and delivered through CloudFront | `project1-static-website/README.md` |
| Project 2 - Serverless Projects API | Serverless CRUD API using API Gateway, Lambda, and DynamoDB   | `project2-serverless-api/README.md` |

## Architecture Summary

The portfolio architecture includes:

* Amazon S3 for static website hosting
* Amazon CloudFront for frontend content delivery
* Amazon API Gateway for HTTP API routing
* AWS Lambda for serverless backend logic
* Amazon DynamoDB for project data storage
* Amazon CloudWatch for metrics, logs, dashboards, and alarms
* Amazon SNS for operational alert notifications
* Terraform for infrastructure provisioning
* GitHub Actions for CI/CD automation
* AWS OIDC for secure GitHub Actions authentication
* S3 remote backend for Terraform state storage

## Live Links

Frontend CloudFront URL:

https://d32097lzgag73x.cloudfront.net

Frontend S3 website endpoint:

http://chaliss-portfolio-site-127214156202.s3-website-us-west-2.amazonaws.com

Backend API endpoint:

https://o3wr0nygvf.execute-api.us-west-2.amazonaws.com/projects

## Core Features

* Static website deployed on AWS
* Serverless backend API
* Full CRUD functionality
* Frontend-to-backend API integration
* Terraform-managed infrastructure
* Remote Terraform state stored in S3
* GitHub Actions CI/CD workflow
* Manual Terraform apply workflow for controlled deployments
* AWS OIDC authentication for GitHub Actions
* Least-privilege IAM deployment access
* CloudWatch monitoring and alarms
* SNS alert notifications
* CloudFront cache invalidation after frontend deployments
* Frontend and backend post-deployment smoke tests

## CI/CD and Deployment

This portfolio uses GitHub Actions to validate and deploy infrastructure.

The workflow includes:

* Terraform format checks
* Terraform validation
* Terraform plan on push and pull request
* Manual Terraform apply through GitHub Actions
* Separate deployment paths for frontend and backend projects
* AWS authentication through GitHub Actions OIDC
* CloudFront cache invalidation after frontend deployment
* Frontend smoke test after Project 1 deployment
* Backend API smoke test after Project 2 deployment

## Deployment Validation

The portfolio includes post-deployment smoke tests to confirm that deployed services are reachable after Terraform applies infrastructure changes.

Validation checks include:

* Frontend smoke test against the live CloudFront website
* Backend smoke test against the live API Gateway endpoint
* CloudFront cache invalidation after frontend deployments
* Manual deployment workflow for controlled Terraform applies
* Separate validation paths for frontend and backend projects

These checks help demonstrate that the deployment pipeline does more than provision infrastructure. It also verifies that the deployed application endpoints are available after changes are released.

## Operations and Monitoring

This portfolio includes operational visibility and deployment improvements to make the infrastructure more production-like.

Operations features include:

* CloudWatch dashboard for API and Lambda visibility
* Lambda error alarm
* Lambda throttle alarm
* Lambda duration alarm
* API Gateway 5XX error alarm
* SNS alert topic for operational notifications
* GitHub Actions deployment workflow with AWS OIDC authentication
* Remote Terraform state stored in S3
* CloudFront cache invalidation after frontend deployments

These additions show that the project is not only deployed, but also monitored, documented, and maintained using cloud engineering best practices.

## Skills Demonstrated

This portfolio demonstrates hands-on experience with:

* AWS cloud infrastructure
* Serverless application architecture
* Infrastructure as Code with Terraform
* CI/CD automation with GitHub Actions
* IAM and least-privilege access
* GitHub Actions OIDC authentication
* API Gateway and Lambda integration
* DynamoDB data persistence
* CloudFront and S3 static website hosting
* CloudWatch monitoring and alerting
* SNS notification workflows
* Post-deployment validation
* Git and GitHub version control
* Technical documentation

## Portfolio Value

This portfolio shows the ability to design, deploy, monitor, and maintain a cloud-based application using modern cloud engineering practices.

It demonstrates more than basic deployment. It includes infrastructure automation, secure CI/CD authentication, operational monitoring, alerting, cache management, smoke testing, and documentation.
