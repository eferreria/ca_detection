- name: add_a_unique_name_1673982808
  title: Untitled Visualization
  model: gcp_billing_block
  explore: gcp_billing_export
  type: looker_column
  fields: [gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units,
    gcp_billing_export.total_net_cost]
  fill_fields: [gcp_billing_export.usage_start_month]
  filters:
    gcp_billing_export.service__description: Cloud Storage
    gcp_billing_export.usage_start_month: 3 months ago for 3 months
    gcp_billing_export.usage__calculated_unit: gibibyte month
    gcp_billing_export.sku__description: "%Storage%"
  sorts: [gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units
      desc]
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
  stacking: normal
  limit_displayed_rows: false
  legend_position: center
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
  y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_net_cost,
          id: gcp_billing_export.total_net_cost, name: Total Net Cost}], showLabels: true,
      showValues: true, maxValue: !!null '', unpinAxis: false, tickDensity: default,
      tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
      series: [{axisId: average_monthly_cost_per_terabyte, id: average_monthly_cost_per_terabyte,
          name: Average Monthly Cost per Terabyte}], showLabels: true, showValues: true,
      maxValue: 25, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
      type: linear}]
  x_axis_zoom: true
  y_axis_zoom: true
  hidden_series: []
  series_types:
    average_monthly_cost_per_terabyte: line
  show_sql_query_menu_options: false
  show_totals: true
  show_row_totals: true
  show_row_numbers: true
  transpose: false
  truncate_text: true
  truncate_header: false
  size_to_fit: true
  series_cell_visualizations:
    gcp_billing_export.total_net_cost:
      is_active: true
  table_theme: white
  enable_conditional_formatting: false
  header_text_alignment: left
  header_font_size: '12'
  rows_font_size: '12'
  conditional_formatting_include_totals: false
  conditional_formatting_include_nulls: false
  hidden_pivots: {}
  defaults_version: 1
  hidden_fields: [gcp_billing_export.usage__amount_in_calculated_units]
  hide_totals: false
  hide_row_totals: false