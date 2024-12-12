module "tools" {
  for_each = var.tools
  source = "./ec2-module"
  instance_type = each.value.instance_type
  tool_name = each.key
  sg_port       = each.value.port
  token = var.vault_token
}

provider "aws" {
  region = "us-east-1"
}