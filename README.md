# Cloud Engineer Portfolio

This portfolio showcases hands-on AWS cloud engineering projects built with Terraform, Python, and serverless architecture.

## Overview

This portfolio demonstrates practical cloud engineering skills across infrastructure provisioning, static website hosting, 
serverless API development, database integration, and frontend-to-backend communication.

## Architecture

The application uses two main cloud paths:

Frontend delivery:

User Browser → CloudFront → S3 Static Website

Backend API:

User Browser → API Gateway → Lambda → DynamoDB

## Projects
1. Static Portfolio Website

Deployed a static portfolio website on AWS S3 using Terraform, then fronted it with CloudFront for CDN delivery.

Services used:

Amazon S3
Amazon CloudFront
Terraform

Key skills demonstrated:

Infrastructure as Code
Static website hosting
CDN configuration
AWS resource provisioning

2. Serverless Projects API

Built a serverless API on AWS using API Gateway, Lambda, DynamoDB, and Terraform, then integrated it with a live frontend.
Services used:

API Gateway
AWS Lambda
DynamoDB
IAM
Terraform

Key skills demonstrated:

Serverless backend development
REST-style API routing
DynamoDB persistence
IAM permissions
Frontend-to-backend integration
API Endpoints

## Base API URL

https://o3wr0nygvf.execute-api.us-west-2.amazonaws.com

## Endpoints

GET    /projects
POST   /projects
DELETE /projects/{id}

## Tech Stack

AWS
Terraform
Python
JavaScript
HTML/CSS
DynamoDB
API Gateway
Lambda
S3
CloudFront

## What I Learned

Through this project, I practiced building and deploying cloud infrastructure using Terraform, connecting
frontend applications to serverless APIs, managing IAM permissions, debugging CORS issues, and working
with AWS SSO authentication.

## Future Improvements

Add CI/CD with GitHub Actions
Add custom domain with Route 53
Add HTTPS certificate with ACM
Add CloudWatch dashboards and alarms
Add update/edit project functionality




