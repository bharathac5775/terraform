terraform {
  required_providers {
    ssh = {
      source  = "loafoe/ssh"
      version = "2.7.0" # Used the latest compatible version
    }
    null = {
      source  = "hashicorp/null"
    }
  }
}

provider "ssh" {
  host        = var.worker_ip
  user        = var.ssh_user
  private_key = file(var.ssh_private_key)
}

resource "null_resource" "install_docker" {
  for_each = toset(var.worker_ips)
  connection {
    host        = each.value
    user        = var.ssh_user
    private_key = file(var.ssh_private_key)
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/install_docker.sh"
  }
}

resource "null_resource" "deploy_app" {
  for_each = toset(var.worker_ips)
  connection {
    host        = each.value
    user        = var.ssh_user
    private_key = file(var.ssh_private_key)
  }

  provisioner "file" {
    source      = "${path.module}/mompopcafe"  # Ensuring the source path is correct
    destination = "/tmp/mompopcafe"  # Copying the mompopcafe folder to /tmp on remote machines
  }

  provisioner "file" {
    source      = "${path.module}/mompopdb"  # Ensuring the source path is correct
    destination = "/tmp/mompopdb"  # Copying the mompopcafe folder to /tmp on remote machines
  }


  provisioner "file" {
    source      = "${path.module}/docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
  }

  provisioner "remote-exec" {
    script = "${path.module}/scripts/deploy_app.sh"
  }
}
