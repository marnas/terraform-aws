# input variables
variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default     = 8080
}

# data variables
data "aws_availability_zones" "all" {}
