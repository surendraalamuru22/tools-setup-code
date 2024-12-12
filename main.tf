module "tools" {
  for_each = var.tool
  source = "./ec2-module"
  instance_type = each.value.instance_type
  tool_name = each.key
  sg_port       = each.value.port
}

provider "aws" {
  region = "us-east-1"
}