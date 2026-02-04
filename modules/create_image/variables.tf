variable "image_resource_group_name" {
  type        = string
  description = "The name of the resource group for images."
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"
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
  description = "Version number for the Shared Image Version"
}

variable "source_uri" {
  type        = string
  description = "Source URI of the VM's OS disk"
}

variable "os_type" {
  type        = string
  description = "Operating system type (Windows or Linux)"
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
  description = "The storage account type for the image version"
}