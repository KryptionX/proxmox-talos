variable "proxmox_endpoint" {
  type    = string
  default = "https://nuc11.local.mediavault.tech/"
}

variable "api_token" {
  type = string
}

variable "cluster_name" {
  type    = string
  default = "talos-cluster"
}

variable "default_gateway" {
  type    = string
  default = "10.10.125.1"
}

variable "talos_cp_01_ip_addr" {
  type    = string
  default = "10.10.125.90"
}

variable "talos_worker_01_ip_addr" {
  type    = string
  default = "10.10.125.91"
}

variable "talos_worker_02_ip_addr" {
  type    = string
  default = "10.10.125.92"
}

variable "proxmox_node" {
  type    = string
  default = "nuc11"
}

variable "talos_version" {
  type    = string
  default = "v1.9.5"
}

variable "private_key" {
  type = string
}

variable "worker_count" {
  description = "Number of worker nodes to create"
  type        = number
  default     = 1
}
