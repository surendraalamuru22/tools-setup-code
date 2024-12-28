terraform {
  backend "s3" {
    bucket = "terraform-tools"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}