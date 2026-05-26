terraform {
  backend "s3" {
    bucket       = "chaliss-terraform-state-127214156202"
    key          = "project1-static-website/terraform.tfstate"
    region       = "us-west-2"
    use_lockfile = true
  }
}