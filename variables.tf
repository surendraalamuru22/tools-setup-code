variable "tools" {
  default = {
    vault = {
      port   = 8200
      volume_size   = 30
      instance_type = "t3.micro"
      policy_list = []
    }
    github-runner = {
      port          = 80
      volume_size   = 50
      instance_type = "t3.small"
      policy_list = ["*"]
    }
  }
}

#variable "vault_token" {}


variable "domain_name" {
  default = "surendraalamuru22.online"
}

variable "zone_id" {
  default = "Z1019832158GZY6KSWTMT"
}