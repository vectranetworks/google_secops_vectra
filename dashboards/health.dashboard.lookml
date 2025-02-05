---
- dashboard: health
  title: Health
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 1Wcnfdo7sM76ToJDO86SG3
  elements:
  - title: Health Dashboards
    name: Health Dashboards
    model: vectra_detect_dashboards
    explore: events
    type: table
    fields: [events.metadata__description, events__security_result.action_details,
      events.event_time_time]
    filters:
      events.metadata__description: "-NULL"
    sorts: [events.event_time_time desc]
    limit: 100
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      events.metadata__description: Activity
      events__security_result.action_details: Result
      events.event_time_time: Time
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: []
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Timerange: events.event_time_time
      Log Type: events.log_type
      Result: events__security_result.action_details
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Log Type
    title: Log Type
    type: field_filter
    default_value: Health
    allow_multiple_values: true
    required: true
    ui_config:
      type: dropdown_menu
      display: inline
      options:
      - Health
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
    listens_to_filters: [Log Type]
    field: events__security_result.action_details
