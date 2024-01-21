terraform {
  required_version = ">= 0.13"
  required_providers {
    # proxmox = {
    #   source  = "telmate/proxmox"
    #   version = ">= 2.9.14"
    # }
    proxmox = {
      source  = "TheGameProfi/proxmox"
      version = "2.9.16"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }
}