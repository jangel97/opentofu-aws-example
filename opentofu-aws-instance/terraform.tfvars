aws_region = "us-east-1"

vms = {
  "vm1" = {
    ami              = "ami-07f72922468d300b9"
    instance_type    = "t2.micro"
    subnet_id        = "subnet-0459cc467372d151e"
    security_group_ids = ["sg-0a129ee43bc61e9ac"]
    tags = {
        Name    = "test"
        AppCode = "ANSI-001"
    }
  },
  "vm2" = {
    ami              = "ami-07f72922468d300b9"
    instance_type    = "t2.micro"
    subnet_id        = "subnet-0459cc467372d151e"
    security_group_ids = ["sg-0a129ee43bc61e9ac"]
    tags = {
        Name    = "test2"
        AppCode = "ANSI-001"
    }
  }
  # Add more VMs as needed
}
