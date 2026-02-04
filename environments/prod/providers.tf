terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name   = "microvm-disk-rg"
    storage_account_name  = "microvmterraformsa"
    container_name        = "microvm-state-disk"
    key                   = "prod.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
