locals {
  webservers = {
    webserver-1 = {
      name = "webserver-1",
      vmid = 211
    }
    webserver-2 = {
      name = "webserver-2",
      vmid = 212
    }
    webserver-3 = {
      name = "webserver-3",
      vmid = 213
    }
  }
  tags = {
    webserver = "webservers"
  }
}

module "web-vms" {
  source      = "git::https://github.com/mtopps/terraform_modules.git//proxmox-qemu-vm"
  for_each    = local.webservers
  name        = each.value.name
  vmid        = each.value.vmid
  target_node = var.target_node
  desc        = "Terraform created VM"
  cores       = 2
  sockets     = 1
  vcpus       = 1
  memory      = 2048
  clone       = var.clone
  ipconfig0   = "ip=192.168.1.${each.value.vmid}/24,gw=192.168.1.1"
  tags        = local.tags.webserver
  ciuser      = "ubuntu"
  sshkeys     = var.sshkeys

  disk = {
    slot    = 0
    backup  = false
    size    = "10200M"
    type    = "scsi"
    storage = "vmstorage"
    volume  = "vmstorage:${each.value.vmid}/vm-${each.value.vmid}-disk-0.raw"
  }

  network = {
    model  = "virtio"
    bridge = "vmbr0"
  }

  zone_id = var.zone_id
}
