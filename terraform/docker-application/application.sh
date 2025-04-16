#!/bin/bash

echo "Updating system packages..."
sudo apt update

echo "Installing dependencies..."
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release

echo "Adding Docker’s official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package index with Docker repo..."
sudo apt update

echo "Installing Docker Engine..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

echo "Enabling and starting Docker service..."
sudo systemctl enable docker
sudo systemctl start docker

echo "Adding current user ($USER) to docker group..."
sudo usermod -aG docker ubuntu

echo "Installing Docker Compose plugin..."
sudo apt-get install docker-compose -y

echo "Verifying Docker installation..."
docker --version

echo "Verifying Docker Compose plugin installation..."
docker compose version

echo ""
echo "=================================================="
echo "Docker and Docker Compose have been installed!"
echo "You may need to log out and log back in for group changes to take effect."
echo "=================================================="
echo "Download myweather-app application and bring up the docker-compose up"
git clone https://github.com/vijai-veerapandian/myweather-app.git /home/ubuntu/app || true"
cd /home/ubuntu/app && sudo docker-compose up -d

