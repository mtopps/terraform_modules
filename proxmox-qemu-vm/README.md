<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 2.9.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | 4.22.0 |
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 2.9.16 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.vm_dns](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [proxmox_vm_qemu.vm](https://registry.terraform.io/providers/TheGameProfi/proxmox/2.9.16/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ciuser"></a> [ciuser](#input\_ciuser) | Cloud-init user | `string` | n/a | yes |
| <a name="input_clone"></a> [clone](#input\_clone) | Clone an existing VM | `string` | n/a | yes |
| <a name="input_cores"></a> [cores](#input\_cores) | Number of cores for the VM | `number` | n/a | yes |
| <a name="input_desc"></a> [desc](#input\_desc) | Description of the VM | `string` | n/a | yes |
| <a name="input_disk"></a> [disk](#input\_disk) | n/a | <pre>object({<br>    slot    = number<br>    backup  = bool<br>    size    = string<br>    type    = string<br>    storage = string<br>    volume  = string<br>  })</pre> | `null` | no |
| <a name="input_ipconfig0"></a> [ipconfig0](#input\_ipconfig0) | IP configuration for the VM | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | Memory for the VM | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the VM | `string` | n/a | yes |
| <a name="input_network"></a> [network](#input\_network) | n/a | <pre>object({<br>    model     = string<br>    macaddr   = optional(string)<br>    bridge    = string<br>    tag       = optional(number)<br>    firewall  = optional(bool)<br>    rate      = optional(number)<br>    queues    = optional(number)<br>    link_down = optional(bool)<br>  })</pre> | n/a | yes |
| <a name="input_sockets"></a> [sockets](#input\_sockets) | Number of sockets for the VM | `number` | n/a | yes |
| <a name="input_sshkeys"></a> [sshkeys](#input\_sshkeys) | SSH keys for the VM | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for the VM | `string` | n/a | yes |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | Target node for the VM | `string` | n/a | yes |
| <a name="input_vcpus"></a> [vcpus](#input\_vcpus) | Number of vCPUs for the VM | `number` | n/a | yes |
| <a name="input_vmid"></a> [vmid](#input\_vmid) | ID of the VM | `number` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Cloudflare Zone ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns"></a> [dns](#output\_dns) | The DNS record for the VM |
| <a name="output_vm"></a> [vm](#output\_vm) | The entire VM resource |
<!-- END_TF_DOCS -->