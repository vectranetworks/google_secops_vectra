---
- dashboard: audit
  title: Audit
  layout: newspaper
  description: ''
  preferred_slug: 2KiVt1AQXdUyElq504gmP7
  elements:
  - title: Audit
    name: Audit
    model: vectra_detect_dashboards
    explore: events
    size_to_fit: true
    type: table
    fields: [events.metadata__description, events.combined_name, events.combined_role,
      events__security_result__detection_fields.result, events.event_time_time]
    filters:
      events__security_result__detection_fields.result: "-NULL"
    sorts: [events.event_time_time desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: high-contrast
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      events__security_result__detection_fields.value: Result
      events.metadata__description: Activity
      events.metadata__event_timestamp__seconds: Time
      events.combined_name: User
      events.combined_role: Role
      events.event_time_time: Time
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Result: events__security_result__detection_fields__result.result
      User: events.combined_name
      Timerange: events.event_time_time
      Log Type: events.log_type
    row: 0
    col: 0
    width: 24
    height: 4
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Audit
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Audit
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
  - name: User
    title: User
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
    field: events.combined_name
  - name: Result
    title: Result
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
    field: events__security_result__detection_fields__result.result
