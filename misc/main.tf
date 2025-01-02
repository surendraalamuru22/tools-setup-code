terraform {
  backend "s3" {
    bucket = "terraform-tools"
    key    = "vault-secrets/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "vault" {
  address         = "http://vault-internal.surendra22.online:8200"
  token           = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

resource "vault_mount" "roboshop" {
  path        = "roboshop"
  type        = "kv"
  options     = { version = "2" }
  description = "RoboShop Dev Secrets"
}

resource "vault_generic_secret" "frontend" {
  path = "${vault_mount.roboshop.path}/frontend"

  data_json = <<EOT
{
  "catalogue_url":   "http://catalogue.surendra22.online:8080/",
  "cart_url":   "http://cart.surendra22.online:8080/",
  "user_url":   "http://user.surendra22.online:8080/",
  "shipping_url":   "http://shipping.surendra22.online:8080/",
  "payment_url":   "http://payment.surendra22.online:8080/",
  "CATALOGUE_HOST" : "catalogue.surendra22.online",
  "CATALOGUE_PORT" : 8080,
  "USER_HOST" : "user.surendra22.online",
  "USER_PORT" : 8080,
  "CART_HOST" : "cart.surendra22.online",
  "CART_PORT" : 8080,
  "SHIPPING_HOST" : "shipping.surendra22.online",
  "SHIPPING_PORT" : 8080,
  "PAYMENT_HOST" : "payment.surendra22.online",
  "PAYMENT_PORT" : 8080
}
EOT
}

resource "vault_generic_secret" "catalogue" {
  path = "${vault_mount.roboshop.path}/catalogue"

  data_json = <<EOT
{
  "MONGO": "true",
  "MONGO_URL" : "mongodb://mongodb.surendra22.online:27017/catalogue",
  "DB_TYPE": "mongo",
  "APP_GIT_URL": "https://github.com/roboshop-devops-project-v3/catalogue",
  "DB_HOST": "mongodb.surendra22.online",
  "SCHEMA_FILE": "db/master-data.js"
}
EOT
}

resource "vault_generic_secret" "user" {
  path = "${vault_mount.roboshop.path}/user"

  data_json = <<EOT
{
  "MONGO": "true",
  "MONGO_URL" : "mongodb://mongodb.surendra22.online:27017/users",
  "REDIS_URL" : "redis://redis.surendra22.online:6379"
}
EOT
}

resource "vault_generic_secret" "cart" {
  path = "${vault_mount.roboshop.path}/cart"

  data_json = <<EOT
{
  "REDIS_HOST": "redis.surendra22.online",
  "CATALOGUE_HOST" : "catalogue.surendra22.online",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

resource "vault_generic_secret" "shipping" {
  path = "${vault_mount.roboshop.path}/shipping"

  data_json = <<EOT
{
  "CART_ENDPOINT": "cart.surendra22.online:8080",
  "DB_HOST" : "mysql.surendra22.online",
  "mysql_root_password" : "RoboShop@1",
  "DB_TYPE": "mysql",
  "APP_GIT_URL": "https://github.com/roboshop-devops-project-v3/shipping",
  "DB_USER": "root",
  "DB_PASS": "RoboShop@1"
}
EOT
}



resource "vault_generic_secret" "payment" {
  path = "${vault_mount.roboshop.path}/payment"

  data_json = <<EOT
{
  "CART_HOST" : "cart.surendra22.online",
  "CART_PORT" : "8080",
  "USER_HOST" : "user.surendra22.online",
  "USER_PORT" : "8080",
  "AMQP_HOST" : "rabbitmq.surendra22.online",
  "AMQP_USER" : "roboshop",
  "AMQP_PASS" : "roboshop123"
}
EOT
}

resource "vault_generic_secret" "mysql" {
  path = "${vault_mount.roboshop.path}/mysql"

  data_json = <<EOT
{
  "mysql_root_password" : "RoboShop@1"
}
EOT
}

resource "vault_generic_secret" "rabbitmq" {
  path = "${vault_mount.roboshop.path}/rabbitmq"

  data_json = <<EOT
{
  "user" : "roboshop",
  "password" : "roboshop123"
}
EOT
}


###############
resource "vault_mount" "infra-secrets" {
  path        = "infra-secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "All Infra Related Secrets"
}

resource "vault_generic_secret" "ssh" {
  path = "${vault_mount.infra-secrets.path}/ssh"

  data_json = <<EOT
{
  "username" : "ec2-user",
  "password" : "DevOps321"
}
EOT
}

