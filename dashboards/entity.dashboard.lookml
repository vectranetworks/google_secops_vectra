---
- dashboard: entity
  title: Entity
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ka1mlN7JL1X5XkP8LH7QNS
  elements:
  - title: Entity Table
    name: Entity Table
    model: vectra_detect_dashboards
    explore: events
    type: table
    fields: [events.target_entity_standarized, events.last_target_data_source, events.last_target__ip,
      events.last_risk_score2, events.last_confidence_score2, events.last_assigned_to,
      events.last_formatted_datetime, events.last_severity, events.entities_pivot_url,
      events.last_priority]
    sorts: [events.last_risk_score2 desc]
    limit: 100
    column_limit: 50
    size_to_fit: true
    dynamic_fields:
    - category: dimension
      expression: coalesce(${entity_dashboard_1.user_assigned},${entity_dashboard_2.user_assigned},
        "N/A")
      label: Combined User Assigned
      value_format:
      value_format_name:
      dimension: combined_user_assigned
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      events.target_entity_standarized: Source Entity
      events.last_data_source: Data Source
      events.last_severity: Severity
      events.entities_pivot_url: Entity Details
      events.last_target__ip: Source IP
      events.last_risk_score2: Threat
      events.last_confidence_score2: Certainty
      events.last_formatted_datetime: Latest Update
      events.last_assigned_to: Assignment
      events.last_target_data_source: Data Source
    defaults_version: 1
    hidden_fields: [events.last_priority]
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Severity: events.severity
      Entity Type: events.scoring_type
      Source: events.target_data_source
      Assignment: events.assigned_to2
    row: 9
    col: 0
    width: 24
    height: 4
  - title: Threat Vs Certainty over Time
    name: Threat Vs Certainty over Time
    model: vectra_detect_dashboards
    explore: events
    type: looker_scatter
    fields: [events.target_entity_standarized, events.last_confidence_score, events.last_risk_score,
      events.last_event_time]
    filters:
      events__security_result.risk_score: ">0"
      events__security_result.confidence_score: ">0"
    sorts: [events.target_entity_standarized desc]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: true
    y_axis_gridlines: false
    show_view_names: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: Threat, orientation: left, series: [{axisId: events.last_risk_score,
            id: events.last_risk_score, name: Last Risk Score}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_label: Certainty
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    series_colors:
      events__security_result.confidence_score: "#FF8168"
    series_labels:
      events__security_result.confidence_score: Certainty
      events__security_result.risk_score: Threat
      events.last_risk_score: Threat
    label_color: []
    swap_axes: false
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: events.last_confidence_score
    custom_y_column: events.last_risk_score
    custom_value_label_column: default
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", events__security_result.risk_score, events__security_result.confidence_score]
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    minimum_column_width: 75
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hide_totals: false
    hide_row_totals: false
    hidden_fields: [events.target_entity_standarized, events.last_event_time]
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Severity: events.severity
      Entity Type: events.scoring_type
      Source: events.target_data_source
      Assignment: events.assigned_to2
    row: 0
    col: 0
    width: 24
    height: 9
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Scoring
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Scoring
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: []
    field: events.log_type
  - name: Timerange
    title: Timerange
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: popover
      options: []
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: []
    field: events.event_time_time
  - name: Severity
    title: Severity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Timerange, Log Type]
    field: events.severity
  - name: Source
    title: Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Timerange, Log Type]
    field: events.target_data_source
  - name: Entity Type
    title: Entity Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Timerange, Log Type]
    field: events.scoring_type
  - name: Assignment
    title: Assignment
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Timerange, Log Type]
    field: events.assigned_to2
