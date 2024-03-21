variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "vms" {
  description = "A map of VM configurations"
  type = map(object({
    ami              = string
    instance_type    = string
    subnet_id        = string
    security_group_ids = list(string)
    tags             = map(string)
  }))
}
