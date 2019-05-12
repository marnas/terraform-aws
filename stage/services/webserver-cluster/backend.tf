terraform {
  backend "s3" {
    bucket  = "terraform-state-marnas"
    key     = "terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}