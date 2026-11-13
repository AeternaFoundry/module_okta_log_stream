variable "log_streams" {
  description = <<EOT
Map of log_streams, attributes below
Required:
    - name
    - type
Optional:
    - status
    - settings (block):
        - account_id (optional)
        - edition (optional)
        - event_source_name (optional)
        - host (optional)
        - region (optional)
        - token (optional)
EOT

  type = map(object({
    name   = string
    type   = string
    status = optional(string)
    settings = optional(list(object({
      account_id        = optional(string)
      edition           = optional(string)
      event_source_name = optional(string)
      host              = optional(string)
      region            = optional(string)
      token             = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        contains(["aws_eventbridge", "splunk_cloud_logstreaming"], v.type)
      )
    ])
    error_message = "must be one of: \"aws_eventbridge\", \"splunk_cloud_logstreaming\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.status == null || (contains(["ACTIVE", "INACTIVE"], v.status))
      )
    ])
    error_message = "must be one of: \"ACTIVE\", \"INACTIVE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.settings == null || alltrue([for item in v.settings : (item.account_id == null || (length(item.account_id) <= 12))])
      )
    ])
    error_message = "must be at most 12 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.log_streams : (
        v.settings == null || alltrue([for item in v.settings : (item.edition == null || (contains(["aws", "aws_govcloud", "gcp"], item.edition)))])
      )
    ])
    error_message = "must be one of: \"aws\", \"aws_govcloud\", \"gcp\""
  }
  # Note: 4 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

