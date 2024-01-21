resource "proxmox_vm_qemu" "vm" {
  name        = var.name
  vmid        = var.vmid
  target_node = var.target_node
  desc        = var.desc
  clone       = var.clone
  full_clone  = true
  onboot      = true
  bios        = "seabios"
  qemu_os     = "l26"
  agent       = 1
  os_type     = "cloud-init"
  cores       = var.cores
  sockets     = var.sockets
  vcpus       = var.vcpus
  cpu         = "host"
  memory      = var.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  ipconfig0   = var.ipconfig0
  tags        = var.tags
  ciuser      = var.ciuser
  sshkeys     = var.sshkeys

  disk {
    slot    = var.disk.slot
    backup  = var.disk.backup
    size    = var.disk.size
    type    = var.disk.type
    storage = var.disk.storage
    volume  = var.disk.volume
  }

  network {
    model     = var.network.model
    macaddr   = var.network.macaddr
    bridge    = var.network.bridge
    tag       = var.network.tag
    firewall  = var.network.firewall
    rate      = var.network.rate
    queues    = var.network.queues
    link_down = var.network.link_down
  }
  lifecycle {
    ignore_changes = [
      disk,
      network,
    ]
  }
}

resource "cloudflare_record" "vm_dns" {
  name    = var.name
  proxied = false
  ttl     = 1
  type    = "A"
  value   = proxmox_vm_qemu.vm.ssh_host
  zone_id = var.zone_id

  depends_on = [
    proxmox_vm_qemu.vm
  ]
}