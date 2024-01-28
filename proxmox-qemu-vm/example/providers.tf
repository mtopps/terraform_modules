terraform {
  required_version = ">= 0.13"
  required_providers {
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


provider "proxmox" {
  pm_api_url          = var.api_url
  pm_api_token_id     = var.token_id
  pm_api_token_secret = var.token_secret
  pm_tls_insecure     = false
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}