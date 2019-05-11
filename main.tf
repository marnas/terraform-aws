# setting AWS provider
# region London eu-west-2
provider "aws" {
  region = "us-east-1"
}

# setting basic ec2 istance
resource "aws_instance" "web1" {
  ami           = "ami-40d28157"
  instance_type = "t2.micro"
  tags {
    Name = "web1"
  }
}