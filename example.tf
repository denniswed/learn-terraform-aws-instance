terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "dwmfa"
  region  = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-04ecb1cddf0db6c76"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0eb6fbf3b8aa11c88"]
  subnet_id              = "subnet-0d0803c83bc0e8eab"
}
