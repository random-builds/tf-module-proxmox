data "proxmox_virtual_environment_node" "px" {
  node_name = "px"
}

resource "proxmox_virtual_environment_vm" "this" {
  name        = var.name

  node_name = var.name
  started = true

  cpu {
    cores        = var.cpu
    type         = "x86-64-v2-AES"  # recommended for modern CPUs
  }

  memory {
    dedicated = var.memory
    floating = var.memory
  }

  disk {
    file_id      = "local:iso/${var.iso}"
    interface    = "scsi0"
    size = var.volume_size
    type = "virtio"
  }

  initialization {
    dns {
      servers = ["1.1.1.1"]
    }
    ip_config {
      ipv4 {
        address = "10.0.1.10/24"
        gateway = "10.0.1.1"
      }
    }
  }

  operating_system {
    type = "l26"
  }
}