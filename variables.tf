variable "tool_name" {
  default = {
    vault = {
      port = 8200
      instance_type = "t3.micro"
    }
  }
}