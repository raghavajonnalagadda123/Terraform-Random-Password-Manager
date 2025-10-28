output "active_password" {
  description = "The currently active password"
  value       = local.active_password
  sensitive   = true
}

output "backup_password" {
  description = "The backup password"
  value       = local.backup_password
  sensitive   = true
}
