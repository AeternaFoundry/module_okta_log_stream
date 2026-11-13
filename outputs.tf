output "log_streams_id" {
  description = "Map of id values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in okta_log_stream.log_streams : k => v.id }
}
output "log_streams_name" {
  description = "Map of name values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in okta_log_stream.log_streams : k => v.name }
}
output "log_streams_settings" {
  description = "Map of settings values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in okta_log_stream.log_streams : k => v.settings }
  sensitive   = true
}
output "log_streams_status" {
  description = "Map of status values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in okta_log_stream.log_streams : k => v.status }
}
output "log_streams_type" {
  description = "Map of type values across all log_streams, keyed the same as var.log_streams"
  value       = { for k, v in okta_log_stream.log_streams : k => v.type }
}

