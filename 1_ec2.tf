# Configure the AWS Provider
provider "aws" {
  #version                 = "~> 2.0"
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Users/Arpita Datta/.aws/credentials"
  #profile                 = arplocaluser
}

resource "tls_private_key" "oskey" {
  algorithm = "RSA"
}

resource "local_file" "tf-test-ec2-key" {
  content  = tls_private_key.oskey.private_key_pem
  filename = "tf-test-ec2-key.pem"
}

resource "aws_key_pair" "tf-test-ec2-key" {
  key_name   = "tf-test-ec2-key"
  public_key = tls_private_key.oskey.public_key_openssh
}

resource "aws_instance" "tf-test-ec2" {
  ami = "ami-0376ec8eacdf70aae"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.tf-test-ec2-key.key_name
  
  tags = {
    "Name" = "tf-test-ec2"
  }
}
