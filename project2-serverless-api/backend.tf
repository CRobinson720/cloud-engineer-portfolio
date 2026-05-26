terraform {
  backend "s3" {
    bucket       = "chaliss-terraform-state-127214156202"
    key          = "project2-serverless-api/terraform.tfstate"
    region       = "us-west-2"
    use_lockfile = true
  }
}