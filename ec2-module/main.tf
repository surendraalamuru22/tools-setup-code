resource "aws_security_group" "sg" {
  name        = "${var.tool_name}-sg"
  description = "Inbound allow for ${var.tool_name}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.sg_port
    to_port     = var.sg_port
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tool_name}-sg"
  }
}

resource "aws_instance" "vault" {
  ami                    = data.aws_ami.ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]

  root_block_device {
    volume_size = var.volume_size
  }

  instance_market_options {
    market_type = "spot"
    spot_options {
      instance_interruption_behavior = "stop"
      spot_instance_type             = "persistent"
    }
  }

  tags = {
    Name = var.tool_name
  }
  iam_instance_profile = length(var.policy_list) > 0 ? aws_iam_instance_profile.instance_profile[0].name : null
}

resource "null_resource" "connection" {

  triggers = {
    instance_id = aws_instance.vault.id
  }

  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = data.vault_generic_secret.ssh.data["username"]
      password = data.vault_generic_secret.ssh.data["password"]
      host = aws_instance.vault.private_ip

    }

    inline = [
      "echo hello world"
    ]
  }

}


resource "aws_route53_record" "record-public" {
  zone_id = var.zone_id
  name    = "${var.tool_name}.${var.domain_name}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.public_ip]
}

resource "aws_route53_record" "record-private" {
  zone_id = var.zone_id
  name    = "${var.tool_name}-internal.${var.domain_name}"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.private_ip]
}