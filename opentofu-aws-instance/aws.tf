provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "test" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name    = "test"
    AppCode = "ANSI-001"
  }
}
