output "vm" {
  description = "The entire VM resource"
  value       = proxmox_vm_qemu.vm
}

output "dns" {
  description = "The DNS record for the VM"
  value       = cloudflare_record.vm_dns
}