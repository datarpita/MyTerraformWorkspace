variable "portlist" {
  type    = list(number)
  default = [8200, 8201, 8300, 9200, 9500]

}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  #vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.portlist
    content {
      description = "TLS from VPC"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.portlist
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  tags = {
    Name = "allow_tls"
  }
}
