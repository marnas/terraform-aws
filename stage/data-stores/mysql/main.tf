provider "aws" {
  region = "us-east-1"
}

module "mysql_db" {
  source = "../../../../modules/data-stores/mysql/"

  # db variables
  db_storage        = 10
  db_instance_class = "db.t2.micro"
  db_name           = "example_database"
  db_user           = "admin"
  db_password       = "${var.db_password}"

  # s3 variables
  db_remote_state_bucket  = "terraform-state-marnas"
  db_remote_state_key     = "stage/data-stores/mysql/terraform.tfstate"
}

# backend for remote terraform.tfstate sync
terraform {
  backend "s3" {
    bucket  = "terraform-state-marnas"
    key     = "stage/data-stores/mysql/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}