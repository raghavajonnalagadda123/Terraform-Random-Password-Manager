terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
}

module "password_manager" {
  source = "./modules/terraform-random-password-manager" # Used the module from parent directory

  password_length = 24
  rotate_backup   = false
  swap_passwords  = false
}

output "active_password" {
  value     = module.password_manager.active_password
  sensitive = true
}

output "backup_password" {
  value     = module.password_manager.backup_password
  sensitive = true
}
