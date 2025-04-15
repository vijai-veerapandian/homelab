variable "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private SSH key for accessing the EC2 instance"
  type        = string
}