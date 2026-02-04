variable "vm_resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
}

variable "vm_size" {
  type        = string
  description = "Size of the virtual machine"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the VM"
  sensitive   = true
}

variable "os_disk_id" {
  type        = string
  description = "The ID of the managed disk to attach as the OS disk."
}

variable "os_disk_name" {
  type        = string
  description = "The name of the managed disk to attach as the OS disk. Should match the actual disk name."
}

variable "os_type" {
  type        = string
  description = "The operating system type of the VM (e.g., 'Windows' or 'Linux')."
}

variable "managed_disk_type" {
  type        = string
  description = "The type of managed disk for the VM OS disk."
}

variable "disk_size_gb" {
  type        = number
  description = "The size of the VM OS disk in GB."
}
