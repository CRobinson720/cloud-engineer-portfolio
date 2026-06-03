\# Project 1 — Static Portfolio Website



\## Overview



This project deploys a static cloud-engineering portfolio website on AWS using Terraform.



The site is hosted in Amazon S3 and delivered through Amazon CloudFront. The frontend also communicates with a separate serverless API project to display and manage portfolio project entries dynamically.



\## Architecture



```text

User Browser

&#x20;    |

&#x20;    v

Amazon CloudFront

&#x20;    |

&#x20;    v

Amazon S3 Static Website

```



The frontend also connects to the serverless backend from Project 2:



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



\* \*\*Amazon S3\*\* — hosts the static website files

\* \*\*Amazon CloudFront\*\* — provides CDN delivery and an HTTPS endpoint

\* \*\*AWS IAM\*\* — controls deployment permissions

\* \*\*Amazon S3 remote backend\*\* — stores Terraform state securely



\## Technologies Used



\* Terraform

\* HTML

\* CSS

\* JavaScript

\* AWS CLI

\* GitHub Actions



\## Terraform Resources



This project provisions resources such as:



\* `aws\_s3\_bucket`

\* `aws\_s3\_bucket\_website\_configuration`

\* `aws\_s3\_object`

\* `aws\_s3\_bucket\_public\_access\_block`

\* `aws\_s3\_bucket\_policy`

\* `aws\_cloudfront\_distribution`



\## Key Features



\* Static website hosting on AWS

\* CloudFront CDN distribution

\* HTTPS access through CloudFront

\* Infrastructure managed with Terraform

\* Remote Terraform state stored in S3

\* GitHub Actions validation and deployment workflow

\* Dynamic project rendering from the Project 2 serverless API

\* Create and delete project functionality through the frontend



\## Deployment



\### Local Deployment



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

cd C:\\Users\\crobi\\cloud-engineer-portfolio\\project1-static-website

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



\### GitHub Actions Deployment



This project can also be deployed manually from GitHub Actions.



```text

GitHub Repository

&#x20;   → Actions

&#x20;   → Terraform CI/CD

&#x20;   → Run workflow

&#x20;   → Select project1-static-website

&#x20;   → Run workflow

```



GitHub Actions authenticates to AWS using OIDC and assumes a scoped IAM role. No long-lived AWS access keys are stored in GitHub.



\## Outputs



Terraform returns the website endpoints after deployment.



Example:



```text

website\_url    = "chaliss-portfolio-site-127214156202.s3-website-us-west-2.amazonaws.com"

cloudfront\_url = "d32097lzgag73x.cloudfront.net"

```



Use the CloudFront endpoint for the production-style site:



```text

https://d32097lzgag73x.cloudfront.net

```



\## Security Notes



\* GitHub Actions uses AWS OIDC authentication.

\* The deployment role uses scoped IAM permissions instead of broad administrator access.

\* Terraform state is stored remotely in a private S3 bucket.

\* Public access is limited to the website content required for static hosting.



\## Lessons Learned



This project provided hands-on practice with:



\* Terraform resource provisioning

\* S3 static website hosting

\* CloudFront CDN configuration

\* Remote Terraform state

\* GitHub Actions CI/CD

\* AWS OIDC authentication

\* IAM least-privilege design

\* Frontend-to-backend integration



\## Future Improvements



\* Add a custom domain with Route 53

\* Add an ACM certificate for the custom domain

\* Configure CloudFront cache invalidation during deployment

\* Add CloudWatch monitoring and alarms

\* Add screenshots and a visual architecture diagram



