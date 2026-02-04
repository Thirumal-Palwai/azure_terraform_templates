output "disk_id" {
  value       = module.create_disk.disk_id
  description = "ID of the managed disk created from VHD"
}

output "disk_name" {
  value       = module.create_disk.disk_name
  description = "Name of the managed disk created from VHD"
}

output "vm_id" {
  value       = module.create_vm.vm_id
  description = "ID of the VM"
}

output "source_uri" {
  value       = module.create_vm.source_uri
  description = "Source URI of the VM's OS Disk"
}

output "vm_public_ip" {
  value       = module.create_vm.vm_public_ip
  description = "Public IP of the VM"
}

output "image_version_id" {
  value = module.create_image.shared_image_version_id
  description = "ID of the created Shared Image Version"
}

output "shared_image_version_name" {
  value       = module.create_image.shared_image_version_name
  description = "Name of the Shared Image Version"
}
