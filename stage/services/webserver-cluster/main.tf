# setting AWS provider
# region London eu-west-2
provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "git::git@github.com:marnas/terraform-modules.git//services/webserver-cluster?ref=v0.0.2"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "terraform-state-marnas"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"
  instance_type = "t2.micro"
  min_size      = 2
  max_size      = 4

}

# backend for remote terraform.tfstate sync
terraform {
  backend "s3" {
    bucket  = "terraform-state-marnas"
    key     = "stage/services/webserver-cluster/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}