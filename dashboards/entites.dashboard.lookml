---
- dashboard: entities
  title: Entities
  layout: newspaper
  description: ''
  preferred_slug: Ux4vJDXbDzuJ0QbKKVOgCK
  elements:
  - title: Entities List
    name: Entities List
    model: vectra_rux_dashboard
    explore: events
    type: looker_grid
    fields: [events.target_entity_id, events.last_urgency_score, events.last_target_entity_uid_standardized,
      events.last_priority_details, events.last_target_data_source, events.last_importance,
      events.last_velocity, events.last_event_time, events.last_attack_rating, events.entities_pivot_url]
    filters:
      events.target_entity_id: "-NULL"
      events__security_result.priority_details: false,true
    sorts: [events.last_urgency_score desc]
    limit: 100
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: substring(${events.last_target_entity_uid_standardized}, position(${events.last_target_entity_uid_standardized},":")+1,
        length(${events.last_target_entity_uid_standardized}))
      label: Entity name
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: entity_name_1
      _type_hint: string
    - category: dimension
      expression: case(when(substring(${events__target__user__email_addresses.events__target__user__email_addresses},
        1, position(${events__target__user__email_addresses.events__target__user__email_addresses},
        ":")) = "O365:", "O365"),when(substring(${events__target__user__email_addresses.events__target__user__email_addresses},
        1, position(${events__target__user__email_addresses.events__target__user__email_addresses},
        ":")) = "AWS:", "AWS"),when(substring(${events__target__user__email_addresses.events__target__user__email_addresses},
        1, position(${events__target__user__email_addresses.events__target__user__email_addresses},
        ":")) = "M365:", "M365"),when(substring(${events__target__user__email_addresses.events__target__user__email_addresses},
        1, position(${events__target__user__email_addresses.events__target__user__email_addresses},
        ":")) = "SAML:", "SAML"),"Network")
      label: data_source
      value_format:
      value_format_name:
      dimension: data_source_1
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: coalesce(${events__target__user__email_addresses.events__target__user__email_addresses},
        "-")
      label: Source_Entity
      value_format:
      value_format_name:
      dimension: source_entity
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
      expression: |-
        substring(${events.target_entity_uid_standardized}, position(${events.target_entity_uid_standardized},":")+1, length(${events.target_entity_uid_standardized}))

        # substring(${events__target__user__email_addresses.events__target__user__email_addresses}, position(${events__target__user__email_addresses.events__target__user__email_addresses},":")+1, length(${events__target__user__email_addresses.events__target__user__email_addresses}))
      label: Entity name
      value_format:
      value_format_name:
      dimension: entity_name
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: 'case(when(${events__security_result__detection_fields__importance.importance}
        = "0", "Low"),when(${events__security_result__detection_fields__importance.importance}
        = "1", "Medium"),when(${events__security_result__detection_fields__importance.importance}
        = "2", "High"),"Unknown")

        '
      label: Importance
      value_format:
      value_format_name:
      dimension: importance
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: "case(when(${events__security_result__detection_fields__velocity.velocity}\
        \ = \"0\", \"Low\"),when(${events__security_result__detection_fields__velocity.velocity}\
        \ = \"1\", \"Medium\"),when(${events__security_result__detection_fields__velocity.velocity}\
        \ = \"2\", \"High\"),\"Unknown\")\n\n"
      label: Velocity
      value_format:
      value_format_name:
      dimension: velocity
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: substring(${events.principal_entity_uid_standardized}, position(${events.principal_entity_uid_standardized},":")+1,
        length(${events.principal_entity_uid_standardized}))
      label: New Entity Name
      value_format:
      value_format_name:
      dimension: new_entity_name
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: '"Field Not Found"'
      label: Attack Rating
      value_format:
      value_format_name:
      dimension: attack_rating
      _kind_hint: dimension
      _type_hint: string
    - category: table_calculation
      expression: 'case(when(${events.last_importance} = "0", "Low"),when(${events.last_importance}
        = "1", "Medium"),when(${events.last_importance} = "2", "High"),"Unknown")

        '
      label: Importance Cal
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: importance_cal
      _type_hint: string
    - category: table_calculation
      expression: "case(when(${events.last_velocity} = \"0\", \"Low\"),when(${events.last_velocity}\
        \ = \"1\", \"Medium\"),when(${events.last_velocity} = \"2\", \"High\"),\"\
        Unknown\")\n\n"
      label: Velocity Cal
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: velocity_cal
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
    column_order: ["$$$_row_numbers_$$$", events.last_urgency_score, events.last_attack_rating,
      entity_name_1, events.entities_pivot_url, events.last_priority_details, events.last_target_data_source,
      importance_cal, velocity_cal, events.last_event_time]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.event_time_time: Last Updated
      events.last_urgency_score: Urgency Score
      events.last_category: Category
      events.last_priority_details: Prioritized
      events.last_target_data_source: Data Source Type
      events.last_importance: Importance
      events.last_velocity: Velocity
      events.entities_pivot_url: Vectra Pivot
      importance_cal: Importance
      velocity_cal: Velocity
      events.last_event_time: Last Updated
      events.last_attack_rating: Attack Rating
      entity_name_1: Entity Name
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
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [events.last_target_entity_uid_standardized, events.last_importance,
      events.last_velocity, events.target_entity_id]
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
      Data Source Type: events.target_data_source
      Prioritized: prioritized_not_prioritized.last_priority_details
      Entity Type: events__security_result__detection_fields__type.type
    row: 6
    col: 0
    width: 24
    height: 6
  - title: Not Prioritized
    name: Not Prioritized
    model: vectra_rux_dashboard
    explore: events
    type: single_value
    fields: [count_of_target_entity_id]
    filters:
      prioritized_not_prioritized.last_priority_details: 'false'
      events.target_entity_id: "-NULL"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: prioritized_not_prioritized.target_entity_id
      expression: ''
      label: Count of Target Entity ID
      measure: count_of_target_entity_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    listen:
      Timerange: events.event_time_time
      Data Source Type: events.target_data_source
      Log Type: events.log_type
      Entity Type: events__security_result__detection_fields__type.type
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Prioritized
    name: Prioritized
    model: vectra_rux_dashboard
    explore: events
    type: single_value
    fields: [count_of_target_entity_id]
    filters:
      prioritized_not_prioritized.last_priority_details: 'true'
      events.target_entity_id: "-NULL"
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: prioritized_not_prioritized.target_entity_id
      expression: ''
      label: Count of Target Entity ID
      measure: count_of_target_entity_id
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    listen:
      Timerange: events.event_time_time
      Data Source Type: events.target_data_source
      Log Type: events.log_type
      Entity Type: events__security_result__detection_fields__type.type
    row: 0
    col: 0
    width: 12
    height: 6
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
    listens_to_filters: [Log Type]
    field: events__security_result__detection_fields__type.type
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
    listens_to_filters: [Log Type]
    field: events.target_data_source
  - name: Prioritized
    title: Prioritized
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
    field: prioritized_not_prioritized.last_priority_details
