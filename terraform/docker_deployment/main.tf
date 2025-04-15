resource "null_resource" "deploy_docker_compose" {
  depends_on = [aws_instance.demo_app] # Ensure EC2 instance is created first

  provisioner "remote-exec" {
    inline = [
      # Update the system
      "sudo apt-get update -y",

      # Install Docker
      "sudo apt-get install -y docker",
      "sudo systemctl start docker",
      "sudo systemctl enable docker",
      "sudo usermod -aG docker ubuntu",

      # Install Docker Compose
      "sudo curl -L https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose",
      "sudo chmod +x /usr/local/bin/docker-compose",

      # Clone the Docker Compose application from GitHub
      "sudo apt-get install -y git",
      "git clone https://github.com/vijai-veerapandian/myweather-app.git /home/ubuntu/app",

      # Change to the application directory and bring up the Docker Compose application
      "mkdir -p /home/ubuntu/app",
      "cd /home/ubuntu/app",
      "docker-compose up -d"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("../infrastructure/ec2awskey.pem") # Path to the private key
      host        = aws_instance.demo_app.public_ip
    }
  }
}