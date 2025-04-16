resource "null_resource" "docker_setup" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = var.ec2_public_ip
      user        = "ubuntu"
      private_key = file(var.ssh_private_key_path)
    }

    script = "./application.sh"
  }
}