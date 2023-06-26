terraform {
  backend "s3" {
    bucket = "terraform-backend-store-25june2023"
    key    = "network/terraform.tfstate"
    region = "ap-south-1"
  }
}