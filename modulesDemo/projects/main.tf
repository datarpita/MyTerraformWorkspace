#provider "aws" {
#  region                  = "ap-south-1"
#  shared_credentials_file = "C:/Users/Arpita Datta/.aws/credentials"
#}

## Example for module with variables
module "ec2_module" {
  source = "../modules/ec2"
  ec2_instance_type="t2.medium" #instantiation of variable
}

## Example for module with local variable
module "sg_module" {
  source = "../modules/sg"  
}

## Example for module with output variable
module "sg2_module" {
  source = "../modules/sg2"
}

resource "aws_instance" "tf-ec2-with-sg" {
  ami="ami-049a62eb90480f276"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ module.sg2_module.ec2-sg-id ]  
}