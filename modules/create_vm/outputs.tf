output "vm_id" {
  value       = azurerm_virtual_machine.vm.id
  description = "ID of the VM"
}

output "source_uri" {
  value       = azurerm_virtual_machine.vm.storage_os_disk[0].managed_disk_id
  description = "Source URI of the VM's OS Disk"
}

output "vm_public_ip" {
  value       = azurerm_public_ip.pip.ip_address
  description = "Public IP of the VM"
}
