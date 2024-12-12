provider "vault" {
  address         = "http://172.31.89.193.rdevopsb81.online:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

resource "vault_mount" "roboshop" {
  path        = "roboshop"
  type        = "kv-v2"
  options = {
    version = "2"
    type    = "kv-v2"
  }
  description = "This is an roboshop secrets"
}