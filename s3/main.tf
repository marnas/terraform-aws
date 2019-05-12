provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-state-marnas"

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }
}