# setting AWS provider
# region London eu-west-2
provider "aws" {
  region = "eu-west-2"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster/"

  cluster_name            = "webservers-stage"
  db_remote_state_bucket  = "terraform-state-marnas"
  db_remote_state_key     = "stage/data-stores/mysql/terraform.tfstate"
  image_id                = "ami-7ad7c21e"
  instance_type           = "t2.micro"
  min_size                = 2
  max_size                = 4

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