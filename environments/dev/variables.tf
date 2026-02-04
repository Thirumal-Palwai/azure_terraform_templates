variable "vm_resource_group_name" {
  type        = string
  description = "Resource group for dev"
}

variable "location" {
  type        = string
  description = "Azure region for dev"
}

variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "vm_size" {
  type        = string
  description = "VM size"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the VM"
  sensitive   = true
  validation {
    condition     = length(var.admin_password) >= 12 && can(regex("[A-Z]", var.admin_password)) && can(regex("[a-z]", var.admin_password)) && can(regex("[0-9]", var.admin_password)) && can(regex("[!@#$%^&*]", var.admin_password))
    error_message = "The admin password must be at least 12 characters long and contain upper, lower, number, and special character."
  }
}

variable "managed_disk_type" {
  type        = string
  description = "The type of managed disk for the VM OS disk."
}

variable "disk_size_gb" {
  type        = number
  description = "The size of the VM OS disk in GB."
}

variable "image_resource_group_name" {
  type        = string
  description = "The name of the resource group where the shared image gallery and images are stored. Should be a dedicated, persistent resource group."
}

variable "gallery_name" {
  type        = string
  description = "Name of the Shared Image Gallery"
}

variable "image_name" {
  type        = string
  description = "Name of the Shared Image Definition"
}

variable "image_version" {
  type        = string
  description = "Version of the shared image"
}

variable "os_type" {
  type        = string
  description = "OS type of the image (Windows or Linux)"
}

variable "os_state" {
  type        = string
  description = "OS state of the image (Generalized or Specialized)"
}

variable "specialized" {
  type        = bool
  description = "Whether the source VM is specialized (true) or generalized (false)"
}

variable "image_publisher" {
  type        = string
  description = "Publisher for the image."
}

variable "image_offer" {
  type        = string
  description = "Offer for the image."
}

variable "image_sku" {
  type        = string
  description = "SKU for the image."
}

variable "image_generation" {
  type        = string
  description = "The generation for the image (V1 or V2)."
}

variable "image_storage_account_type" {
  type        = string
  description = "The storage account type for the image version (Standard_LRS, Premium_LRS, etc). Default is Standard_LRS."
}

variable "disk_name" {
  type        = string
  description = "The name of the managed disk to create from VHD."
}

variable "disk_resource_group_name" {
  type        = string
  description = "The resource group for the managed disk."
}

variable "disk_storage_account_type" {
  type        = string
  description = "The storage account type for the managed disk. Default is Standard_LRS."
}

variable "storage_account_id" {
  type        = string
  description = "The ID of the storage account where the source VHD is located."
}

variable "source_vhd_uri" {
  type        = string
  description = "The URI of the source VHD file to import."
}

variable "vhd_disk_size_gb" {
  type        = number
  description = "The size of the VHD disk in GB."
}
