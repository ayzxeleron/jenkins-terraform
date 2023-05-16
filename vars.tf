variable "proxmox_host" {
    default = "pve-stg-01"  ##Proxmox hostname
}


##SSH key that will be added on VM
variable "ssh_key" {
   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzuTMCjfdhvRYmNg9Hkek5wviD5zSjaQQwRfzWIVcNNOPLoZPrgzqdOwt4nHZ/E2xt4PyA1VhZzFkOjcQLHk6nrDzPHfSBdEVknGWRvcQtR3fzUf8B0wt5+NlEpGcqQ1FTvIPQ3dQ9v6/kb2MnCS+a/olCcarPG7pdADVVHeeX3/darusa1FIRfDGv2Tb5h7upt/7h0qi0T5lWhZHrGId0tk+ibmD+mGyflOE+4XOwCj4fY2GBmN6ntwU3jFfGKtoTJfixohfZD9IIkisfOGRYzY20A4VzaQfDHYxwZkWGeYMw7EFcE5xamfbfWpzX7cJgXonD3kH5fNTGB94YpfJp OpenSSH-rsa-import-041222"
}


##VM that will be created.
variable "virtual_machines" {
    default = {
        "dbaas-vm1" = {
      hostname = "dbaas-vm1"
            vmid = 9990
            target_node = "pve-stg-01",
            cpu_cores = 2,
            cpu_sockets = 1,
            memory = "2048",
            hdd_size = "18G",
            template_name = "ubuntu22-base",
        },
        "dbaas-vm2" = {
      hostname = "dbaas-vm2"
            vmid = 9991
            target_node = "pve-stg-01",
            cpu_cores = 2,
            cpu_sockets = 1,
            memory = "2048",
            hdd_size = "18G",
            template_name = "ubuntu22-base",
        },
    }
}
