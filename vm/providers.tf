terraform {
  required_version = "~> 1.11.4"
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