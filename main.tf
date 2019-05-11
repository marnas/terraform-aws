# input variables
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

# output variables
output "public_ip" {
  value = "${aws_elb.example.dns_name}"
}

# data variables
data "aws_availability_zones" "all" {}

# setting AWS provider
# region London eu-west-2
provider "aws" {
  region = "us-east-1"
}

# setting basic ec2 istance
resource "aws_launch_configuration" "example" {
  image_id      = "ami-40d28157"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
            #!/bin/bash
            echo "Hello, World" > index.html
            nohup busybox httpd -f -p "${var.server_port}" &
            EOF

  lifecycle {
    create_before_destroy = true
  }
}

# setting security_group to expose port "${var.server_port}"
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "example" {
  launch_configuration = "${aws_launch_configuration.example.id}"
  availability_zones = ["${data.aws_availability_zones.all.names}"]

  load_balancers    = ["${aws_elb.example.name}"]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10

  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}