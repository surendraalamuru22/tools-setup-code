variable "tools" {
  default = {
    vault = {
      port = 8200
      instance_type = "t3.micro"
    }
  }
}

#variable "vault_token" {}

variable "private_zone_id" {
  default = "Z10359391NR9TZ3VZRP3F"
}