---
- dashboard: lockdown
  title: Lockdown
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: mOqL6MN6g3XcKNiIL83XBi
  elements:
  - title: Hosts currently locked (30 days history)
    name: Hosts currently locked (30 days history)
    model: vectra_detect_dashboards
    explore: events
    type: looker_grid
    fields: [events.last_event_time, events.last_success, events.last_observer_display_name,
      events.target__hostname, events.last_action_details, events.entities_pivot_url]
    filters:
      events.event_time_date: 30 days
      events.last_target__hostname: "-NULL"
    sorts: [events.last_event_time desc 0]
    limit: 100
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: '${events.last_action_details} = "lock" '
      label: state_filter
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: state_filter
      _type_hint: yesno
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
    column_order: ["$$$_row_numbers_$$$", events.target__hostname, events.last_event_time,
      events.last_action_details, events.last_success, events.last_observer_display_name,
      events.last_security_result_url_back_to_product]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events.last_target__hostname: Hostname
      events__security_result.action_details: State
      events.observer__user__user_display_name: Performed by
      events.event_time_time: Time
      events__security_result.url_back_to_product: Host Details
      events.last_event_time: Time
      events.target__hostname: Hostname
      events.last_success: Success
      events.last_security_result_url_back_to_product: Host Details
      events.last_observer_display_name: Performed by
      events.last_action_details: State
      events.entities_pivot_url: Host Details
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [state_filter]
    hidden_points_if_no: [state_filter]
    listen:
      Log Type: events.log_type
    row: 0
    col: 0
    width: 24
    height: 4
  - title: History of Hosts locked during the selected time range
    name: History of Hosts locked during the selected time range
    model: vectra_detect_dashboards
    explore: events
    type: looker_grid
    fields: [events.last_event_time, events.last_action_details, events.last_observer_display_name,
      events.last_success, events.target__hostname, events.entities_pivot_url]
    filters:
      events.last_target__hostname: "-NULL"
    sorts: [events.last_event_time desc]
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
    column_order: ["$$$_row_numbers_$$$", events.target__hostname, events.last_event_time,
      events.last_action_details, events.last_success, events.last_observer_display_name,
      events.last_security_result_url_back_to_product]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result.action_details: State
      events.event_time_time: Time
      events.observer__user__user_display_name: Performed by
      events__security_result.url_back_to_product: Host Details
      events.last_target__hostname: Hostname
      events.last_event_time: Time
      events.target__hostname: Hostname
      events.last_action_details: State
      events.last_observer_display_name: Performed by
      events.last_security_result_url_back_to_product: Host Details
      events.last_success: Success
      events.entities_pivot_url: Host Details
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
    row: 4
    col: 0
    width: 24
    height: 4
  - title: Accounts currently locked (30 days history)
    name: Accounts currently locked (30 days history)
    model: vectra_detect_dashboards
    explore: events
    type: looker_grid
    fields: [events.last_event_time, events.last_action_details, events.last_observer_display_name,
      events.last_success, events__target__user__email_addresses.events__target__user__email_addresses,
      events.entities_pivot_url]
    filters:
      events.event_time_date: 30 days
      events.last_account_uid: "-NULL"
    sorts: [events.last_event_time desc 0]
    limit: 100
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: ${events.last_action_details}="lock"
      label: state_filter
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: state_filter
      _type_hint: yesno
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
    column_order: ["$$$_row_numbers_$$$", events__target__user__email_addresses.events__target__user__email_addresses,
      events.last_event_time, events.last_action_details, events.last_success, events.last_observer_display_name,
      events.last_security_result_url_back_to_product]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result.action_details: State
      events.event_time_time: Time
      events.observer__user__user_display_name: Performed by
      events__security_result.url_back_to_product: Account Details
      events.last_target__hostname: Hostname
      events.last_event_time: Time
      events.last_account_uid: Account Name
      events.last_action_details: State
      events__target__user__email_addresses.events__target__user__email_addresses: Account
        Name
      events.last_observer_display_name: Performed by
      events.last_security_result_url_back_to_product: Account Details
      events.last_success: Success
      events.entities_pivot_url: Account Details
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [state_filter]
    hidden_points_if_no: [state_filter]
    listen:
      Log Type: events.log_type
    row: 8
    col: 0
    width: 24
    height: 4
  - title: History of Accounts locked during the selected time range
    name: History of Accounts locked during the selected time range
    model: vectra_detect_dashboards
    explore: events
    type: looker_grid
    fields: [events.last_event_time, events.last_action_details, events.last_observer_display_name,
      events.last_success, events__target__user__email_addresses.events__target__user__email_addresses,
      events.entities_pivot_url]
    filters:
      events.last_account_uid: "-NULL"
    sorts: [events.last_event_time desc]
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
    column_order: ["$$$_row_numbers_$$$", events__target__user__email_addresses.events__target__user__email_addresses,
      events.last_event_time, events.last_action_details, events.last_success, events.last_observer_display_name,
      events.last_security_result_url_back_to_product]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      events__security_result.action_details: State
      events.event_time_time: Time
      events.observer__user__user_display_name: Performed by
      events__security_result.url_back_to_product: Account Details
      events.last_target__hostname: Account Name
      events.last_account_uid: Account Name
      events.last_event_time: Time
      events.last_success: Success
      events__target__user__email_addresses.events__target__user__email_addresses: Account
        Name
      events.last_action_details: State
      events.last_observer_display_name: Performed by
      events.last_security_result_url_back_to_product: Account Details
      events.entities_pivot_url: Account Details
    series_cell_visualizations: {}
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Log Type: events.log_type
      Timerange: events.event_time_time
    row: 12
    col: 0
    width: 24
    height: 4
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
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: []
    field: events.log_type
  - name: Timerange
    title: Timerange
    type: field_filter
    default_value: 7 day
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: vectra_detect_dashboards
    explore: events
    listens_to_filters: []
    field: events.event_time_time
