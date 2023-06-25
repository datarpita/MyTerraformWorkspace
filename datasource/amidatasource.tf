resource "aws_instance" "ec2-with-latest-ami" {
  ami           = data.aws_ami.ami.id
  instance_type = "t2.micro"
}


data "aws_ami" "ami" {
  most_recent = true
  owners      = ["amazon"]


  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}