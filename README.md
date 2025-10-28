# Terraform Random Password Manager

A Terraform module that generates and manages two passwords (active and backup)
with safe rotation and swapping behavior.

## Features
- Generate two passwords on creation
- Rotate only the backup password
- Swap active ↔ backup safely
- Idempotent and substrate-agnostic
- Prevents rotate and swap in the same run

## Usage

```hcl
module "password_manager" {
  source = "./modules/terraform-random-password-manager"

  password_length = 24
  rotate_backup   = false
  swap_passwords  = false
}
```

### Rotate Backup Password
```bash
terraform apply -var="rotate_backup=true"
```

### Swap Passwords
```bash
terraform apply -var="swap_passwords=true"
```

> ⚠️ we cannot rotate and swap in the same apply.
