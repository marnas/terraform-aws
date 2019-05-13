terraform {
  backend "s3" {
    bucket  = "terraform-state-marnas"
    key     = "stage/data-stores/mysql/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}