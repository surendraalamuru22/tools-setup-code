provider "aws" {
  region = "us-east-1"
}

module "tools" {
  source = "./ec2-module"
  for_each = var.tools
  instance_type = each.value.instance_type
  tool_name = each.key
  sg_port       = each.value.port
}

