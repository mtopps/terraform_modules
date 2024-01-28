# Description: Variables for the Proxmox Terraform Provider

variable "target_node" {
  description = "The node to deploy the VM on"
  type        = string
}

variable "clone" {
  description = "The name of the template used to clone the VM"
  type        = string
}

variable "api_url" {
  description = "The URL of the Proxmox API"
  type        = string
  sensitive   = true

}

variable "token_secret" {
  description = "The secret of the Proxmox API token"
  type        = string
  sensitive   = true
}

variable "token_id" {
  description = "The ID of the Proxmox API token"
  type        = string
  sensitive   = true
}

variable "sshkeys" {
  description = "The SSH keys to add to the VM"
  type        = string
  sensitive   = true
}

variable "zone_id" {
  description = "The Zone ID of the Cloudflare zone"
  type        = string
  sensitive   = true
}

variable "account_id" {
  description = "The Account ID of the Cloudflare account ex: user@example.com"
  type        = string
}

variable "cloudflare_api_token" {
  description = "The Cloudflare API token"
  type        = string
}