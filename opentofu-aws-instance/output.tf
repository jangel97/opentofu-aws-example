output "instance_private_ip" {
  value = aws_instance.test.private_ip
  description = "The private IP address of the EC2 instance"
}