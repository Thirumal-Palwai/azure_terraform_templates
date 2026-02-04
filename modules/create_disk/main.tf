locals {
  default_tags = {
    environment = var.resource_group_name
    managed_by  = "terraform"
  }
}

resource "azurerm_managed_disk" "managed_disk" {
  name                 = var.disk_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = var.storage_account_type
  create_option        = "Import"
  storage_account_id   = var.storage_account_id
  source_uri           = var.source_vhd_uri
  disk_size_gb         = var.vhd_disk_size_gb
  tags                 = local.default_tags
}
