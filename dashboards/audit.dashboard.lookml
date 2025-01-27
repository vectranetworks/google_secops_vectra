---
- dashboard: audit
  title: Audit
  layout: newspaper
  description: ''
  preferred_slug: mSgrFG6ytUjY62L2xami3N
  elements:
  - title: Audit Table
    name: Audit Table
    model: vectra_rux_dashboard
    explore: events
    type: looker_grid
    fields: [events.metadata__product_log_id, events.last_event_time, events.last_audit_username_standardized,
      events.last_audit_roles_name, events.last_status, events.last_security_result_description]
    filters:
      events.log_type: Audit
      events.last_audit_username_standardized: "-NULL"
    sorts: [events.last_event_time desc]
    limit: 100
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: list
      based_on: events.metadata__product_log_id
      expression: ''
      label: List of Metadata Product Log ID
      measure: list_of_metadata_product_log_id
      type: list
    - category: dimension
      expression: |+
        case(when( ${events__security_result.action_details} = "", "-"),  ${events__security_result.action_details})


      label: Status
      value_format:
      value_format_name:
      dimension: status
      _kind_hint: dimension
      _type_hint: string
    - _kind_hint: measure
      _type_hint: list
      based_on: events.metadata__product_log_id
      expression: ''
      label: List of Metadata Product Log ID
      measure: list_of_metadata_product_log_id_2
      type: list
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
      events.principal_username_standardized: Username
      events__security_result.description: Message
      events__principal__user__attribute__roles.name: Role
      events.last_event_time: Event Timestamp
      events.last_principal_username_standardized: Username
      events.last_principal_user_attribute_roles_name: Role
      events.last_status: Status
      events.last_security_result_description: Message
      events.last_audit_username_standardized: Username
      events.last_audit_roles_name: Role
    series_cell_visualizations: {}
    hidden_fields: [events.metadata__product_log_id]
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Status: events__security_result.action_details
      Timerange: events.event_time_time
      Username: events.audit_username_standardized
    row: 0
    col: 0
    width: 24
    height: 7
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Audit
    allow_multiple_values: false
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Audit
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
  - name: Username
    title: Username
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
    field: events.audit_username_standardized
  - name: Status
    title: Status
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
    field: events__security_result.action_details
