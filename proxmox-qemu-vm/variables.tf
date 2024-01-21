variable "name" {
  description = "Name of the VM"
  type        = string
}

variable "vmid" {
  description = "ID of the VM"
  type        = number
}

variable "target_node" {
  description = "Target node for the VM"
  type        = string
}

variable "desc" {
  description = "Description of the VM"
  type        = string
}

variable "clone" {
  description = "Clone an existing VM"
  type        = string
}

variable "cores" {
  description = "Number of cores for the VM"
  type        = number
}

variable "sockets" {
  description = "Number of sockets for the VM"
  type        = number
}

variable "vcpus" {
  description = "Number of vCPUs for the VM"
  type        = number
}

variable "memory" {
  description = "Memory for the VM"
  type        = number
}

variable "ipconfig0" {
  description = "IP configuration for the VM"
  type        = string

  validation {
    condition     = (can(regex("ip=dhcp", var.ipconfig0)) || (can(regex("ip=", var.ipconfig0)) && can(regex("gw=", var.ipconfig0))))
    error_message = "The ipconfig0 value must be 'ip=dhcp' or include both 'ip=' and 'gw='."
  }
}

variable "tags" {
  description = "Tags for the VM"
  type        = string
}

variable "ciuser" {
  description = "Cloud-init user"
  type        = string
}

variable "sshkeys" {
  description = "SSH keys for the VM"
  type        = string
}

variable "disk" {
  type = object({
    slot    = number
    backup  = bool
    size    = string
    type    = string
    storage = string
    volume  = string
  })
  default = null
}

variable "network" {
  type = object({
    model     = string
    macaddr   = optional(string)
    bridge    = string
    tag       = optional(number)
    firewall  = optional(bool)
    rate      = optional(number)
    queues    = optional(number)
    link_down = optional(bool)
  })
}


variable "zone_id" {
  description = "Cloudflare Zone ID "
  type        = string
}