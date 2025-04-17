terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.75.0"
    }
  }
}

provider "proxmox" {
  ssh {
    agent = true
  }
}