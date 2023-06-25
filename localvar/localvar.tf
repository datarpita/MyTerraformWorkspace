resource "aws_instance" "tf-test-ec2" {
  ami = "ami-0376ec8eacdf70aae"
  instance_type = "t2.micro"  
  
  tags = local.ec2-tag
  
}

locals {
  ec2-tag = {
    "Team" :"DevOps",
    "service" : "backend"
  }
}