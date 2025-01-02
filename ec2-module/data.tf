data "aws_ami" "ami" {
  most_recent = true
  name_regex  = "RHEL-9-DevOps-Practice"
  owners = ["396608809975"]
}

#data "vault_generic_secret" "ssh"{
#  path = "infra-secrets/ssh"
#}

