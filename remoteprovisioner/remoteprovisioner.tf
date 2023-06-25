resource "aws_instance" "tf-remote_prov-ec2" {
  ami           = "ami-049a62eb90480f276"
  instance_type = "t2.micro"
  key_name      = "terraform-key"

  tags = {
    "Name" = "tf-remote_prov-ec2"
  }
  connection {
    
    type        = "ssh"
    user        = "ec2-user"
    #private_key = file("D:/Arpita/Tutorials/AWSTraining-CTS/Terraform/Exercises/remoteprovisioner/PracticeServer.pem")
    private_key = file("./terraform-key.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
 #     "sudo amazon-linux-extras install -y nginx1",
        "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}

