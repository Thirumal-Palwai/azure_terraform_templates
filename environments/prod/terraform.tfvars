vm_resource_group_name  = "microvm-prod-rg"
location                = "westus2"
vm_name                 = "microvm"
vm_size                 = "Standard_B2ats_v2"

admin_username      = "devops"
admin_password      = "Devops@12345"

managed_disk_type = "Standard_LRS"
disk_size_gb = 127

image_resource_group_name   = "microimage-prod-rg"
gallery_name                = "microvm_Gallery"
image_name                  = "microvm_Image"

os_type                     = "Windows"
os_state                    = "Generalized"
specialized                 = false
image_publisher             = "microserver"
image_offer                 = "micro"
image_sku                   = "v1-standard"
image_generation            = "V2"
image_storage_account_type  = "Standard_LRS"

disk_name                 = "microvm-vhd-disk"
disk_resource_group_name  = "microvm-disk-rg"
disk_storage_account_type = "Standard_LRS"
storage_account_id        = "/subscriptions/9b09626a-99b7-467d-afb6-3a461a383f86/resourceGroups/microvm-disk-rg/providers/Microsoft.Storage/storageAccounts/microvmsa"
source_vhd_uri            = "https://microvmsa.blob.core.windows.net/microvm-vhd-disk/os-fixed.vhd"
vhd_disk_size_gb          = 127
