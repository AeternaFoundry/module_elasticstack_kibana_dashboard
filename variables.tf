variable "kibana_dashboards" {
  description = <<EOT
Map of kibana_dashboards, attributes below
Required:
    - query
    - refresh_interval
    - time_range
    - title
Optional:
    - access_control
    - dashboard_id
    - description
    - filters
    - options
    - panels
    - pinned_panels
    - sections
    - space_id
    - tags
    - timeouts
    - kibana_connection (block):
        - api_key (optional)
        - bearer_token (optional)
        - ca_certs (optional)
        - endpoints (optional)
        - insecure (optional)
        - password (optional)
        - username (optional)
EOT

  type = map(object({
    query = object({
      json     = optional(string)
      language = string
      text     = optional(string)
    })
    refresh_interval = object({
      pause = bool
      value = number
    })
    time_range = object({
      from = string
      mode = optional(string)
      to   = string
    })
    title = string
    access_control = optional(object({
      access_mode = optional(string)
    }))
    dashboard_id = optional(string)
    description  = optional(string)
    filters = optional(list(object({
      filter_json = string
    })))
    options = optional(object({
      auto_apply_filters = optional(bool)
      hide_panel_borders = optional(bool)
      hide_panel_titles  = optional(bool)
      sync_colors        = optional(bool)
      sync_cursor        = optional(bool)
      sync_tooltips      = optional(bool)
      use_margins        = optional(bool)
    }))
    panels = optional(list(object({
      aiops_change_point_chart_config = optional(object({
        aggregation_function = optional(string)
        data_view_id         = string
        description          = optional(string)
        hide_border          = optional(bool)
        hide_title           = optional(bool)
        max_series_to_plot   = optional(number)
        metric_field         = string
        partitions           = optional(set(string))
        split_field          = optional(string)
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title     = optional(string)
        view_type = optional(string)
      }))
      aiops_log_rate_analysis_config = optional(object({
        data_view_id = string
        description  = optional(string)
        hide_border  = optional(bool)
        hide_title   = optional(bool)
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title = optional(string)
      }))
      aiops_pattern_analysis_config = optional(object({
        data_view_id               = string
        description                = optional(string)
        field_name                 = string
        hide_border                = optional(bool)
        hide_title                 = optional(bool)
        minimum_time_range         = optional(string)
        random_sampler_mode        = optional(string)
        random_sampler_probability = optional(number)
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title = optional(string)
      }))
      apm_service_map_config = optional(object({
        alert_status_filter         = optional(set(string))
        anomaly_severity_filter     = optional(set(string))
        connection_filter           = optional(set(string))
        description                 = optional(string)
        environment                 = optional(string)
        hide_border                 = optional(bool)
        hide_title                  = optional(bool)
        kuery                       = optional(string)
        map_orientation             = optional(string)
        service_group_id            = optional(string)
        service_name                = optional(string)
        slo_status_filter           = optional(set(string))
        sync_with_dashboard_filters = optional(bool)
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title = optional(string)
      }))
      config_json = optional(string)
      discover_session_config = optional(object({
        by_reference = optional(object({
          overrides = optional(object({
            column_order = optional(list(string))
            column_settings = optional(map(object({
              width = optional(number)
            })))
            density           = optional(string)
            header_row_height = optional(string)
            row_height        = optional(string)
            rows_per_page     = optional(number)
            sample_size       = optional(number)
            sort = optional(list(object({
              direction = string
              name      = string
            })))
          }))
          ref_id          = string
          selected_tab_id = optional(string)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
        }))
        by_value = optional(object({
          tab = object({
            dsl = optional(object({
              column_order = optional(list(string))
              column_settings = optional(map(object({
                width = optional(number)
              })))
              data_source_json = string
              density          = optional(string)
              filters = optional(list(object({
                filter_json = string
              })))
              header_row_height = optional(string)
              query = object({
                expression = string
                language   = optional(string)
              })
              row_height    = optional(string)
              rows_per_page = optional(number)
              sample_size   = optional(number)
              sort = optional(list(object({
                direction = string
                name      = string
              })))
              view_mode = optional(string)
            }))
            esql = optional(object({
              column_order = optional(list(string))
              column_settings = optional(map(object({
                width = optional(number)
              })))
              data_source_json  = string
              density           = optional(string)
              header_row_height = optional(string)
              row_height        = optional(string)
              sort = optional(list(object({
                direction = string
                name      = string
              })))
            }))
          })
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
        }))
        description = optional(string)
        drilldowns = optional(list(object({
          encode_url      = optional(bool)
          label           = string
          open_in_new_tab = optional(bool)
          url             = string
        })))
        hide_border = optional(bool)
        hide_title  = optional(bool)
        title       = optional(string)
      }))
      esql_control_config = optional(object({
        available_options = optional(list(string))
        control_type      = string
        display_settings = optional(object({
          hide_action_bar = optional(bool)
          hide_exclude    = optional(bool)
          hide_exists     = optional(bool)
          hide_sort       = optional(bool)
          placeholder     = optional(string)
        }))
        esql_query       = string
        selected_options = list(string)
        single_select    = optional(bool)
        title            = optional(string)
        variable_name    = string
        variable_type    = string
      }))
      field_stats_table_config = optional(object({
        by_dataview = optional(object({
          data_view_id       = string
          description        = optional(string)
          hide_border        = optional(bool)
          hide_title         = optional(bool)
          show_distributions = optional(bool)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        by_esql = optional(object({
          description        = optional(string)
          hide_border        = optional(bool)
          hide_title         = optional(bool)
          query              = string
          show_distributions = optional(bool)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
      }))
      grid = object({
        h = optional(number)
        w = optional(number)
        x = number
        y = number
      })
      id = optional(string)
      image_config = optional(object({
        alt_text         = optional(string)
        background_color = optional(string)
        description      = optional(string)
        drilldowns = optional(list(object({
          dashboard_drilldown = optional(object({
            dashboard_id    = string
            label           = string
            open_in_new_tab = optional(bool)
            trigger         = string
            use_filters     = optional(bool)
            use_time_range  = optional(bool)
          }))
          url_drilldown = optional(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            trigger         = string
            url             = string
          }))
        })))
        hide_border = optional(bool)
        hide_title  = optional(bool)
        object_fit  = optional(string)
        src = object({
          file = optional(object({
            file_id = string
          }))
          url = optional(object({
            url = string
          }))
        })
        title = optional(string)
      }))
      links_config = optional(object({
        by_reference = optional(object({
          description = optional(string)
          hide_border = optional(bool)
          hide_title  = optional(bool)
          ref_id      = string
          title       = optional(string)
        }))
        by_value = optional(object({
          description = optional(string)
          hide_border = optional(bool)
          hide_title  = optional(bool)
          layout      = string
          links = list(object({
            destination     = string
            encode_url      = optional(bool)
            label           = optional(string)
            open_in_new_tab = optional(bool)
            type            = string
            use_filters     = optional(bool)
            use_time_range  = optional(bool)
          }))
          title = optional(string)
        }))
      }))
      markdown_config = optional(object({
        by_reference = optional(object({
          description = optional(string)
          hide_border = optional(bool)
          hide_title  = optional(bool)
          ref_id      = string
          title       = optional(string)
        }))
        by_value = optional(object({
          content     = string
          description = optional(string)
          hide_border = optional(bool)
          hide_title  = optional(bool)
          settings = object({
            open_links_in_new_tab = optional(bool)
          })
          title = optional(string)
        }))
      }))
      ml_anomaly_charts_config = optional(object({
        description        = optional(string)
        hide_border        = optional(bool)
        hide_title         = optional(bool)
        job_ids            = list(string)
        max_series_to_plot = optional(number)
        severity_threshold = optional(list(object({
          max      = optional(number)
          min      = optional(number)
          severity = optional(string)
        })))
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title = optional(string)
      }))
      ml_anomaly_swimlane_config = optional(object({
        description   = optional(string)
        hide_border   = optional(bool)
        hide_title    = optional(bool)
        job_ids       = list(string)
        per_page      = optional(number)
        swimlane_type = string
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title   = optional(string)
        view_by = optional(string)
      }))
      ml_single_metric_viewer_config = optional(object({
        description             = optional(string)
        forecast_id             = optional(string)
        function_description    = optional(string)
        hide_border             = optional(bool)
        hide_title              = optional(bool)
        job_ids                 = list(string)
        selected_detector_index = optional(number)
        selected_entities = optional(map(object({
          numeric_value = optional(number)
          string_value  = optional(string)
        })))
        time_range = optional(object({
          from = string
          mode = optional(string)
          to   = string
        }))
        title = optional(string)
      }))
      options_list_control_config = optional(object({
        by_esql = optional(object({
          display_settings = optional(object({
            hide_action_bar = optional(bool)
            hide_exclude    = optional(bool)
            hide_exists     = optional(bool)
            hide_sort       = optional(bool)
            placeholder     = optional(string)
          }))
          esql_query         = string
          exclude            = optional(bool)
          exists_selected    = optional(bool)
          ignore_validations = optional(bool)
          run_past_timeout   = optional(bool)
          search_technique   = optional(string)
          selected_options   = optional(list(string))
          single_select      = optional(bool)
          sort = optional(object({
            by        = string
            direction = string
          }))
          title              = optional(string)
          use_global_filters = optional(bool)
          values_source      = string
        }))
        by_field = optional(object({
          data_view_id = string
          display_settings = optional(object({
            hide_action_bar = optional(bool)
            hide_exclude    = optional(bool)
            hide_exists     = optional(bool)
            hide_sort       = optional(bool)
            placeholder     = optional(string)
          }))
          exclude            = optional(bool)
          exists_selected    = optional(bool)
          field_name         = string
          ignore_validations = optional(bool)
          run_past_timeout   = optional(bool)
          search_technique   = optional(string)
          selected_options   = optional(list(string))
          single_select      = optional(bool)
          sort = optional(object({
            by        = string
            direction = string
          }))
          title              = optional(string)
          use_global_filters = optional(bool)
        }))
      }))
      range_slider_control_config = optional(object({
        by_esql = optional(object({
          esql_query         = string
          ignore_validations = optional(bool)
          step               = optional(number)
          title              = optional(string)
          use_global_filters = optional(bool)
          value              = optional(list(string))
          values_source      = string
        }))
        by_field = optional(object({
          data_view_id       = string
          field_name         = string
          ignore_validations = optional(bool)
          step               = optional(number)
          title              = optional(string)
          use_global_filters = optional(bool)
          value              = optional(list(string))
        }))
      }))
      slo_alerts_config = optional(object({
        description = optional(string)
        drilldowns = optional(list(object({
          encode_url      = optional(bool)
          label           = string
          open_in_new_tab = optional(bool)
          url             = string
        })))
        hide_border = optional(bool)
        hide_title  = optional(bool)
        slos = list(object({
          slo_id          = string
          slo_instance_id = optional(string)
        }))
        title = optional(string)
      }))
      slo_burn_rate_config = optional(object({
        description = optional(string)
        drilldowns = optional(list(object({
          encode_url      = optional(bool)
          label           = string
          open_in_new_tab = optional(bool)
          url             = string
        })))
        duration        = string
        hide_border     = optional(bool)
        hide_title      = optional(bool)
        slo_id          = string
        slo_instance_id = optional(string)
        title           = optional(string)
      }))
      slo_error_budget_config = optional(object({
        description = optional(string)
        drilldowns = optional(list(object({
          encode_url      = optional(bool)
          label           = string
          open_in_new_tab = optional(bool)
          url             = string
        })))
        hide_border     = optional(bool)
        hide_title      = optional(bool)
        slo_id          = string
        slo_instance_id = optional(string)
        title           = optional(string)
      }))
      slo_overview_config = optional(object({
        groups = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          group_filters = optional(object({
            filters_json = optional(string)
            group_by     = optional(string)
            groups       = optional(list(string))
            kql_query    = optional(string)
          }))
          hide_border = optional(bool)
          hide_title  = optional(bool)
          title       = optional(string)
        }))
        single = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          hide_border     = optional(bool)
          hide_title      = optional(bool)
          remote_name     = optional(string)
          slo_id          = string
          slo_instance_id = optional(string)
          title           = optional(string)
        }))
      }))
      synthetics_monitors_config = optional(object({
        description = optional(string)
        filters = optional(object({
          locations = optional(list(object({
            label = string
            value = string
          })))
          monitor_ids = optional(list(object({
            label = string
            value = string
          })))
          monitor_types = optional(list(object({
            label = string
            value = string
          })))
          projects = optional(list(object({
            label = string
            value = string
          })))
          tags = optional(list(object({
            label = string
            value = string
          })))
        }))
        hide_border = optional(bool)
        hide_title  = optional(bool)
        title       = optional(string)
        view        = optional(string)
      }))
      synthetics_stats_overview_config = optional(object({
        description = optional(string)
        drilldowns = optional(list(object({
          encode_url      = optional(bool)
          label           = string
          open_in_new_tab = optional(bool)
          url             = string
        })))
        filters = optional(object({
          locations = optional(list(object({
            label = string
            value = string
          })))
          monitor_ids = optional(list(object({
            label = string
            value = string
          })))
          monitor_types = optional(list(object({
            label = string
            value = string
          })))
          projects = optional(list(object({
            label = string
            value = string
          })))
          tags = optional(list(object({
            label = string
            value = string
          })))
        }))
        hide_border = optional(bool)
        hide_title  = optional(bool)
        title       = optional(string)
      }))
      time_slider_control_config = optional(object({
        end_percentage_of_time_range   = optional(number)
        is_anchored                    = optional(bool)
        start_percentage_of_time_range = optional(number)
      }))
      type = string
      vis_config = optional(object({
        by_reference = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            dashboard = optional(object({
              dashboard_id    = string
              label           = string
              open_in_new_tab = optional(bool)
              use_filters     = optional(bool)
              use_time_range  = optional(bool)
            }))
            discover = optional(object({
              label           = string
              open_in_new_tab = optional(bool)
            }))
            url = optional(object({
              encode_url      = optional(bool)
              label           = string
              open_in_new_tab = optional(bool)
              trigger         = string
              url             = string
            }))
          })))
          hide_border     = optional(bool)
          hide_title      = optional(bool)
          ref_id          = string
          references_json = optional(string)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        by_value = optional(object({
          datatable_config = optional(object({
            esql = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metrics = list(object({
                config_json = string
              }))
              references_json = optional(string)
              rows = optional(list(object({
                config_json = string
              })))
              sampling = optional(number)
              split_metrics_by = optional(list(object({
                config_json = string
              })))
              styling = object({
                density = object({
                  height = optional(object({
                    header = optional(object({
                      max_lines = optional(number)
                      type      = optional(string)
                    }))
                    value = optional(object({
                      lines = optional(number)
                      type  = optional(string)
                    }))
                  }))
                  mode = optional(string)
                })
                paging       = optional(number)
                sort_by_json = optional(string)
              })
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            no_esql = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metrics = list(object({
                config_json = string
              }))
              query = object({
                expression = string
                language   = optional(string)
              })
              references_json = optional(string)
              rows = optional(list(object({
                config_json = string
              })))
              sampling = optional(number)
              split_metrics_by = optional(list(object({
                config_json = string
              })))
              styling = object({
                density = object({
                  height = optional(object({
                    header = optional(object({
                      max_lines = optional(number)
                      type      = optional(string)
                    }))
                    value = optional(object({
                      lines = optional(number)
                      type  = optional(string)
                    }))
                  }))
                  mode = optional(string)
                })
                paging       = optional(number)
                sort_by_json = optional(string)
              })
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
          }))
          gauge_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            esql_metric = optional(object({
              color_json  = optional(string)
              column      = string
              format_json = string
              goal = optional(object({
                column = string
                label  = optional(string)
              }))
              label = optional(string)
              max = optional(object({
                column = string
                label  = optional(string)
              }))
              min = optional(object({
                column = string
                label  = optional(string)
              }))
              subtitle = optional(string)
              ticks = optional(object({
                mode    = optional(string)
                visible = optional(bool)
              }))
              title = optional(object({
                text    = optional(string)
                visible = optional(bool)
              }))
            }))
            filters = optional(list(object({
              filter_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            metric_json           = optional(string)
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            styling = object({
              shape_json = optional(string)
            })
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          heatmap_config = optional(object({
            axis = object({
              x = optional(object({
                labels = optional(object({
                  orientation = optional(string)
                  visible     = optional(bool)
                }))
                title = optional(object({
                  value   = optional(string)
                  visible = optional(bool)
                }))
              }))
              y = optional(object({
                labels = optional(object({
                  visible = optional(bool)
                }))
                title = optional(object({
                  value   = optional(string)
                  visible = optional(bool)
                }))
              }))
            })
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            legend = object({
              size                 = string
              truncate_after_lines = optional(number)
              visibility           = optional(string)
            })
            metric_json = string
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            styling = object({
              cells = object({
                labels = optional(object({
                  visible = optional(bool)
                }))
              })
            })
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title       = optional(string)
            x_axis_json = string
            y_axis_json = optional(string)
          }))
          legacy_metric_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            metric_json           = string
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          metric_chart_config = optional(object({
            breakdown_by_json = optional(string)
            data_source_json  = string
            description       = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            metrics = list(object({
              config_json = string
            }))
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          mosaic_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            esql_group_by = optional(list(object({
              collapse_by = string
              color_json  = string
              column      = string
              format_json = optional(string)
              label       = optional(string)
            })))
            esql_metrics = optional(list(object({
              column      = string
              format_json = string
              label       = optional(string)
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            group_breakdown_by_json = string
            group_by_json           = optional(string)
            hide_border             = optional(bool)
            hide_title              = optional(bool)
            ignore_global_filters   = optional(bool)
            legend = object({
              nested               = optional(bool)
              size                 = string
              truncate_after_lines = optional(number)
              visible              = optional(string)
            })
            metrics_json = optional(string)
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
            value_display = optional(object({
              mode             = string
              percent_decimals = optional(number)
            }))
          }))
          pie_chart_config = optional(object({
            data_source_json = string
            description      = optional(string)
            donut_hole       = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            group_by = optional(list(object({
              config_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            label_position        = optional(string)
            legend = optional(object({
              nested               = optional(bool)
              size                 = string
              truncate_after_lines = optional(number)
              visible              = optional(string)
            }))
            metrics = list(object({
              config_json = string
            }))
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          region_map_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            metric_json           = string
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            region_json     = string
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          tagcloud_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            esql_metric = optional(object({
              column      = string
              format_json = string
              label       = optional(string)
            }))
            esql_tag_by = optional(object({
              color_json  = string
              column      = string
              format_json = string
              label       = optional(string)
            }))
            filters = optional(list(object({
              filter_json = string
            })))
            font_size = optional(object({
              max = optional(number)
              min = optional(number)
            }))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            metric_json           = optional(string)
            orientation           = optional(string)
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            tag_by_json     = optional(string)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          treemap_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            esql_group_by = optional(list(object({
              collapse_by = string
              color_json  = string
              column      = string
              format_json = optional(string)
              label       = optional(string)
            })))
            esql_metrics = optional(list(object({
              color = object({
                color = string
                type  = string
              })
              column      = string
              format_json = string
              label       = optional(string)
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            group_by_json         = optional(string)
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            legend = object({
              nested               = optional(bool)
              size                 = string
              truncate_after_lines = optional(number)
              visible              = optional(string)
            })
            metrics_json = optional(string)
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
            value_display = optional(object({
              mode             = string
              percent_decimals = optional(number)
            }))
          }))
          waffle_config = optional(object({
            data_source_json = string
            description      = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            esql_group_by = optional(list(object({
              collapse_by = string
              color_json  = string
              column      = string
              format_json = optional(string)
              label       = optional(string)
            })))
            esql_metrics = optional(list(object({
              color = object({
                color = string
                type  = string
              })
              column      = string
              format_json = string
              label       = optional(string)
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            group_by = optional(list(object({
              config_json = string
            })))
            hide_border           = optional(bool)
            hide_title            = optional(bool)
            ignore_global_filters = optional(bool)
            legend = object({
              size                 = string
              truncate_after_lines = optional(number)
              values               = optional(list(string))
              visible              = optional(string)
            })
            metrics = optional(list(object({
              config_json = string
            })))
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            sampling        = optional(number)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
            value_display = optional(object({
              mode             = string
              percent_decimals = optional(number)
            }))
          }))
          xy_chart_config = optional(object({
            axis = object({
              x = optional(object({
                domain_json       = optional(string)
                grid              = optional(bool)
                label_orientation = optional(string)
                scale             = optional(string)
                ticks             = optional(bool)
                title = optional(object({
                  value   = optional(string)
                  visible = optional(bool)
                }))
              }))
              y = optional(object({
                domain_json       = string
                grid              = optional(bool)
                label_orientation = optional(string)
                scale             = optional(string)
                ticks             = optional(bool)
                title = optional(object({
                  value   = optional(string)
                  visible = optional(bool)
                }))
              }))
              y2 = optional(object({
                domain_json       = string
                grid              = optional(bool)
                label_orientation = optional(string)
                scale             = optional(string)
                ticks             = optional(bool)
                title = optional(object({
                  value   = optional(string)
                  visible = optional(bool)
                }))
              }))
            })
            decorations = object({
              fill_opacity             = optional(number)
              line_interpolation       = optional(string)
              minimum_bar_height       = optional(number)
              point_visibility         = optional(string)
              show_current_time_marker = optional(bool)
              show_end_zones           = optional(bool)
              show_value_labels        = optional(bool)
            })
            description = optional(string)
            drilldowns = optional(list(object({
              dashboard_drilldown = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover_drilldown = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url_drilldown = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            filters = optional(list(object({
              filter_json = string
            })))
            fitting = object({
              dotted    = optional(bool)
              end_value = optional(string)
              type      = string
            })
            hide_border = optional(bool)
            hide_title  = optional(bool)
            layers = list(object({
              data_layer = optional(object({
                breakdown_by_json     = optional(string)
                data_source_json      = string
                ignore_global_filters = optional(bool)
                sampling              = optional(number)
                x_json                = optional(string)
                y = list(object({
                  config_json = string
                }))
              }))
              reference_line_layer = optional(object({
                data_source_json      = string
                ignore_global_filters = optional(bool)
                sampling              = optional(number)
                thresholds = list(object({
                  axis         = optional(string)
                  color_json   = optional(string)
                  column       = optional(string)
                  fill         = optional(string)
                  icon         = optional(string)
                  operation    = optional(string)
                  stroke_dash  = optional(string)
                  stroke_width = optional(number)
                  text         = optional(string)
                  value_json   = optional(string)
                }))
              }))
              type = string
            }))
            legend = object({
              alignment            = optional(string)
              columns              = optional(number)
              inside               = optional(bool)
              position             = optional(string)
              size                 = optional(string)
              statistics           = optional(list(string))
              truncate_after_lines = optional(number)
              visibility           = optional(string)
            })
            query = optional(object({
              expression = string
              language   = optional(string)
            }))
            references_json = optional(string)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
        }))
      }))
    })))
    pinned_panels = optional(list(object({
      esql_control_config = optional(object({
        available_options = optional(list(string))
        control_type      = string
        display_settings = optional(object({
          hide_action_bar = optional(bool)
          hide_exclude    = optional(bool)
          hide_exists     = optional(bool)
          hide_sort       = optional(bool)
          placeholder     = optional(string)
        }))
        esql_query       = string
        selected_options = list(string)
        single_select    = optional(bool)
        title            = optional(string)
        variable_name    = string
        variable_type    = string
      }))
      options_list_control_config = optional(object({
        by_esql = optional(object({
          display_settings = optional(object({
            hide_action_bar = optional(bool)
            hide_exclude    = optional(bool)
            hide_exists     = optional(bool)
            hide_sort       = optional(bool)
            placeholder     = optional(string)
          }))
          esql_query         = string
          exclude            = optional(bool)
          exists_selected    = optional(bool)
          ignore_validations = optional(bool)
          run_past_timeout   = optional(bool)
          search_technique   = optional(string)
          selected_options   = optional(list(string))
          single_select      = optional(bool)
          sort = optional(object({
            by        = string
            direction = string
          }))
          title              = optional(string)
          use_global_filters = optional(bool)
          values_source      = string
        }))
        by_field = optional(object({
          data_view_id = string
          display_settings = optional(object({
            hide_action_bar = optional(bool)
            hide_exclude    = optional(bool)
            hide_exists     = optional(bool)
            hide_sort       = optional(bool)
            placeholder     = optional(string)
          }))
          exclude            = optional(bool)
          exists_selected    = optional(bool)
          field_name         = string
          ignore_validations = optional(bool)
          run_past_timeout   = optional(bool)
          search_technique   = optional(string)
          selected_options   = optional(list(string))
          single_select      = optional(bool)
          sort = optional(object({
            by        = string
            direction = string
          }))
          title              = optional(string)
          use_global_filters = optional(bool)
        }))
      }))
      range_slider_control_config = optional(object({
        by_esql = optional(object({
          esql_query         = string
          ignore_validations = optional(bool)
          step               = optional(number)
          title              = optional(string)
          use_global_filters = optional(bool)
          value              = optional(list(string))
          values_source      = string
        }))
        by_field = optional(object({
          data_view_id       = string
          field_name         = string
          ignore_validations = optional(bool)
          step               = optional(number)
          title              = optional(string)
          use_global_filters = optional(bool)
          value              = optional(list(string))
        }))
      }))
      time_slider_control_config = optional(object({
        end_percentage_of_time_range   = optional(number)
        is_anchored                    = optional(bool)
        start_percentage_of_time_range = optional(number)
      }))
      type = string
    })))
    sections = optional(list(object({
      collapsed = optional(bool)
      grid = object({
        y = number
      })
      id = optional(string)
      panels = optional(list(object({
        aiops_change_point_chart_config = optional(object({
          aggregation_function = optional(string)
          data_view_id         = string
          description          = optional(string)
          hide_border          = optional(bool)
          hide_title           = optional(bool)
          max_series_to_plot   = optional(number)
          metric_field         = string
          partitions           = optional(set(string))
          split_field          = optional(string)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title     = optional(string)
          view_type = optional(string)
        }))
        aiops_log_rate_analysis_config = optional(object({
          data_view_id = string
          description  = optional(string)
          hide_border  = optional(bool)
          hide_title   = optional(bool)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        aiops_pattern_analysis_config = optional(object({
          data_view_id               = string
          description                = optional(string)
          field_name                 = string
          hide_border                = optional(bool)
          hide_title                 = optional(bool)
          minimum_time_range         = optional(string)
          random_sampler_mode        = optional(string)
          random_sampler_probability = optional(number)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        apm_service_map_config = optional(object({
          alert_status_filter         = optional(set(string))
          anomaly_severity_filter     = optional(set(string))
          connection_filter           = optional(set(string))
          description                 = optional(string)
          environment                 = optional(string)
          hide_border                 = optional(bool)
          hide_title                  = optional(bool)
          kuery                       = optional(string)
          map_orientation             = optional(string)
          service_group_id            = optional(string)
          service_name                = optional(string)
          slo_status_filter           = optional(set(string))
          sync_with_dashboard_filters = optional(bool)
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        config_json = optional(string)
        discover_session_config = optional(object({
          by_reference = optional(object({
            overrides = optional(object({
              column_order = optional(list(string))
              column_settings = optional(map(object({
                width = optional(number)
              })))
              density           = optional(string)
              header_row_height = optional(string)
              row_height        = optional(string)
              rows_per_page     = optional(number)
              sample_size       = optional(number)
              sort = optional(list(object({
                direction = string
                name      = string
              })))
            }))
            ref_id          = string
            selected_tab_id = optional(string)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
          }))
          by_value = optional(object({
            tab = object({
              dsl = optional(object({
                column_order = optional(list(string))
                column_settings = optional(map(object({
                  width = optional(number)
                })))
                data_source_json = string
                density          = optional(string)
                filters = optional(list(object({
                  filter_json = string
                })))
                header_row_height = optional(string)
                query = object({
                  expression = string
                  language   = optional(string)
                })
                row_height    = optional(string)
                rows_per_page = optional(number)
                sample_size   = optional(number)
                sort = optional(list(object({
                  direction = string
                  name      = string
                })))
                view_mode = optional(string)
              }))
              esql = optional(object({
                column_order = optional(list(string))
                column_settings = optional(map(object({
                  width = optional(number)
                })))
                data_source_json  = string
                density           = optional(string)
                header_row_height = optional(string)
                row_height        = optional(string)
                sort = optional(list(object({
                  direction = string
                  name      = string
                })))
              }))
            })
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
          }))
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          hide_border = optional(bool)
          hide_title  = optional(bool)
          title       = optional(string)
        }))
        esql_control_config = optional(object({
          available_options = optional(list(string))
          control_type      = string
          display_settings = optional(object({
            hide_action_bar = optional(bool)
            hide_exclude    = optional(bool)
            hide_exists     = optional(bool)
            hide_sort       = optional(bool)
            placeholder     = optional(string)
          }))
          esql_query       = string
          selected_options = list(string)
          single_select    = optional(bool)
          title            = optional(string)
          variable_name    = string
          variable_type    = string
        }))
        field_stats_table_config = optional(object({
          by_dataview = optional(object({
            data_view_id       = string
            description        = optional(string)
            hide_border        = optional(bool)
            hide_title         = optional(bool)
            show_distributions = optional(bool)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          by_esql = optional(object({
            description        = optional(string)
            hide_border        = optional(bool)
            hide_title         = optional(bool)
            query              = string
            show_distributions = optional(bool)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
        }))
        grid = object({
          h = optional(number)
          w = optional(number)
          x = number
          y = number
        })
        id = optional(string)
        image_config = optional(object({
          alt_text         = optional(string)
          background_color = optional(string)
          description      = optional(string)
          drilldowns = optional(list(object({
            dashboard_drilldown = optional(object({
              dashboard_id    = string
              label           = string
              open_in_new_tab = optional(bool)
              trigger         = string
              use_filters     = optional(bool)
              use_time_range  = optional(bool)
            }))
            url_drilldown = optional(object({
              encode_url      = optional(bool)
              label           = string
              open_in_new_tab = optional(bool)
              trigger         = string
              url             = string
            }))
          })))
          hide_border = optional(bool)
          hide_title  = optional(bool)
          object_fit  = optional(string)
          src = object({
            file = optional(object({
              file_id = string
            }))
            url = optional(object({
              url = string
            }))
          })
          title = optional(string)
        }))
        links_config = optional(object({
          by_reference = optional(object({
            description = optional(string)
            hide_border = optional(bool)
            hide_title  = optional(bool)
            ref_id      = string
            title       = optional(string)
          }))
          by_value = optional(object({
            description = optional(string)
            hide_border = optional(bool)
            hide_title  = optional(bool)
            layout      = string
            links = list(object({
              destination     = string
              encode_url      = optional(bool)
              label           = optional(string)
              open_in_new_tab = optional(bool)
              type            = string
              use_filters     = optional(bool)
              use_time_range  = optional(bool)
            }))
            title = optional(string)
          }))
        }))
        markdown_config = optional(object({
          by_reference = optional(object({
            description = optional(string)
            hide_border = optional(bool)
            hide_title  = optional(bool)
            ref_id      = string
            title       = optional(string)
          }))
          by_value = optional(object({
            content     = string
            description = optional(string)
            hide_border = optional(bool)
            hide_title  = optional(bool)
            settings = object({
              open_links_in_new_tab = optional(bool)
            })
            title = optional(string)
          }))
        }))
        ml_anomaly_charts_config = optional(object({
          description        = optional(string)
          hide_border        = optional(bool)
          hide_title         = optional(bool)
          job_ids            = list(string)
          max_series_to_plot = optional(number)
          severity_threshold = optional(list(object({
            max      = optional(number)
            min      = optional(number)
            severity = optional(string)
          })))
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        ml_anomaly_swimlane_config = optional(object({
          description   = optional(string)
          hide_border   = optional(bool)
          hide_title    = optional(bool)
          job_ids       = list(string)
          per_page      = optional(number)
          swimlane_type = string
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title   = optional(string)
          view_by = optional(string)
        }))
        ml_single_metric_viewer_config = optional(object({
          description             = optional(string)
          forecast_id             = optional(string)
          function_description    = optional(string)
          hide_border             = optional(bool)
          hide_title              = optional(bool)
          job_ids                 = list(string)
          selected_detector_index = optional(number)
          selected_entities = optional(map(object({
            numeric_value = optional(number)
            string_value  = optional(string)
          })))
          time_range = optional(object({
            from = string
            mode = optional(string)
            to   = string
          }))
          title = optional(string)
        }))
        options_list_control_config = optional(object({
          by_esql = optional(object({
            display_settings = optional(object({
              hide_action_bar = optional(bool)
              hide_exclude    = optional(bool)
              hide_exists     = optional(bool)
              hide_sort       = optional(bool)
              placeholder     = optional(string)
            }))
            esql_query         = string
            exclude            = optional(bool)
            exists_selected    = optional(bool)
            ignore_validations = optional(bool)
            run_past_timeout   = optional(bool)
            search_technique   = optional(string)
            selected_options   = optional(list(string))
            single_select      = optional(bool)
            sort = optional(object({
              by        = string
              direction = string
            }))
            title              = optional(string)
            use_global_filters = optional(bool)
            values_source      = string
          }))
          by_field = optional(object({
            data_view_id = string
            display_settings = optional(object({
              hide_action_bar = optional(bool)
              hide_exclude    = optional(bool)
              hide_exists     = optional(bool)
              hide_sort       = optional(bool)
              placeholder     = optional(string)
            }))
            exclude            = optional(bool)
            exists_selected    = optional(bool)
            field_name         = string
            ignore_validations = optional(bool)
            run_past_timeout   = optional(bool)
            search_technique   = optional(string)
            selected_options   = optional(list(string))
            single_select      = optional(bool)
            sort = optional(object({
              by        = string
              direction = string
            }))
            title              = optional(string)
            use_global_filters = optional(bool)
          }))
        }))
        range_slider_control_config = optional(object({
          by_esql = optional(object({
            esql_query         = string
            ignore_validations = optional(bool)
            step               = optional(number)
            title              = optional(string)
            use_global_filters = optional(bool)
            value              = optional(list(string))
            values_source      = string
          }))
          by_field = optional(object({
            data_view_id       = string
            field_name         = string
            ignore_validations = optional(bool)
            step               = optional(number)
            title              = optional(string)
            use_global_filters = optional(bool)
            value              = optional(list(string))
          }))
        }))
        slo_alerts_config = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          hide_border = optional(bool)
          hide_title  = optional(bool)
          slos = list(object({
            slo_id          = string
            slo_instance_id = optional(string)
          }))
          title = optional(string)
        }))
        slo_burn_rate_config = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          duration        = string
          hide_border     = optional(bool)
          hide_title      = optional(bool)
          slo_id          = string
          slo_instance_id = optional(string)
          title           = optional(string)
        }))
        slo_error_budget_config = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          hide_border     = optional(bool)
          hide_title      = optional(bool)
          slo_id          = string
          slo_instance_id = optional(string)
          title           = optional(string)
        }))
        slo_overview_config = optional(object({
          groups = optional(object({
            description = optional(string)
            drilldowns = optional(list(object({
              encode_url      = optional(bool)
              label           = string
              open_in_new_tab = optional(bool)
              url             = string
            })))
            group_filters = optional(object({
              filters_json = optional(string)
              group_by     = optional(string)
              groups       = optional(list(string))
              kql_query    = optional(string)
            }))
            hide_border = optional(bool)
            hide_title  = optional(bool)
            title       = optional(string)
          }))
          single = optional(object({
            description = optional(string)
            drilldowns = optional(list(object({
              encode_url      = optional(bool)
              label           = string
              open_in_new_tab = optional(bool)
              url             = string
            })))
            hide_border     = optional(bool)
            hide_title      = optional(bool)
            remote_name     = optional(string)
            slo_id          = string
            slo_instance_id = optional(string)
            title           = optional(string)
          }))
        }))
        synthetics_monitors_config = optional(object({
          description = optional(string)
          filters = optional(object({
            locations = optional(list(object({
              label = string
              value = string
            })))
            monitor_ids = optional(list(object({
              label = string
              value = string
            })))
            monitor_types = optional(list(object({
              label = string
              value = string
            })))
            projects = optional(list(object({
              label = string
              value = string
            })))
            tags = optional(list(object({
              label = string
              value = string
            })))
          }))
          hide_border = optional(bool)
          hide_title  = optional(bool)
          title       = optional(string)
          view        = optional(string)
        }))
        synthetics_stats_overview_config = optional(object({
          description = optional(string)
          drilldowns = optional(list(object({
            encode_url      = optional(bool)
            label           = string
            open_in_new_tab = optional(bool)
            url             = string
          })))
          filters = optional(object({
            locations = optional(list(object({
              label = string
              value = string
            })))
            monitor_ids = optional(list(object({
              label = string
              value = string
            })))
            monitor_types = optional(list(object({
              label = string
              value = string
            })))
            projects = optional(list(object({
              label = string
              value = string
            })))
            tags = optional(list(object({
              label = string
              value = string
            })))
          }))
          hide_border = optional(bool)
          hide_title  = optional(bool)
          title       = optional(string)
        }))
        time_slider_control_config = optional(object({
          end_percentage_of_time_range   = optional(number)
          is_anchored                    = optional(bool)
          start_percentage_of_time_range = optional(number)
        }))
        type = string
        vis_config = optional(object({
          by_reference = optional(object({
            description = optional(string)
            drilldowns = optional(list(object({
              dashboard = optional(object({
                dashboard_id    = string
                label           = string
                open_in_new_tab = optional(bool)
                use_filters     = optional(bool)
                use_time_range  = optional(bool)
              }))
              discover = optional(object({
                label           = string
                open_in_new_tab = optional(bool)
              }))
              url = optional(object({
                encode_url      = optional(bool)
                label           = string
                open_in_new_tab = optional(bool)
                trigger         = string
                url             = string
              }))
            })))
            hide_border     = optional(bool)
            hide_title      = optional(bool)
            ref_id          = string
            references_json = optional(string)
            time_range = optional(object({
              from = string
              mode = optional(string)
              to   = string
            }))
            title = optional(string)
          }))
          by_value = optional(object({
            datatable_config = optional(object({
              esql = optional(object({
                data_source_json = string
                description      = optional(string)
                drilldowns = optional(list(object({
                  dashboard_drilldown = optional(object({
                    dashboard_id    = string
                    label           = string
                    open_in_new_tab = optional(bool)
                    use_filters     = optional(bool)
                    use_time_range  = optional(bool)
                  }))
                  discover_drilldown = optional(object({
                    label           = string
                    open_in_new_tab = optional(bool)
                  }))
                  url_drilldown = optional(object({
                    encode_url      = optional(bool)
                    label           = string
                    open_in_new_tab = optional(bool)
                    trigger         = string
                    url             = string
                  }))
                })))
                filters = optional(list(object({
                  filter_json = string
                })))
                hide_border           = optional(bool)
                hide_title            = optional(bool)
                ignore_global_filters = optional(bool)
                metrics = list(object({
                  config_json = string
                }))
                references_json = optional(string)
                rows = optional(list(object({
                  config_json = string
                })))
                sampling = optional(number)
                split_metrics_by = optional(list(object({
                  config_json = string
                })))
                styling = object({
                  density = object({
                    height = optional(object({
                      header = optional(object({
                        max_lines = optional(number)
                        type      = optional(string)
                      }))
                      value = optional(object({
                        lines = optional(number)
                        type  = optional(string)
                      }))
                    }))
                    mode = optional(string)
                  })
                  paging       = optional(number)
                  sort_by_json = optional(string)
                })
                time_range = optional(object({
                  from = string
                  mode = optional(string)
                  to   = string
                }))
                title = optional(string)
              }))
              no_esql = optional(object({
                data_source_json = string
                description      = optional(string)
                drilldowns = optional(list(object({
                  dashboard_drilldown = optional(object({
                    dashboard_id    = string
                    label           = string
                    open_in_new_tab = optional(bool)
                    use_filters     = optional(bool)
                    use_time_range  = optional(bool)
                  }))
                  discover_drilldown = optional(object({
                    label           = string
                    open_in_new_tab = optional(bool)
                  }))
                  url_drilldown = optional(object({
                    encode_url      = optional(bool)
                    label           = string
                    open_in_new_tab = optional(bool)
                    trigger         = string
                    url             = string
                  }))
                })))
                filters = optional(list(object({
                  filter_json = string
                })))
                hide_border           = optional(bool)
                hide_title            = optional(bool)
                ignore_global_filters = optional(bool)
                metrics = list(object({
                  config_json = string
                }))
                query = object({
                  expression = string
                  language   = optional(string)
                })
                references_json = optional(string)
                rows = optional(list(object({
                  config_json = string
                })))
                sampling = optional(number)
                split_metrics_by = optional(list(object({
                  config_json = string
                })))
                styling = object({
                  density = object({
                    height = optional(object({
                      header = optional(object({
                        max_lines = optional(number)
                        type      = optional(string)
                      }))
                      value = optional(object({
                        lines = optional(number)
                        type  = optional(string)
                      }))
                    }))
                    mode = optional(string)
                  })
                  paging       = optional(number)
                  sort_by_json = optional(string)
                })
                time_range = optional(object({
                  from = string
                  mode = optional(string)
                  to   = string
                }))
                title = optional(string)
              }))
            }))
            gauge_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              esql_metric = optional(object({
                color_json  = optional(string)
                column      = string
                format_json = string
                goal = optional(object({
                  column = string
                  label  = optional(string)
                }))
                label = optional(string)
                max = optional(object({
                  column = string
                  label  = optional(string)
                }))
                min = optional(object({
                  column = string
                  label  = optional(string)
                }))
                subtitle = optional(string)
                ticks = optional(object({
                  mode    = optional(string)
                  visible = optional(bool)
                }))
                title = optional(object({
                  text    = optional(string)
                  visible = optional(bool)
                }))
              }))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metric_json           = optional(string)
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              styling = object({
                shape_json = optional(string)
              })
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            heatmap_config = optional(object({
              axis = object({
                x = optional(object({
                  labels = optional(object({
                    orientation = optional(string)
                    visible     = optional(bool)
                  }))
                  title = optional(object({
                    value   = optional(string)
                    visible = optional(bool)
                  }))
                }))
                y = optional(object({
                  labels = optional(object({
                    visible = optional(bool)
                  }))
                  title = optional(object({
                    value   = optional(string)
                    visible = optional(bool)
                  }))
                }))
              })
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              legend = object({
                size                 = string
                truncate_after_lines = optional(number)
                visibility           = optional(string)
              })
              metric_json = string
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              styling = object({
                cells = object({
                  labels = optional(object({
                    visible = optional(bool)
                  }))
                })
              })
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title       = optional(string)
              x_axis_json = string
              y_axis_json = optional(string)
            }))
            legacy_metric_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metric_json           = string
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            metric_chart_config = optional(object({
              breakdown_by_json = optional(string)
              data_source_json  = string
              description       = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metrics = list(object({
                config_json = string
              }))
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            mosaic_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              esql_group_by = optional(list(object({
                collapse_by = string
                color_json  = string
                column      = string
                format_json = optional(string)
                label       = optional(string)
              })))
              esql_metrics = optional(list(object({
                column      = string
                format_json = string
                label       = optional(string)
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              group_breakdown_by_json = string
              group_by_json           = optional(string)
              hide_border             = optional(bool)
              hide_title              = optional(bool)
              ignore_global_filters   = optional(bool)
              legend = object({
                nested               = optional(bool)
                size                 = string
                truncate_after_lines = optional(number)
                visible              = optional(string)
              })
              metrics_json = optional(string)
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
              value_display = optional(object({
                mode             = string
                percent_decimals = optional(number)
              }))
            }))
            pie_chart_config = optional(object({
              data_source_json = string
              description      = optional(string)
              donut_hole       = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              group_by = optional(list(object({
                config_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              label_position        = optional(string)
              legend = optional(object({
                nested               = optional(bool)
                size                 = string
                truncate_after_lines = optional(number)
                visible              = optional(string)
              }))
              metrics = list(object({
                config_json = string
              }))
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            region_map_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metric_json           = string
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              region_json     = string
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            tagcloud_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              esql_metric = optional(object({
                column      = string
                format_json = string
                label       = optional(string)
              }))
              esql_tag_by = optional(object({
                color_json  = string
                column      = string
                format_json = string
                label       = optional(string)
              }))
              filters = optional(list(object({
                filter_json = string
              })))
              font_size = optional(object({
                max = optional(number)
                min = optional(number)
              }))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              metric_json           = optional(string)
              orientation           = optional(string)
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              tag_by_json     = optional(string)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
            treemap_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              esql_group_by = optional(list(object({
                collapse_by = string
                color_json  = string
                column      = string
                format_json = optional(string)
                label       = optional(string)
              })))
              esql_metrics = optional(list(object({
                color = object({
                  color = string
                  type  = string
                })
                column      = string
                format_json = string
                label       = optional(string)
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              group_by_json         = optional(string)
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              legend = object({
                nested               = optional(bool)
                size                 = string
                truncate_after_lines = optional(number)
                visible              = optional(string)
              })
              metrics_json = optional(string)
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
              value_display = optional(object({
                mode             = string
                percent_decimals = optional(number)
              }))
            }))
            waffle_config = optional(object({
              data_source_json = string
              description      = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              esql_group_by = optional(list(object({
                collapse_by = string
                color_json  = string
                column      = string
                format_json = optional(string)
                label       = optional(string)
              })))
              esql_metrics = optional(list(object({
                color = object({
                  color = string
                  type  = string
                })
                column      = string
                format_json = string
                label       = optional(string)
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              group_by = optional(list(object({
                config_json = string
              })))
              hide_border           = optional(bool)
              hide_title            = optional(bool)
              ignore_global_filters = optional(bool)
              legend = object({
                size                 = string
                truncate_after_lines = optional(number)
                values               = optional(list(string))
                visible              = optional(string)
              })
              metrics = optional(list(object({
                config_json = string
              })))
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              sampling        = optional(number)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
              value_display = optional(object({
                mode             = string
                percent_decimals = optional(number)
              }))
            }))
            xy_chart_config = optional(object({
              axis = object({
                x = optional(object({
                  domain_json       = optional(string)
                  grid              = optional(bool)
                  label_orientation = optional(string)
                  scale             = optional(string)
                  ticks             = optional(bool)
                  title = optional(object({
                    value   = optional(string)
                    visible = optional(bool)
                  }))
                }))
                y = optional(object({
                  domain_json       = string
                  grid              = optional(bool)
                  label_orientation = optional(string)
                  scale             = optional(string)
                  ticks             = optional(bool)
                  title = optional(object({
                    value   = optional(string)
                    visible = optional(bool)
                  }))
                }))
                y2 = optional(object({
                  domain_json       = string
                  grid              = optional(bool)
                  label_orientation = optional(string)
                  scale             = optional(string)
                  ticks             = optional(bool)
                  title = optional(object({
                    value   = optional(string)
                    visible = optional(bool)
                  }))
                }))
              })
              decorations = object({
                fill_opacity             = optional(number)
                line_interpolation       = optional(string)
                minimum_bar_height       = optional(number)
                point_visibility         = optional(string)
                show_current_time_marker = optional(bool)
                show_end_zones           = optional(bool)
                show_value_labels        = optional(bool)
              })
              description = optional(string)
              drilldowns = optional(list(object({
                dashboard_drilldown = optional(object({
                  dashboard_id    = string
                  label           = string
                  open_in_new_tab = optional(bool)
                  use_filters     = optional(bool)
                  use_time_range  = optional(bool)
                }))
                discover_drilldown = optional(object({
                  label           = string
                  open_in_new_tab = optional(bool)
                }))
                url_drilldown = optional(object({
                  encode_url      = optional(bool)
                  label           = string
                  open_in_new_tab = optional(bool)
                  trigger         = string
                  url             = string
                }))
              })))
              filters = optional(list(object({
                filter_json = string
              })))
              fitting = object({
                dotted    = optional(bool)
                end_value = optional(string)
                type      = string
              })
              hide_border = optional(bool)
              hide_title  = optional(bool)
              layers = list(object({
                data_layer = optional(object({
                  breakdown_by_json     = optional(string)
                  data_source_json      = string
                  ignore_global_filters = optional(bool)
                  sampling              = optional(number)
                  x_json                = optional(string)
                  y = list(object({
                    config_json = string
                  }))
                }))
                reference_line_layer = optional(object({
                  data_source_json      = string
                  ignore_global_filters = optional(bool)
                  sampling              = optional(number)
                  thresholds = list(object({
                    axis         = optional(string)
                    color_json   = optional(string)
                    column       = optional(string)
                    fill         = optional(string)
                    icon         = optional(string)
                    operation    = optional(string)
                    stroke_dash  = optional(string)
                    stroke_width = optional(number)
                    text         = optional(string)
                    value_json   = optional(string)
                  }))
                }))
                type = string
              }))
              legend = object({
                alignment            = optional(string)
                columns              = optional(number)
                inside               = optional(bool)
                position             = optional(string)
                size                 = optional(string)
                statistics           = optional(list(string))
                truncate_after_lines = optional(number)
                visibility           = optional(string)
              })
              query = optional(object({
                expression = string
                language   = optional(string)
              }))
              references_json = optional(string)
              time_range = optional(object({
                from = string
                mode = optional(string)
                to   = string
              }))
              title = optional(string)
            }))
          }))
        }))
      })))
      title = string
    })))
    space_id = optional(string)
    tags     = optional(list(string))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
    kibana_connection = optional(list(object({
      api_key      = optional(string)
      bearer_token = optional(string)
      ca_certs     = optional(list(string))
      endpoints    = optional(list(string))
      insecure     = optional(bool)
      password     = optional(string)
      username     = optional(string)
    })))
  }))
}

