 # Null resource to install Apache
resource "null_resource" "install_apache" {

  # Provisioning using remote-exec provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",                  # Update package index
      "sudo apt install -y apache2",      # Install Apache
      "sudo systemctl start apache2",     # Start Apache service
#      "sudo systemctl enable apache2",
      "sudo systemctl enable apache2"     # Enable Apache to start on boot
    ]

    # Connection details for SSH
    connection {
      host        = "172.16.51.47"  # Replace with the IP of your physical server
      type        = "ssh"
      user        = "msis"   # Replace with your SSH username
      private_key = file("~/.ssh/id_rsa")  # Path to your private SSH key
      timeout     = "2m"
    }
  }
}
