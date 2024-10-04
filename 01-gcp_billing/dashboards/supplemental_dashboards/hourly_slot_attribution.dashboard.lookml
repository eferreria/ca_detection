- name: add_a_unique_name_1673982873
  title: Untitled Visualization
  model: gcp_billing_block
  explore: gcp_billing_export
  type: looker_column
  fields: [gcp_billing_export.project__name, gcp_billing_export.usage_start_hour,
    gcp_billing_export.total_usage_amount]
  pivots: [gcp_billing_export.project__name]
  fill_fields: [gcp_billing_export.usage_start_hour]
  filters:
    gcp_billing_export.sku__description: Analysis Slots Attribution
    gcp_billing_export.usage_start_date: 2022/12/07
  sorts: [gcp_billing_export.project__name, gcp_billing_export.usage_start_hour desc]
  limit: 10
  total: true
  dynamic_fields:
  - category: table_calculation
    expression: " ${gcp_billing_export.total_usage_amount}*1"
    label: Total Usage Amount
    value_format:
    value_format_name: decimal_0
    _kind_hint: measure
    table_calculation: total_usage_amount
    _type_hint: number
    is_disabled: false
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
  ordering: none
  show_null_labels: false
  show_totals_labels: false
  show_silhouette: false
  totals_color: "#808080"
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
  hidden_fields: [gcp_billing_export.total_usage_amount]
  y_axes: []
  hidden_pivots: {}
  series_types: {}
  show_null_points: true
  interpolation: linear