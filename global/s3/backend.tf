terraform {
  backend "s3" {
    bucket  = "terraform-state-marnas"
    key     = "global/s3/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}