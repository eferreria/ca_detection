- name: add_a_unique_name_1673982777
  title: Untitled Visualization
  model: gcp_billing_block
  explore: gcp_billing_export
  type: looker_grid
  fields: [gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units,
    gcp_billing_export.total_net_cost, pricing.pricing_type]
  pivots: [pricing.pricing_type]
  fill_fields: [gcp_billing_export.usage_start_month]
  filters:
    gcp_billing_export.service__description: Cloud Storage
    gcp_billing_export.usage_start_month: 3 months ago for 3 months
    gcp_billing_export.usage__calculated_unit: gibibyte month
    gcp_billing_export.sku__description: "%Storage%"
  sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units
      desc 0]
  limit: 500
  total: true
  dynamic_fields:
  - category: table_calculation
    expression: "(${gcp_billing_export.total_net_cost}*1000)/(${gcp_billing_export.usage__amount_in_calculated_units}*1.07374)"
    label: Average Monthly Cost per Terabyte
    value_format:
    value_format_name: usd
    _kind_hint: measure
    table_calculation: average_monthly_cost_per_terabyte
    _type_hint: number
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
  series_cell_visualizations:
    gcp_billing_export.total_net_cost:
      is_active: true
  x_axis_gridlines: false
  y_axis_gridlines: true
  y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_net_cost,
          id: gcp_billing_export.total_net_cost, name: Total Net Cost}], showLabels: true,
      showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: default,
      tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
      series: [{axisId: average_monthly_cost_per_terabyte, id: average_monthly_cost_per_terabyte,
          name: Average Monthly Cost per Terabyte}], showLabels: true, showValues: true,
      maxValue: 25, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
      type: linear}]
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
  x_axis_zoom: true
  y_axis_zoom: true
  trellis: ''
  stacking: normal
  hidden_series: []
  legend_position: center
  series_types: {}
  point_style: circle_outline
  show_value_labels: true
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
  hidden_fields: [gcp_billing_export.usage__amount_in_calculated_units]