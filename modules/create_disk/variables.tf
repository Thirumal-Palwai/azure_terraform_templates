variable "disk_name" {
  description = "The name of the managed disk."
  type        = string
}

variable "location" {
  description = "The Azure location."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "storage_account_type" {
  description = "The type of storage account to use."
  type        = string
}

variable "storage_account_id" {
  description = "The ID of the storage account where the source VHD is located."
  type        = string
}

variable "source_vhd_uri" {
  description = "The URI of the source VHD file."
  type        = string
}

variable "vhd_disk_size_gb" {
  description = "The size of the disk in GB."
  type        = number
}
