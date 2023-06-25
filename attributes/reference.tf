resource "aws_instance" "tf-test-ec2" {
    ami = var.ec2_ami #variable reference
    instance_type = var.ec2_instance_type  #variable reference
}


resource "aws_eip_association" "tf-elastic-ip-ec2" {
    instance_id = aws_instance.tf-test-ec2.id #attribute reference
    allocation_id = aws_eip.lb.id  #attribute reference
}

#Create a security group
resource "aws_security_group" "tf-allow_tls" {
  name        = "tf-allow_tls"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.lb.public_ip}/32"] #attribute reference with string
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}