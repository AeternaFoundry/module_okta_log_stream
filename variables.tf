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
}

