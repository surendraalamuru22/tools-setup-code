variable "tools" {
  default = {

    vault = {
      port = 8200
      instance_type = "t3.micro"

    }
  }
}

variable "vault_token" {}