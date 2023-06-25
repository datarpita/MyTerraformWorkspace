resource "aws_iam_user" "lb" {
  name = var.lbname
  path = "/system/"

  tags = {
    tag-key = "Name"
  }
}

# Create a new load balancer
resource "aws_elb" "tf-elb" {
  name               = var.alb_name
  availability_zones = var.az_list

  listener {
    instance_port     = var.ports["port8080"]
    instance_protocol = var.protocol[0]
    lb_port           = var.ports["port80"]
    lb_protocol       = var.protocol[0]
  }

  listener {
    instance_port      = var.ports["port8080"]
    instance_protocol  = var.protocol[1]
    lb_port            = var.ports["port443"]
    lb_protocol        = var.protocol[1]
    ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}