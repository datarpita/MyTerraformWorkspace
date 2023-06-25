provider "aws" {
    region = "ap-south-1" 
    shared_credentials_file = "C:/Users/Arpita Datta/.aws/credentials"
}
# Adding a user to a group called admin having administrator permission
resource "aws_iam_user" "tfnewuser" {
    name = "tf_new_user"

  
}

resource "aws_iam_user_policy" "tfadminpolicy" {
    name = "tfadminpolicy"
    user = aws_iam_user.tfnewuser.name
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "*"
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_group" "tfadmingroup" {
    name = "tfadmingroup"
}

resource "aws_iam_user_group_membership" "tfadmingroupmember" {
  user = aws_iam_user.tfnewuser.name
  groups = [
    aws_iam_group.tfadmingroup.name
  ]
}

# Creating two groups - developer and operations and adding users to them

resource "aws_iam_group" "tfdevelopergrp" {
    name = "tfdevelopergrp"
}

resource "aws_iam_group" "tfoperationsgrp" {
    name = "tfoperationsgrp"
}

#### Adding group level policies - developer - ec2 
resource "aws_iam_group_policy" "tfdevelopergrppolicy" {
  name = "tfdevelopergrppolicy"
  group = aws_iam_group.tfdevelopergrp.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action"= "ec2:*"
        "Effect"= "Allow"
        "Resource"= "*"
      },
    ]
  })
}

#### Adding group level policies - operations - cloudwatch 
resource "aws_iam_group_policy" "tfoperationsgrppolicy" {
  name = "tfoperationsgrppolicy"
  group = aws_iam_group.tfoperationsgrp.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Action"= [
                "logs:*"
            ]
        "Effect"= "Allow",
        "Resource"= "*"
      },
    ]
  })
}

resource "aws_iam_user" "tfdeveloper1" {
    name = "tfdeveloper1"  
}

resource "aws_iam_user" "tfoperations1" {
    name = "tfoperations1"  
}

resource "aws_iam_user" "tfleaddeveloper" {
    name = "tfleaddeveloper"  
}

resource "aws_iam_user_group_membership" "tfdevgroupmemship" {
    user = aws_iam_user.tfdeveloper1.name
    groups = [
        aws_iam_group.tfdevelopergrp.name
    ]  
}

resource "aws_iam_user_group_membership" "tfopsgroupmemship" {
    user = aws_iam_user.tfoperations1.name
    groups = [
        aws_iam_group.tfoperationsgrp.name
    ]  
}

resource "aws_iam_user_group_membership" "tfcommongrpmemship" {
    user = aws_iam_user.tfleaddeveloper.name
    groups = [
        aws_iam_group.tfdevelopergrp.name,
        aws_iam_group.tfoperationsgrp.name,
    ]  
}

