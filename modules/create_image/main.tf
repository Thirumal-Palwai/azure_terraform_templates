# Locals for naming and tags
locals {
  default_tags = {
    environment = "${var.image_resource_group_name}"
    managed_by  = "terraform"
  }
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.image_resource_group_name
  location = var.location
  tags     = local.default_tags
}

# Shared Image Gallery
resource "azurerm_shared_image_gallery" "sig_gallery" {
  name                = var.gallery_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  description         = "Terraform created Shared Image Gallery"
  tags                = local.default_tags
}

# Shared Image Definition
resource "azurerm_shared_image" "custom_image" {
  name                = var.image_name
  gallery_name        = azurerm_shared_image_gallery.sig_gallery.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  hyper_v_generation  = var.image_generation
  tags                = local.default_tags

  identifier {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
  }

  os_type     = var.os_type
  specialized = var.specialized
}

# Snapshot of the VM's OS Disk
resource "azurerm_snapshot" "vm_os_disk_snapshot" {
  name                 = "${var.vm_name}-os-snapshot"
  location             = var.location
  resource_group_name  = var.image_resource_group_name
  create_option        = "Copy"
  source_uri           = var.source_uri
  tags                 = local.default_tags
}

# Shared Image Version from Snapshot
resource "azurerm_shared_image_version" "custom_image_version" {
  name                = var.image_version
  gallery_name        = azurerm_shared_image_gallery.sig_gallery.name
  image_name          = azurerm_shared_image.custom_image.name
  resource_group_name = var.image_resource_group_name
  location            = var.location
  tags                = local.default_tags

  os_disk_snapshot_id = azurerm_snapshot.vm_os_disk_snapshot.id

  target_region {
    name                  = var.location
    regional_replica_count = 1
    storage_account_type   = var.image_storage_account_type
  }

  lifecycle {
    prevent_destroy = true
  }
}
