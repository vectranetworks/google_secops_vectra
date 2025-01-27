---
- dashboard: detection
  title: Detection
  layout: newspaper
  description: ''
  preferred_slug: MD4y6ECb2vxk0cCwvFCpw8
  elements:
  - title: Detection List
    name: Detection List
    model: vectra_rux_dashboard
    explore: events
    type: looker_grid
    fields: [events.metadata__product_log_id, events.last_principal_entity_uid_standardized,
      events.last_behaviour, events.last_category, events.last_principal_data_source,
      events.last_event_time, events.last_source_ip, events.entities_pivot_url]
    filters: {}
    sorts: [events.last_event_time desc]
    limit: 100
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: substring(${events.last_principal_entity_uid_standardized}, position(${events.last_principal_entity_uid_standardized},":")+1,
        length(${events.last_principal_entity_uid_standardized}))
      label: Entity Name
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: entity_name
      _type_hint: string
    - category: dimension
      expression: coalesce(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        "-")
      label: Source_Entity
      value_format:
      value_format_name:
      dimension: source_entity
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: list
      based_on: events.metadata__product_log_id
      expression: ''
      label: List of Metadata Product Log ID
      measure: list_of_metadata_product_log_id
      type: list
    - category: dimension
      expression: case(when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "O365:", "O365"),when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "AWS:", "AWS"),when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "M365:", "M365"),when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "SAML:", "SAML"),"Network")
      label: data_source
      value_format:
      value_format_name:
      dimension: data_source
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: '"Pivot to Vectra"'
      label: Vectra Pivot
      value_format:
      value_format_name:
      dimension: vectra_pivot
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: |2-


        case(when(${events__security_result__category_details.events__security_result__category_details} = "Command & Control", "Command & Control"),when(${events__security_result__category_details.events__security_result__category_details} = "COMMAND & CONTROL", "Command & Control"),when(${events__security_result__category_details.events__security_result__category_details} = "command_and_control", "Command & Control"),when(${events__security_result__category_details.events__security_result__category_details} = "Botnet Activity", "Botnet Activity"),when(${events__security_result__category_details.events__security_result__category_details} = "BOTNET ACTIVITY", "Botnet Activity"),when(${events__security_result__category_details.events__security_result__category_details} = "botnet_activity", "Botnet Activity"),when(${events__security_result__category_details.events__security_result__category_details} = "Reconnaissance", "Reconnaissance"),when(${events__security_result__category_details.events__security_result__category_details} = "reconnaissance", "Reconnaissance"),when(${events__security_result__category_details.events__security_result__category_details} = "LATERAL MOVEMENT", "Lateral Movement"),when(${events__security_result__category_details.events__security_result__category_details} = "Lateral Movement", "Lateral Movement"),when(${events__security_result__category_details.events__security_result__category_details} = "lateral_movement", "Lateral Movement"),when(${events__security_result__category_details.events__security_result__category_details} = "Exfiltration", "Exfiltration"),when(${events__security_result__category_details.events__security_result__category_details} = "exfiltration", "Exfiltration"),when(${events__security_result__category_details.events__security_result__category_details} = "INFO", "Info"),when(${events__security_result__category_details.events__security_result__category_details} = "info", "info"), "Unknown")
      label: Category
      value_format:
      value_format_name:
      dimension: category
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: coalesce(${events__principal__ip.events__principal__ip}, "Not Available")
      label: Source IP
      value_format:
      value_format_name:
      dimension: source_ip
      _kind_hint: dimension
      _type_hint: string
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
    column_order: ["$$$_row_numbers_$$$", events.metadata__product_log_id, entity_name,
      events.last_category, events.last_behaviour, events.entities_pivot_url, events.last_principal_data_source,
      events.last_source_ip, events.last_event_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.metadata__product_event_type: Behaviour
      events.event_time_time: Last updated
      events__additional__fields.value__string_value: Detection Fields
      events.last_behaviour: Behaviour
      events.last_principal_data_source: Data Source Type
      events.entities_pivot_url: Vectra Pivot
      list_of_metadata_product_log_id: Product ID
      events.last_event_time: Last Updated
      events.last_source_ip: Source IP
      events.last_category: Detection Category
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [events.last_principal_entity_uid_standardized, events.metadata__product_log_id]
    listen:
      Behavior: events.metadata__product_event_type
      Log Type: events.log_type
      Category: events.category
      Data Source Type: events.principal_data_source
      Timerange: events.event_time_time
    row: 7
    col: 0
    width: 24
    height: 7
  - title: Detection Categories over Time
    name: Detection Categories over Time
    model: vectra_rux_dashboard
    explore: events
    type: looker_area
    fields: [events.category, count_of_metadata_product_log_id, events.event_time_date]
    pivots: [events.category]
    fill_fields: [events.event_time_date]
    filters: {}
    sorts: [events.category]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: case(when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "O365:", "O365"),when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "AWS:", "AWS"),when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "M365:", "M365"),when(substring(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        1, position(${events__principal__user__email_addresses.events__principal__user__email_addresses},
        ":")) = "SAML:", "SAML"),"Network")
      label: data_source
      value_format:
      value_format_name:
      dimension: data_source
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: count_distinct(${data_source})
      label: Count of data source
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: count_of_data_source
      _type_hint: number
      is_disabled: true
    - _kind_hint: measure
      _type_hint: number
      based_on: events.category
      expression: ''
      label: Count of Category
      measure: count_of_category
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
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Count of Category, orientation: left, series: [{axisId: count_of_metadata_id,
            id: Botnet Activity - count_of_metadata_id, name: Botnet Activity}, {
            axisId: count_of_metadata_id, id: Command & Control - count_of_metadata_id,
            name: Command & Control}, {axisId: count_of_metadata_id, id: Exfiltration
              - count_of_metadata_id, name: Exfiltration}, {axisId: count_of_metadata_id,
            id: Info - count_of_metadata_id, name: Info}, {axisId: count_of_metadata_id,
            id: Lateral Movement - count_of_metadata_id, name: Lateral Movement},
          {axisId: count_of_metadata_id, id: Reconnaissance - count_of_metadata_id,
            name: Reconnaissance}, {axisId: count_of_metadata_id, id: Unknown - count_of_metadata_id,
            name: Unknown}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Time
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Behavior: events.metadata__product_event_type
      Log Type: events.log_type
      Category: events.category
      Data Source Type: events.principal_data_source
      Timerange: events.event_time_time
    row: 0
    col: 0
    width: 24
    height: 7
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
  - name: Behavior
    title: Behavior
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: [Log Type, Timerange]
    field: events.metadata__product_event_type
  - name: Category
    title: Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: [Log Type, Timerange]
    field: events.category
  - name: Data Source Type
    title: Data Source Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: vectra_rux_dashboard
    explore: events
    listens_to_filters: []
    field: events.principal_data_source
