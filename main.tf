module "tools" {
  for_each = var.tools
  source = "./ec2-module"
  instance_type = each.value.instance_type
  tool_name = each.key
}