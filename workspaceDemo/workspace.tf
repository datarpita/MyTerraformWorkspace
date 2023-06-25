resource "aws_instance" "tf-ec2" {

  ami           = "ami-049a62eb90480f276"
  instance_type = lookup(var.instance_type, terraform.workspace)

  tags = {
    "Name" = "tf-ec2"
  }
}


## 3 workspaces - default, dev, prd


variable "instance_type" {
    type = map(string)

    default = {
        default = "t2.micro"
        dev = "t2.nano"
        prd = "t2.large"
    } 
}


#terraform workspace -h
#Usage: terraform [global options] workspace
#
#  new, list, show, select and delete Terraform workspaces.
#
#Subcommands:
#    delete    Delete a workspace
#    list      List Workspaces
#    new       Create a new workspace
#    select    Select a workspace
#    show      Show the name of the current workspace
#
#
# terraform workspace new dev
# terraform workspace new prd
#
# terraform workspace list
#  default
#  dev
#* prd
#
# terraform workspace select dev
# Switched to workspace "dev".
