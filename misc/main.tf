provider "vault" {
  address         = "http://172.31.89.193:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

resource "vault_mount" "infra-secrets" {
  path        = "roboshop"
  type        = "kv-v2"
  options = {
    version = "2"
    type    = "kv-v2"
  }
  description = "This is an roboshop secrets"
}

resource "vault_generic_secret" "ssh" {
  path = "${vault_mount.infra-secrets.path}/ssh"

  data_json = <<EOT
{
  "username":   "centos",
  "password": "DevOps321"
}
EOT
}