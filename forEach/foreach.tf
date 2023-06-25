resource "aws_iam_user" "iam" {
  for_each = toset( ["user-01","user-02", "user-03"] )
  name     = each.key
}



#Use of each.key and each.value
resource "aws_instance" "myec2" {
  ami = "ami-0cea098ed2ac54925"
  for_each  = {
      keya = "t2.micro"
      keyb = "t2.medium"
   }
  instance_type    = each.value
  key_name         = each.key
  tags =  {
   Name = each.value
    }
}