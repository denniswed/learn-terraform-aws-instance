variable "region" {
  default = "us-east-2"
}

variable "amis" {
  type = map(string)
  default = {
    "us-east-2" = "ami-0532769007c9ffca4"
    "us-west-2" = "ami-0dbefca10050927f3"
  }
}

variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}