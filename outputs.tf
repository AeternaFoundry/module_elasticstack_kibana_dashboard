output "kibana_dashboards_id" {
  description = "Map of id values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no id are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kibana_dashboards_access_control" {
  description = "Map of access_control values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no access_control are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.access_control if v.access_control != null && length(v.access_control) > 0 }
}
output "kibana_dashboards_dashboard_id" {
  description = "Map of dashboard_id values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no dashboard_id are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.dashboard_id if v.dashboard_id != null && length(v.dashboard_id) > 0 }
}
output "kibana_dashboards_description" {
  description = "Map of description values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no description are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.description if v.description != null && length(v.description) > 0 }
}
output "kibana_dashboards_filters" {
  description = "Map of filters values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no filters are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.filters if v.filters != null && length(v.filters) > 0 }
}
output "kibana_dashboards_kibana_connection" {
  description = "Map of kibana_connection values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no kibana_connection are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.kibana_connection if v.kibana_connection != null && length(v.kibana_connection) > 0 }
  sensitive   = true
}
output "kibana_dashboards_options" {
  description = "Map of options values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no options are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.options if v.options != null && length(v.options) > 0 }
}
output "kibana_dashboards_panels" {
  description = "Map of panels values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no panels are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.panels if v.panels != null && length(v.panels) > 0 }
}
output "kibana_dashboards_pinned_panels" {
  description = "Map of pinned_panels values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no pinned_panels are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.pinned_panels if v.pinned_panels != null && length(v.pinned_panels) > 0 }
}
output "kibana_dashboards_query" {
  description = "Map of query values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no query are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.query if v.query != null && length(v.query) > 0 }
}
output "kibana_dashboards_refresh_interval" {
  description = "Map of refresh_interval values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no refresh_interval are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.refresh_interval if v.refresh_interval != null && length(v.refresh_interval) > 0 }
}
output "kibana_dashboards_sections" {
  description = "Map of sections values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no sections are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.sections if v.sections != null && length(v.sections) > 0 }
}
output "kibana_dashboards_space_id" {
  description = "Map of space_id values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no space_id are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.space_id if v.space_id != null && length(v.space_id) > 0 }
}
output "kibana_dashboards_tags" {
  description = "Map of tags values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no tags are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "kibana_dashboards_time_range" {
  description = "Map of time_range values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no time_range are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.time_range if v.time_range != null && length(v.time_range) > 0 }
}
output "kibana_dashboards_title" {
  description = "Map of title values across all kibana_dashboards, keyed the same as var.kibana_dashboards except keys with no title are omitted"
  value       = { for k, v in elasticstack_kibana_dashboard.kibana_dashboards : k => v.title if v.title != null && length(v.title) > 0 }
}

