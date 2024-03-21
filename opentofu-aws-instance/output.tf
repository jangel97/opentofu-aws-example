output "instance_private_ips" {
  value = { for key, instance in aws_instance.vm : key => instance.private_ip }
  description = "The private IP addresses of the EC2 instances"
}