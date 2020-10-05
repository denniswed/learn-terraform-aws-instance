terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
  backend "remote" {
    organization = "weddig_enterprises"

    workspaces {
      name = "terraform_train"
    }
  }
}

provider "aws" {
  profile = "dwmfa"
  region = var.region
}

resource "aws_instance" "example" {
  ami           = var.amis[var.region]
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0eb6fbf3b8aa11c88"]
  subnet_id              = "subnet-0d0803c83bc0e8eab"
}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.example.id
}

output "ami" {
  value = aws_instance.example.ami
}

output "ip" {
  value = aws_eip.ip.public_ip
}