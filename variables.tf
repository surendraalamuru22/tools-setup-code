variable "tools" {
  default = {
    vault = {
      port = 8200
      volume_size   = 30
      instance_type = "t3.micro"
    }
    github-runner = {
      port          = {}
      volume_size   = 50
      instance_type = "t3.small"
    }
  }
}

variable "vault_token" {}

#variable "private_zone_id" {
#  default = "Z10359391NR9TZ3VZRP3F"
#}

variable "domain_name" {
  default = "surendra22.online"
}

variable "zone_id" {
  default = "Z02608971BQRPHGDXOK9I"
}