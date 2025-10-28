variable "password_length" {
  description = "Length of generated passwords"
  type        = number
  default     = 20
}

variable "rotate_backup" {
  description = "Set to true to rotate (regenerate) backup password only"
  type        = bool
  default     = false
}

variable "swap_passwords" {
  description = "Set to true to swap active and backup passwords"
  type        = bool
  default     = false
}

variable "active_seed" {
  description = "Optional seed to keep the active password stable"
  type        = string
  default     = "default-active-seed"
}

variable "backup_seed" {
  description = "Optional seed to keep the backup password stable"
  type        = string
  default     = "default-backup-seed"
}
