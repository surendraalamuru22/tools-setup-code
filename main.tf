module "tools" {
  for_each = var.tool_name
  source = "./ec2-module"
  instance_type = each.value.instance_type
  tool_name = each.key
}