variable "worker_ips" {
  description = "IP addresses of worker nodes"
  type        = list(string)
}

variable "ssh_user" {
  description = "SSH username"
  type        = string
}

variable "ssh_private_key" {
  description = "Path to the SSH private key"
  type        = string
}
