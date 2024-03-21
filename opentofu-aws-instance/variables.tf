variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "instance_ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to launch the instance in"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the vpc to launch the instance in"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group for this instance"
  type        = string
}