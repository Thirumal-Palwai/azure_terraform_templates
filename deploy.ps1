param (
    [string]$env = "dev"
)

# Validate environment folder
$envFolder = "environments/$env"
if (-not (Test-Path $envFolder)) {
    Write-Error "Environment folder '$envFolder' does not exist."
    exit 1
}

Write-Host "[INFO] Deploying environment: $env"

# Initialize Terraform
terraform -chdir="$envFolder" init
if ($LASTEXITCODE -ne 0) { Write-Error "Terraform init failed."; exit 1 }

# 1. Apply only the VM module
Write-Host "[STEP 1] Creating VM (create_vm module)"
terraform -chdir="$envFolder" apply -auto-approve -target="module.create_vm"
if ($LASTEXITCODE -ne 0) { Write-Error "Terraform apply (create_vm) failed."; exit 1 }

#terraform -chdir="$envFolder" import module.create_image.azurerm_resource_group.rg "/subscriptions/9b09626a-99b7-467d-afb6-3a461a383f86/resourceGroups/microimage-dev-rg"

#terraform -chdir="$envFolder" import module.create_image.azurerm_shared_image_gallery.sig_gallery "/subscriptions/9b09626a-99b7-467d-afb6-3a461a383f86/resourceGroups/microimage-dev-rg/providers/Microsoft.Compute/galleries/microvm_Gallery"

#terraform -chdir="$envFolder" import module.create_image.azurerm_shared_image.custom_image "/subscriptions/9b09626a-99b7-467d-afb6-3a461a383f86/resourceGroups/microimage-dev-rg/providers/Microsoft.Compute/galleries/microvm_Gallery/images/microvm_Image"

# 2. Apply only the image module (now that VM exists)
Write-Host "[STEP 2] Creating Image (create_image module)"
terraform -chdir="$envFolder" apply -auto-approve -target="module.create_image" -target="module.create_disk"
if ($LASTEXITCODE -ne 0) { Write-Error "Terraform apply (create_image) failed."; exit 1 }

# 3. Remove image version from state to avoid dependency issues
Write-Host "[STEP 3] Removing Image Version from state"
terraform -chdir="$envFolder" state rm -backup="terraform.tfstate.backup" module.create_image.azurerm_shared_image_version.custom_image_version
if ($LASTEXITCODE -ne 0) { Write-Error "Terraform state rm (custom_image_version) failed."; exit 1 }

# 4. Destroy only the VM module (leaving image and gallery)
Write-Host "[STEP 4] Destroying VM (create_vm module)"
terraform -chdir="$envFolder" destroy -auto-approve -target="module.create_vm"
if ($LASTEXITCODE -ne 0) { Write-Error "Terraform destroy (create_vm) failed."; exit 1 }

# 5. Destroy only the snapshot (leaving gallery and image and image versions)
Write-Host "[STEP 5] Destroying VM Snapshot (create_image module)"
terraform -chdir="$envFolder" destroy -auto-approve -target="module.create_image.azurerm_snapshot.vm_os_disk_snapshot"
if ($LASTEXITCODE -ne 0) { Write-Error "Terraform destroy (vm_os_disk_snapshot) failed."; exit 1 }

Write-Host "[INFO] Only the shared image gallery along with image and image versions will remain."
