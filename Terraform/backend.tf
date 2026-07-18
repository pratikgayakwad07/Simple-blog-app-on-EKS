
terraform {
  backend "s3" {
    bucket       = "terraform-state-bucket-128"
    key          = "3tier/prod/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

