output "shared_image_version_id" {
  value       = azurerm_shared_image_version.custom_image_version.id
  description = "ID of the Shared Image Version"
}

output "shared_image_version_name" {
  value       = azurerm_shared_image_version.custom_image_version.name
  description = "Name of the Shared Image Version"
}
