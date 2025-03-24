provider "proxmox" {
  endpoint  = var.proxmox_endpoint
  api_token = var.api_token

  ssh {
    agent       = true
    username    = "root"
    private_key = var.private_key
  }
}
