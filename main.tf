terraform {
 required_providers {
   proxmox = {
     source = "telmate/proxmox"
     version = "2.9.11"
   }
 }
}

provider "proxmox" {
 pm_api_url = "https://pve-stg-01.ms-biznetgio.net:8006/api2/json"  ##Proxmox API url
 pm_api_token_id = "terraform_dbaas@pam!dbaas_token_id"  ##Proxmox User Token
 pm_api_token_secret = "5955c253-5efe-460f-bdbb-e4559d11b6bf" ##Proxmox user key
 pm_tls_insecure = true
}


resource "proxmox_vm_qemu" "cloudinit" {
   for_each = var.virtual_machines

   name = each.value.hostname
   vmid = each.value.vmid
   target_node = each.value.target_node
   clone = each.value.template_name
   agent = 1
   os_type = "cloud-init"
   cores = each.value.cpu_cores
   sockets = each.value.cpu_sockets
   cpu = "host"
   memory = each.value.memory
   scsihw = "virtio-scsi-pci"
   full_clone = true
   bootdisk = "virtio0"
   disk {
        slot = 0
        size = each.value.hdd_size
        type = "virtio"
        storage = "vmdata-hdd"
        iothread = 1
   }

   network {
       model = "virtio"
       bridge = "vmbr4"
   }


   lifecycle {
       ignore_changes = [
       network,
       ]
   }

   # Cloud-init config
   ipconfig0 = "ip=dhcp"
   sshkeys = var.ssh_key
}
