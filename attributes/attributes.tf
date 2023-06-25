# Configure the AWS Provider
provider "aws" {
  region                  = "ap-south-1"
  shared_credentials_file = "C:/Users/Arpita Datta/.aws/credentials"
}

/*
resource "aws_s3_bucket" "test-bucket" {
  bucket = "tf-test-bucket-10mar2023-01"

  tags = {
    Name        = "Test bucket"
    Environment = "Dev"
  }
}

output "test-bucket-url" {
  value = aws_s3_bucket.test-bucket.arn
}
*/

resource "aws_eip" "lb" {
  vpc      = true
}

output "elastic-ip-address" {
  value = aws_eip.lb.public_ip
}