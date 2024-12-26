
#provider "vault" {
#  address = "http://172.31.88.71:8200"
#  skip_tls_verify = true
#  token = var.vault_token
#}

module "tools" {
  ource = "./ec2-module"
  for_each = var.tools
  instance_type = each.value.instance_type
  tool_name = each.key
  sg_port       = each.value.port
  private_zone_id = var.private_zone_id
}

provider "aws" {
  region = "us-east-1"
}
