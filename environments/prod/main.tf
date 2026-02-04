module "create_vm" {
  source = "../../modules/create_vm"

  vm_resource_group_name  = var.vm_resource_group_name
  location                = var.location
  vm_name                 = var.vm_name
  vm_size                 = var.vm_size
  
  admin_username          = var.admin_username
  admin_password          = var.admin_password

  os_disk_id              = module.create_disk.disk_id
  os_disk_name            = module.create_disk.disk_name
  os_type                 = var.os_type


  managed_disk_type       = var.managed_disk_type
  disk_size_gb            = var.disk_size_gb
}

module "create_image" {
  source              = "../../modules/create_image"

  image_resource_group_name = var.image_resource_group_name
  location                  = var.location
  vm_name                   = var.vm_name

  gallery_name        = var.gallery_name
  image_name          = var.image_name
  image_version       = var.image_version

  source_uri          = module.create_vm.source_uri

  os_type             = var.os_type
  os_state            = var.os_state
  specialized         = var.specialized

  image_publisher             = var.image_publisher
  image_offer                 = var.image_offer
  image_sku                   = var.image_sku
  image_generation            = var.image_generation
  image_storage_account_type  = var.image_storage_account_type
}

module "create_disk" {
  source                = "../../modules/create_disk"
  disk_name             = var.disk_name
  location              = var.location
  resource_group_name   = var.disk_resource_group_name
  storage_account_type  = var.disk_storage_account_type
  storage_account_id    = var.storage_account_id
  source_vhd_uri        = var.source_vhd_uri
  vhd_disk_size_gb      = var.vhd_disk_size_gb
}
