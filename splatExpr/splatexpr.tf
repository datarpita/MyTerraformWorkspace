resource "aws_iam_user" "tfnewuser" {
    name = "tf_new_user${count.index}"
    count=3
  
}

#  [*] is the splat expression
output "user_arn" {
  value = aws_iam_user.tfnewuser[*].arn
}