terraform {
  backend "s3" {
    bucket  = "terraform-state-marnas"
    key     = "stage/services/webserver-cluster/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}