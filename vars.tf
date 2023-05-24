variable "proxmox_host" {
    default = "pve-stg-01"  ##Proxmox hostname
}


##SSH key that will be added on VM
variable "ssh_key" {
   default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCzuTMCjfdhvRYmNg9Hkek5wviD5zSjaQQwRfzWIVcNNOPLoZPrgzqdOwt4nHZ/E2xt4PyA1VhZzFkOjcQLHk6nrDzPHfSBdEVknGWRvcQtR3fzUf8B0wt5+NlEpGcqQ1FTvIPQ3dQ9v6/kb2MnCS+a/olCcarPG7pdADVVHeeX3/darusa1FIRfDGv2Tb5h7upt/7h0qi0T5lWhZHrGId0tk+ibmD+mGyflOE+4XOwCj4fY2GBmN6ntwU3jFfGKtoTJfixohfZD9IIkisfOGRYzY20A4VzaQfDHYxwZkWGeYMw7EFcE5xamfbfWpzX7cJgXonD3kH5fNTGB94YpfJp OpenSSH-rsa-import-041222"
}


##VM that will be created.
#static ganti ipconfig0 ="dhcp",
variable "virtual_machines" {
    default = {
        "firecracker-dbaas" = {
      hostname = "firecracker-dbaas"
            vmid = 9991
            target_node = "pve-stg-01",
            cpu_cores = 8,
            cpu_sockets = 1,
            memory = "8129",
            hdd_size = "30G",
            template_name = "ubuntu22",
            ipconfig0 = "ip=10.10.10.210/24,gw=10.10.10.254",
        },
#        "dbaas-vm13" = {
#      hostname = "dbaas-vm13"
#            vmid = 99913
#            target_node = "pve-stg-01",
#            cpu_cores = 2,
##            cpu_sockets = 1,
#            memory = "2048",
#            hdd_size = "18G",
#            template_name = "ubuntu22",
#            ipconfig0 = "ip=10.10.10.213/24,gw=10.10.10.254",
#        },
    }
}
