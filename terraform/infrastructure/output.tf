
output "private_key_pem" {
  value = tls_private_key.generated.private_key_pem
  sensitive = true
  description = "Prviate key for SSH access. Save securely"
}

output "instance_public_ip" {
  value = aws_instance.demo_app.public_ip
  description = "Pubic_ip of the EC2 instance"
}

output "ec2_instance_id" {
  value = aws_instance.demo_app.id
  description = "Id of the EC2 instance."
}