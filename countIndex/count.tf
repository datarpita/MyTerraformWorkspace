# Usage of count and count index
# Iteration over a list using count index
resource "aws_iam_user" "lb" {
  name = var.usernamelist[count.index]
  path = "/system/"
  count=3

  tags = {
    tag-key = "Name"
  }
}

variable "usernamelist" {
    default = ["userA", "userB","userC"]
  
}


# Usage of count using conditional expressions
variable "istest" { 
}

resource "aws_instance" "tf-dev-ec2" {
    ami = "ami-0376ec8eacdf70aae"
    instance_type = "t2.micro"

    count = var.istest == true ? 1 : 0
}

resource "aws_instance" "tf-prod-ec2" {
    ami = "ami-0376ec8eacdf70aae"
    instance_type = "t2.large"

    count = var.istest == false ? 1 : 0
}