- name: add_a_unique_name_1673982667
  title: Untitled Visualization
  model: gcp_billing_block
  explore: gcp_billing_export
  type: looker_column
  fields: [sum_of_usage_amount_in_pricing_units, gcp_billing_export.total_net_cost,
    gcp_billing_export.usage_start_month]
  fill_fields: [gcp_billing_export.usage_start_month]
  filters:
    gcp_billing_export.service__description: Compute Engine
    gcp_billing_export.machine_type: C2
    gcp_billing_export.usage_start_date: 6 months ago for 6 months
    pricing.pricing_type: "-RAM On-demand"
  sorts: [gcp_billing_export.usage_start_month desc]
  limit: 500
  column_limit: 50
  total: true
  dynamic_fields:
  - category: measure
    expression: ''
    label: Sum of Usage Amount In Pricing Units
    value_format:
    value_format_name: decimal_0
    based_on: gcp_billing_export.usage__amount_in_pricing_units
    _kind_hint: measure
    measure: sum_of_usage_amount_in_pricing_units
    type: sum
    _type_hint: number
  - category: table_calculation
    expression: "${gcp_billing_export.total_net_cost}/${sum_of_usage_amount_in_pricing_units}"
    label: Average Cost per Core
    value_format:
    value_format_name: usd
    _kind_hint: measure
    table_calculation: average_cost_per_core
    _type_hint: number
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
  show_null_points: true
  interpolation: linear
  custom_color_enabled: true
  show_single_value_title: true
  show_comparison: false
  comparison_type: value
  comparison_reverse_colors: false
  show_comparison_label: true
  enable_conditional_formatting: false
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  defaults_version: 1
  hidden_fields: [sum_of_usage_amount_in_pricing_units, gcp_billing_export.total_net_cost]
  y_axes: []
  series_types: {}
  hidden_pivots: {}