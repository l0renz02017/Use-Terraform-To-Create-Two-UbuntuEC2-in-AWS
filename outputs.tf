output "ubuntu1_ip" {
  description = "Public IP of the first Ubuntu instance"
  value       = aws_instance.ubuntu1.public_ip
}

output "ubuntu2_ip" {
  description = "Public IP of the second Ubuntu instance"
  value       = aws_instance.ubuntu2.public_ip
}
