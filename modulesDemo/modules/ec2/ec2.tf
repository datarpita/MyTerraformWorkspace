resource "aws_instance" "tf-ec2" {

  ami           = "ami-049a62eb90480f276"
  instance_type = var.ec2_instance_type

  tags = {
    "Name" = "tf-ec2"
  }
}
