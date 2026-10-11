output "log_streams_id" {
  description = "Map of id values across all log_streams, keyed the same as var.log_streams except keys with no id are omitted"
  value       = { for k, v in okta_log_stream.log_streams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "log_streams_name" {
  description = "Map of name values across all log_streams, keyed the same as var.log_streams except keys with no name are omitted"
  value       = { for k, v in okta_log_stream.log_streams : k => v.name if v.name != null && length(v.name) > 0 }
}
output "log_streams_settings" {
  description = "Map of settings values across all log_streams, keyed the same as var.log_streams except keys with no settings are omitted"
  value       = { for k, v in okta_log_stream.log_streams : k => v.settings if v.settings != null && length(v.settings) > 0 }
  sensitive   = true
}
output "log_streams_status" {
  description = "Map of status values across all log_streams, keyed the same as var.log_streams except keys with no status are omitted"
  value       = { for k, v in okta_log_stream.log_streams : k => v.status if v.status != null && length(v.status) > 0 }
}
output "log_streams_type" {
  description = "Map of type values across all log_streams, keyed the same as var.log_streams except keys with no type are omitted"
  value       = { for k, v in okta_log_stream.log_streams : k => v.type if v.type != null && length(v.type) > 0 }
}

