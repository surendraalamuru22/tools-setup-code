provider "vault" {
  address         = "http://172.31.88.71:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

resource "vault_mount" "infra-secrets" {
  path        = "infra-secrets"
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

#resource "vault_mount" "roboshop-parameters" {
#  path        = "roboshop-parameters"
#  type        = "kv-v2"
#  options = {
#    version = "2"
#    type    = "kv-v2"
#  }
#  description = "This is an roboshop secrets"
#}
#
#resource "vault_generic_secret" "catalogue" {
#  path = "${vault_mount.roboshop-parameters.path}/catalogue"
#
#  data_json = <<EOT
#{
#  "MONGO": "true",
#  "MONGO_URL" : "mongodb://mongodb-dev.rdevopsb81.online:27017/catalogue",
#  "DB_TYPE": "mongo",
#  "APP_GIT_URL": "https://github.com/roboshop-devops-project-v3/catalogue",
#  "DB_HOST": "mongodb-dev.rdevopsb81.online",
#  "SCHEMA_FILE": "db/master-data.js"
#}
#EOT
#}