resource "okta_log_stream" "log_streams" {
  for_each = var.log_streams

  name   = each.value.name
  type   = each.value.type
  status = each.value.status

  dynamic "settings" {
    for_each = each.value.settings != null ? each.value.settings : []
    content {
      account_id        = settings.value.account_id
      edition           = settings.value.edition
      event_source_name = settings.value.event_source_name
      host              = settings.value.host
      region            = settings.value.region
      token             = settings.value.token
    }
  }
}

