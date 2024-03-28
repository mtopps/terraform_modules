terraform {
  required_version = ">= 0.13"
  required_providers {
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.16"
    }
    # proxmox = {
    #   source  = "Telmate/proxmox"
    #   version = "3.0.1-rc1"
    # }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}
