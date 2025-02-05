---
- dashboard: match
  title: Match
  layout: newspaper
  description: ''
  preferred_slug: xyCqddLcABhF0d0i3ZKrAC
  elements:
  - title: Top signatures
    name: Top signatures
    model: vectra_detect_dashboards
    explore: events
    type: looker_pie
    fields: [events__security_result.threat_name, count]
    filters:
      events__security_result.threat_name: "-NULL"
    sorts: [percent_of_signature desc]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events__security_result.threat_name
      expression: ''
      label: Count of Threat Name
      measure: count_of_threat_name
      type: count_distinct
    - category: table_calculation
      label: Percent of Signature
      value_format:
      value_format_name: percent_2
      calculation_type: percent_of_column_sum
      table_calculation: percent_of_signature
      args:
      - count
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Count
      based_on: events__security_result.threat_id
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    value_labels: labels
    label_type: labVal
    series_labels: {}
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    hidden_pivots: {}
    hidden_fields: [percent_of_signature]
    hidden_points_if_no: []
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Top Protocols: events.application_protocol
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Direction: events.direction
    row: 0
    col: 0
    width: 12
    height: 10
  - title: Top Sources
    name: Top Sources
    model: vectra_detect_dashboards
    explore: events
    type: looker_pie
    fields: [events__principal__ip.events__principal__ip, count_2]
    filters: {}
    sorts: [count_2 desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count
      based_on: events__principal__ip.events__principal__ip
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      label: Count%
      value_format:
      value_format_name: percent_2
      calculation_type: percent_of_column_sum
      table_calculation: count_1
      args:
      - count_2
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count_2
      type: count_distinct
      _type_hint: number
    value_labels: labels
    label_type: labVal
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [count_1]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Top Protocols: events.application_protocol
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Direction: events.direction
    row: 0
    col: 12
    width: 12
    height: 10
  - title: Top Destinations
    name: Top Destinations
    model: vectra_detect_dashboards
    explore: events
    type: looker_pie
    fields: [events__target__ip.events__target__ip, count_2]
    filters: {}
    sorts: [count_2 desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression: ''
      label: Count
      based_on: events__target__ip.events__target__ip
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    - category: table_calculation
      label: Count%
      value_format:
      value_format_name: percent_2
      calculation_type: percent_of_column_sum
      table_calculation: count_1
      args:
      - count_2
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count_2
      type: count_distinct
      _type_hint: number
    value_labels: labels
    label_type: labVal
    start_angle: 0
    end_angle: 0
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [count_1]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Top Protocols: events.application_protocol
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Direction: events.direction
    row: 10
    col: 12
    width: 12
    height: 10
  - title: Top Protocols
    name: Top Protocols
    model: vectra_detect_dashboards
    explore: events
    type: looker_pie
    fields: [events.application_protocol, count_1]
    filters:
      events.network__application_protocol: NOT NULL
    sorts: [count_1 desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Percent of Application Protocal
      value_format:
      value_format_name: percent_2
      calculation_type: percent_of_column_sum
      table_calculation: percent_of_application_protocal
      args:
      - count_1
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Count
      based_on: events.network__application_protocol
      _kind_hint: measure
      measure: count
      type: count_distinct
      _type_hint: number
    - category: measure
      expression: ''
      label: Count
      based_on: events.metadata__id
      _kind_hint: measure
      measure: count_1
      type: count_distinct
      _type_hint: number
    value_labels: labels
    label_type: labVal
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    show_null_points: true
    defaults_version: 1
    hidden_fields: [percent_of_application_protocal]
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Top Protocols: events.application_protocol
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Direction: events.direction
    row: 10
    col: 0
    width: 12
    height: 10
  - title: Match's Alerts
    name: Match's Alerts
    model: vectra_detect_dashboards
    explore: events
    type: table
    fields: [events__principal__ip.events__principal__ip, events__target__ip.events__target__ip,
      events__security_result.threat_name, events.last_formatted_datetime, events.last_threat_id,
      events.last_target_port, events.last_principal_port, events.last_direction]
    filters:
      events.network__direction: NOT NULL
    sorts: [events.last_formatted_datetime desc]
    limit: 100
    column_limit: 50
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
      events.event_time_time: Time
      events.last_direction: Direction
      events__principal__ip.events__principal__ip: Source IP
      events__target__ip.events__target__ip: Destination IP
      events.last_target_port: Destination Port
      events.last_principal_port: Source Port
      events__security_result.threat_name: Signature
      events.last_threat_id: Signature ID
      events.last_formatted_datetime: Time
    hidden_fields: []
    defaults_version: 1
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    minimum_column_width: 75
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", events.event_time_time, events.last_direction,
      events__principal__ip.events__principal__ip, events.last_principal_port, events__target__ip.events__target__ip,
      events.last_target_port, events__security_result.threat_name, events.last_threat_id]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Top Protocols: events.application_protocol
      Source IP: events__principal__ip.events__principal__ip
      Destination IP: events__target__ip.events__target__ip
      Direction: events.direction
    row: 20
    col: 0
    width: 24
    height: 8
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Match
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Match
    model: vectra_detect_dashboards
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
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: []
    field: events.event_time_time
  - name: Direction
    title: Direction
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: []
    field: events.direction
  - name: Top Protocols
    title: Top Protocols
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Log Type, Timerange]
    field: events.application_protocol
  - name: Source IP
    title: Source IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Event Time Time, Log Type, Timerange]
    field: events__principal__ip.events__principal__ip
  - name: Destination IP
    title: Destination IP
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: [Event Time Time, Log Type, Timerange]
    field: events__target__ip.events__target__ip
