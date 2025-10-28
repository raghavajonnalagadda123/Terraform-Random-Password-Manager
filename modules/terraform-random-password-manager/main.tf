terraform {
  required_version = ">= 1.3.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
}

locals {
  invalid_state = var.rotate_backup && var.swap_passwords
  active_password = var.swap_passwords ? local.generated_backup : local.generated_active
  backup_password = var.swap_passwords ? local.generated_active : local.generated_backup
}

resource "null_resource" "safety_check" {
  count = local.invalid_state ? 1 : 0

  provisioner "local-exec" {
    command = "echo 'Error: Cannot rotate and swap passwords at the same time.' && exit 1"
  }
}

resource "random_password" "active" {
  length  = var.password_length
  special = true
  keepers = {
    seed = var.active_seed
  }
}

resource "random_password" "backup" {
  length  = var.password_length
  special = true
  keepers = {
    rotate_trigger = var.rotate_backup ? timestamp() : var.backup_seed
  }
}

locals {
  generated_active = random_password.active.result
  generated_backup = random_password.backup.result
}
