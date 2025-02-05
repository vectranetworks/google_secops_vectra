---
- dashboard: detection
  title: Detection
  layout: newspaper
  description: ''
  preferred_slug: BKNZXSFJkR6kcaWydqxJTg
  elements:
  - title: Detection Categories over Time
    name: Detection Categories over Time
    model: vectra_detect_dashboards
    explore: events
    type: looker_area
    fields: [events.category, events.event_time_date, count_of_metadata_product_log_id]
    pivots: [events.category]
    filters:
      events.last_category: "-NULL"
      events.last_product_event_type: "-NULL"
    sorts: [events.category, events.event_time_date desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: events.category
      expression: ''
      label: Count of Category
      measure: count_of_category
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: events.category
      expression: ''
      label: Count of Category
      measure: count_of_category_2
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__id
      expression: ''
      label: Count of Metadata ID
      measure: count_of_metadata_id
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: events.metadata__product_log_id
      expression: ''
      label: Count of Metadata Product Log ID
      measure: count_of_metadata_product_log_id
      type: count_distinct
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    y_axes: [{label: Category count over Time, orientation: left, series: [{axisId: count_of_metadata_id,
            id: Botnet Activity - count_of_metadata_id, name: Botnet Activity}, {
            axisId: count_of_metadata_id, id: Command & Control - count_of_metadata_id,
            name: Command & Control}, {axisId: count_of_metadata_id, id: Info - count_of_metadata_id,
            name: Info}, {axisId: count_of_metadata_id, id: Lateral Movement - count_of_metadata_id,
            name: Lateral Movement}, {axisId: count_of_metadata_id, id: Unknown -
              count_of_metadata_id, name: Unknown}], showLabels: true, showValues: true,
        maxValue: !!null '', unpinAxis: false, tickDensity: default, tickDensityCustom: 9,
        type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: []
    series_colors: {}
    trend_lines: []
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    listen:
      Timerange: events.event_time_time
      Detection Categories: events.category
      Type: events.type
      Behavior: events.metadata__product_event_type
      Log Type: events.log_type
      Source: events.data_source
    row: 0
    col: 0
    width: 24
    height: 11
  - title: Detection Table
    name: Detection Table
    model: vectra_detect_dashboards
    explore: events
    type: looker_grid
    fields: [events.last_category, events.last_source_entity, events.last_risk_score,
      events.last_confidence_score, events.last_triaged, events.last_product_event_type,
      events.metadata__product_log_id, events.last_detection_url, events.last_formatted_datetime2,
      events.last_source_ip_field, events.last_destination_ip_field, events.last_destination_field]
    filters:
      events.metadata__product_log_id: "-NULL"
    sorts: [events.last_formatted_datetime2 desc]
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
    column_order: ["$$$_row_numbers_$$$", events.last_triaged, events.last_category,
      events.last_product_event_type, events.last_source_entity, events.last_source_ip_field,
      events.last_destination_field, events.last_destination_ip_field, events.last_risk_score,
      events.last_confidence_score, events.last_detection_url, events.last_formatted_datetime2]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.event_time_date: Latest Detection
      events__security_result.url_back_to_product: Detection Details
      events__security_result.confidence_score: Certainty
      events__security_result.risk_score: Threat
      events.target__hostname: Destination
      events__security_result.threat_name: Behavior
      events__target__ip.events__target__ip: Destination IP
      events__principal__ip.events__principal__ip: Source IP
      events.last_triaged: Triaged
      events.last_product_event_type: Behavior
      events.last_url_back_to_product: Detection Details
      events.last_confidence_score: Certainity
      events.last_risk_score: Threat
      events.last_target__hostname: Destination
      events.last_target__ip: Destination IP
      events.last_principal__ip: Source IP
      events.last_source_entity: Source Entity
      events.last_category: Category
      events.event_time_time: Latest Detection
      events.last_detection_url: Detection Details
      events.last_event_time: Latest Detection
      events.last_formatted_datetime2: Latest Detection
      events.last_destination_field: Destination
      events.last_destination_ip_field: Destination IP
      events.last_source_ip_field: Source IP
    series_column_widths:
      events.last_product_event_type: 250
    series_cell_visualizations: {}
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
    hidden_fields: [events.metadata__product_log_id]
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Detection Categories: events.category
      Behavior: events.metadata__product_event_type
      Source: events.data_source
      Type: events.type
    row: 11
    col: 0
    width: 24
    height: 5
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Detection
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Detection
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
  - name: Detection Categories
    title: Detection Categories
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
    field: events.category
  - name: Behavior
    title: Behavior
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
    field: events.metadata__product_event_type
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
    listens_to_filters: [Log Type, Timerange]
    field: events.data_source
  - name: Type
    title: Type
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
    field: events.type
