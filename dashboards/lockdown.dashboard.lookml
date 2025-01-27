---
- dashboard: lockdown
  title: Lockdown
  layout: newspaper
  description: ''
  preferred_slug: WjC9zKhsjS03DrZn8JzUJt
  elements:
  - title: Lockdown
    name: Lockdown
    model: vectra_rux_dashboard
    explore: events
    type: looker_grid
    fields: [events.event_time_time, events.target_entity_name_standardized, events.is_locked,
      events.principal__user__user_display_name, events.metadata__product_event_type,
      events.formatted_unlock_timestamp]
    filters: {}
    sorts: [events.event_time_time desc]
    limit: 100
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
    column_order: ["$$$_row_numbers_$$$", events.target_entity_name_standardized,
      events.event_time_time, events.principal__user__user_display_name, events.formatted_unlock_timestamp,
      events.is_locked, events.metadata__product_event_type]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.target_entity_name_standardized: Entity name
      events.lockout_time_time: Locked Date
      events.is_locked: Entity Locked
      events.principal__user__user_display_name: Locker By
      events__security_result__detection_fields__unlock_event_timestamp.unlock_event_timestamp: Unlock
        Date
      events.formatted_unlock_timestamp: Unlock Date
      events.metadata__product_event_type: Entity Type
      events.event_time_time: Locked Date
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
    listen:
      Log Type: events.log_type
      Entity Type: events.metadata__product_event_type
      Is Locked: events.is_locked
      Timerange: events.event_time_time
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Lockdown
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Lockdown
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: []
    field: events.log_type
  - name: Timerange
    title: Timerange
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: []
    field: events.event_time_time
  - name: Entity Type
    title: Entity Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: [Timerange, Log Type]
    field: events.metadata__product_event_type
  - name: Is Locked
    title: Is Locked
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: [Timerange, Log Type]
    field: events.is_locked
