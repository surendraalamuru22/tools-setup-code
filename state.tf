terraform {
  backend "s3" {
    bucket = "terraform-tool-bucket"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"
  }
}