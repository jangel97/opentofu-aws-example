provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "vm" {
  for_each = var.vms

  ami                    = each.value.ami
  instance_type          = each.value.instance_type
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [each.value.security_group_id]
  tags                   = each.value.tags
}