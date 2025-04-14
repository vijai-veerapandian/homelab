
output "private_key_pem" {
  value = tls_private_key.generated.private_key_pem
  sensitive = true
  description = "Prviate key for SSH access. Save securely"
}

output "instance_public_ip" {
  value = aws_instance.demo_app.public_ip
  description = "Pubic_ip of the EC2 instance"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.state_bucket[0].bucket
  description = "Name of the S3 bucket used for Terraform state."
}

output "ec2_instance_id" {
  value = aws_instance.demo_app.id
  description = "Id of the EC2 instance."
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_lock_table.name
  description = "DynamoDB table used for Terraform state locking."
}
