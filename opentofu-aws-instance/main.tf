provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/sshkey.pub")
}

resource "aws_instance" "vm" {
  for_each = var.vms

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = each.value.security_group_ids
  tags                   = each.value.tags
  key_name               = aws_key_pair.deployer_key.key_name
}
