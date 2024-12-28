variable "tools" {
  default = {
    vault = {
      port          = {
        vault_port  = 8200
      }
      volume_size   = 30
      instance_type = "t3.micro"
      policy_list = []
    }
    github-runner = {
      port          = {}
      volume_size   = 50
      instance_type = "t3.small"
      policy_list = ["*"]
    }
  }
}

#variable "vault_token" {}


variable "domain_name" {
  default = "surendra22.online"
}

variable "zone_id" {
  default = "Z02608971BQRPHGDXOK9I"
}