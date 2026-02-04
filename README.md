# Azure Infrastructure Terraform

## Overview
This repository contains modular Terraform code for deploying Azure resources, including VM creation and image management.

## Structure
- `modules/` - Reusable Terraform modules:
  - `create_vm/` - Provisions a VM and networking resources.
  - `create_image/` - Creates a shared image from a VM disk snapshot.
- `environments/` - Environment-specific configurations (e.g., `dev`).
- `deploy.ps1` - PowerShell script to deploy a given environment.

## Usage
1. Update variables in `environments/dev/terraform.tfvars` as needed.
2. Run the deployment script:
   ```powershell
   ./deploy.ps1 -env dev
   ```
3. Review outputs for resource IDs and public IPs.
