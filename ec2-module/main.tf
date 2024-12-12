

resource "aws_instance" "vault" {
  ami           = "ami-0b4f379183e5706b9"
  instance_type = var.instance_type

  tags = {
    Name = var.tool_name
  }
}