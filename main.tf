resource "elasticstack_kibana_dashboard" "kibana_dashboards" {
  for_each = var.kibana_dashboards

  query            = each.value.query
  refresh_interval = each.value.refresh_interval
  time_range       = each.value.time_range
  title            = each.value.title
  access_control   = each.value.access_control
  dashboard_id     = each.value.dashboard_id
  description      = each.value.description
  filters          = each.value.filters
  options          = each.value.options
  panels           = each.value.panels
  pinned_panels    = each.value.pinned_panels
  sections         = each.value.sections
  space_id         = each.value.space_id
  tags             = each.value.tags
  timeouts         = each.value.timeouts

  dynamic "kibana_connection" {
    for_each = each.value.kibana_connection != null ? each.value.kibana_connection : []
    content {
      api_key      = kibana_connection.value.api_key
      bearer_token = kibana_connection.value.bearer_token
      ca_certs     = kibana_connection.value.ca_certs
      endpoints    = kibana_connection.value.endpoints
      insecure     = kibana_connection.value.insecure
      password     = kibana_connection.value.password
      username     = kibana_connection.value.username
    }
  }
}

