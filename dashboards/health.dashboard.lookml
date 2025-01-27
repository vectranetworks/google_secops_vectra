---
- dashboard: health
  title: Health
  layout: newspaper
  description: ''
  preferred_slug: F1hDdwecaihIPNsLqnfcYC
  elements:
  - title: System Table
    name: System Table
    model: vectra_rux_dashboard
    explore: events
    type: looker_grid
    fields: [events__security_result__detection_fields__system_version_last_update.system_version_last_update,
      events__security_result__detection_fields__cpu_user_percent.cpu_user_percent,
      events__security_result__detection_fields__cpu_system_percent.cpu_system_percent,
      events__security_result__detection_fields__cpu_idle_percent.cpu_idle_percent,
      events__security_result__detection_fields__disk_disk_utilization_usage_percent.disk_disk_utilization_usage_percent,
      events__security_result__detection_fields__memory_usage_percent.memory_usage_percent,
      events__security_result__detection_fields__network_traffic_brain_aggregated_peak_traffic_mbps.network_traffic_brain_aggregated_peak_traffic_mbps,
      events__security_result__detection_fields__power_status.power_status, events__security_result__detection_fields__power_error.power_error,
      events.event_time_time]
    filters:
      events.log_type: Health
    sorts: [events.event_time_time desc]
    limit: 1
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result__detection_fields__system_version_last_update_utc.system_version_last_update_utc: Last
        updated
      events__security_result__detection_fields__cpu_user_percent.cpu_user_percent: CPU
        Usage - User(%)
      events__security_result__detection_fields__cpu_system_percent.cpu_system_percent: CPU
        Usage - System(%)
      events__security_result__detection_fields__cpu_idle_percent.cpu_idle_percent: CPU
        Usage - Idle (%)
      events__security_result__detection_fields__disk_disk_utilization_usage_percent.disk_disk_utilization_usage_percent: Disk
        Utilization (%)
      events__security_result__detection_fields__memory_usage_percent.memory_usage_percent: Memory
        Usage (%)
      ? events__security_result__detection_fields__network_traffic_brain_aggregated_peak_traffic_mbps.network_traffic_brain_aggregated_peak_traffic_mbps
      : Aggregated Peak Traffic (Mbps)
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [events.event_time_time]
    listen: {}
    row: 0
    col: 0
    width: 24
    height: 3
  - title: Sensor Table
    name: Sensor Table
    model: vectra_rux_dashboard
    explore: events
    type: looker_grid
    fields: [events.event_time_time, events.observer__hostname, events__observer__ip.events__observer__ip,
      events__security_result__detection_fields__network_aggregated_peak_traffic_mbps.network_aggregated_peak_traffic_mbps,
      events__security_result__detection_fields__connectivity_sensors_status.connectivity_sensors_status,
      events__security_result__detection_fields__trafficdrop_sensors_status.trafficdrop_sensors_status,
      events__security_result__detection_fields__trafficdrop_sensors_error.trafficdrop_sensors_error,
      events__security_result__detection_fields__connectivity_sensors_error.connectivity_sensors_error,
      events__security_result__detection_fields__link_status.link_status]
    filters:
      events.observer__hostname: "-NULL"
      events.log_type: Health
    sorts: [events.event_time_time desc]
    limit: 1
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", events.observer__hostname, events__observer__ip.events__observer__ip,
      events__security_result__detection_fields__connectivity_sensors_status.connectivity_sensors_status,
      events__security_result__detection_fields__connectivity_sensors_error.connectivity_sensors_error,
      events__security_result__detection_fields__trafficdrop_sensors_status.trafficdrop_sensors_status,
      events__security_result__detection_fields__trafficdrop_sensors_error.trafficdrop_sensors_error,
      events__security_result__detection_fields__network_aggregated_peak_traffic_mbps.network_aggregated_peak_traffic_mbps,
      events__security_result__detection_fields__link_status.link_status]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.observer__hostname: Name
      events__observer__ip.events__observer__ip: IP Address
      events__security_result__detection_fields__network_aggregated_peak_traffic_mbps.network_aggregated_peak_traffic_mbps: Aggregated
        Peak Traffic (Mbps)
      events__security_result__detection_fields__connectivity_sensors_status.connectivity_sensors_status: Connectivity
        Status
      events__security_result__detection_fields__trafficdrop_sensors_status.trafficdrop_sensors_status: Trafficdrop
        Status
      events__security_result__detection_fields__trafficdrop_sensors_error.trafficdrop_sensors_error: Trafficdrop
        Error
      events__security_result__detection_fields__connectivity_sensors_error.connectivity_sensors_error: Connectivity
        Error
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [events.event_time_time]
    listen: {}
    row: 3
    col: 0
    width: 24
    height: 3
