\# Project 2 — Serverless Projects API



\## Overview



This project deploys a serverless API on AWS using Terraform and Python.



The API stores portfolio project entries in Amazon DynamoDB and supports create, read, and delete operations. It is integrated with the static portfolio website from Project 1, allowing project information to load dynamically in the browser.



\## Architecture



```text

User Browser

&#x20;    |

&#x20;    v

Amazon API Gateway

&#x20;    |

&#x20;    v

AWS Lambda

&#x20;    |

&#x20;    v

Amazon DynamoDB

```



\## AWS Services Used



\* \*\*Amazon API Gateway\*\* — exposes HTTP API routes

\* \*\*AWS Lambda\*\* — processes API requests using Python

\* \*\*Amazon DynamoDB\*\* — stores portfolio project entries

\* \*\*AWS IAM\*\* — grants Lambda permission to access DynamoDB

\* \*\*Amazon CloudWatch Logs\*\* — receives Lambda execution logs

\* \*\*Amazon S3 remote backend\*\* — stores Terraform state securely



\## Technologies Used



\* Terraform

\* Python

\* AWS CLI

\* GitHub Actions

\* AWS OIDC authentication



\## API Endpoints



Base URL:



```text

https://o3wr0nygvf.execute-api.us-west-2.amazonaws.com

```



Available routes:



| Method | Route            | Purpose                        |

| ------ | ---------------- | ------------------------------ |

| GET    | `/projects`      | Return all portfolio projects  |

| POST   | `/projects`      | Create a new portfolio project |

| DELETE | `/projects/{id}` | Delete a project by ID         |



\## Terraform Resources



This project provisions resources such as:



\* `aws\_dynamodb\_table`

\* `aws\_iam\_role`

\* `aws\_iam\_role\_policy`

\* `aws\_iam\_role\_policy\_attachment`

\* `aws\_lambda\_function`

\* `aws\_apigatewayv2\_api`

\* `aws\_apigatewayv2\_integration`

\* `aws\_apigatewayv2\_route`

\* `aws\_apigatewayv2\_stage`

\* `aws\_lambda\_permission`



\## Key Features



\* Serverless API architecture

\* Python-based Lambda handler

\* DynamoDB persistence

\* HTTP API routes for create, read, and delete operations

\* CORS configuration for browser-based requests

\* IAM permissions for Lambda-to-DynamoDB access

\* Remote Terraform state in S3

\* GitHub Actions validation and manual deployment workflow

\* AWS OIDC authentication without long-lived GitHub secrets



\## Local Deployment



Authenticate with AWS SSO:



```powershell

aws sso login --profile dev

```



Set the AWS profile for the current PowerShell session:



```powershell

$env:AWS\_PROFILE="dev"

```



Move into this project folder:



```powershell

cd C:\\Users\\crobi\\cloud-engineer-portfolio\\project2-serverless-api

```



Initialize Terraform:



```powershell

terraform init

```



Preview infrastructure changes:



```powershell

terraform plan

```



Apply infrastructure changes:



```powershell

terraform apply

```



\## GitHub Actions Deployment



This project can also be deployed manually from GitHub Actions:



```text

GitHub Repository

&#x20;   → Actions

&#x20;   → Terraform CI/CD

&#x20;   → Run workflow

&#x20;   → Select project2-serverless-api

&#x20;   → Run workflow

```



GitHub Actions authenticates to AWS through OIDC and assumes a scoped IAM role. No long-lived AWS access keys are stored in GitHub.



\## Testing the API



\### Return All Projects



```powershell

Invoke-RestMethod `

&#x20; -Uri "https://o3wr0nygvf.execute-api.us-west-2.amazonaws.com/projects" `

&#x20; -Method GET

```



\### Create a Project



```powershell

Invoke-RestMethod `

&#x20; -Uri "https://o3wr0nygvf.execute-api.us-west-2.amazonaws.com/projects" `

&#x20; -Method POST `

&#x20; -ContentType "application/json" `

&#x20; -Body '{"name":"Serverless Projects API","description":"Built with API Gateway, Lambda, DynamoDB, and Terraform"}'

```



\### Delete a Project



Replace `PROJECT\_ID` with an actual project ID:



```powershell

Invoke-RestMethod `

&#x20; -Uri "https://o3wr0nygvf.execute-api.us-west-2.amazonaws.com/projects/PROJECT\_ID" `

&#x20; -Method DELETE

```



\## Security Notes



\* GitHub Actions uses AWS OIDC authentication.

\* The deployment role uses scoped IAM permissions instead of administrator access.

\* Lambda permissions are limited to the DynamoDB operations required by the application.

\* Terraform state is stored remotely in a private S3 bucket.

\* API Gateway CORS settings allow the frontend website to communicate with the API.



\## Lessons Learned



This project provided hands-on practice with:



\* Serverless application architecture

\* API Gateway route configuration

\* Python Lambda development

\* DynamoDB data storage

\* IAM permission design

\* CORS troubleshooting

\* Terraform resource imports and remote state

\* GitHub Actions CI/CD

\* AWS OIDC authentication

## Monitoring and Alerts

The serverless API includes CloudWatch monitoring and SNS email alerts.

### CloudWatch Dashboard

The `cloud-portfolio-api-monitoring` dashboard displays:

- Lambda invocations
- Lambda errors
- Lambda throttles
- Average Lambda duration
- API Gateway request count
- API Gateway 4xx and 5xx errors
- API Gateway latency
- API Gateway integration latency

### CloudWatch Alarms

The project provisions alarms for:

- Lambda errors
- Lambda throttles
- Lambda duration above three seconds
- API Gateway 5xx responses

### SNS Notifications

CloudWatch alarms publish notifications to the `cloud-portfolio-api-alerts` SNS topic. A confirmed email subscription receives alert and recovery notifications.

All monitoring resources are provisioned with Terraform and deployed through GitHub Actions.

\## Future Improvements



\* Add an update endpoint with `PUT /projects/{id}`

\* Add API authentication

\* Add request validation

\* Add CloudWatch dashboards and alarms

\* Add pagination for larger project lists

\* Add automated API tests



