- dashboard: bigquery_deep_dive
  title: BigQuery Deep Dive
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: BigQuery by Day
    name: BigQuery by Day
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.service__description, gcp_billing_export.usage_start_date,
      gcp_billing_export.total_net_cost]
    pivots: [gcp_billing_export.service__description]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_date: after 2022/01/01
    sorts: [gcp_billing_export.service__description, gcp_billing_export.usage_start_date
        desc]
    limit: 5000
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
    hidden_series: []
    hide_legend: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 8
    col: 0
    width: 10
    height: 6
  - title: BigQuery Analysis and Slot Cost (no Storage) by Hour (7 days)
    name: BigQuery Analysis and Slot Cost (no Storage) by Hour (7 days)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_time, gcp_billing_export.total_net_cost,
      gcp_billing_export.service__description, gcp_billing_export.sku__description]
    pivots: [gcp_billing_export.service__description, gcp_billing_export.sku__description]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_date: 7 days
      gcp_billing_export.sku__description: "%Analysis%,%Flat Rate%,-%Storage%,-%Attribution%"
    sorts: [gcp_billing_export.service__description, gcp_billing_export.sku__description,
      gcp_billing_export.usage_start_time desc]
    limit: 5000
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    hidden_series: []
    label_value_format: "$#,###"
    series_types: {}
    x_axis_datetime_label: "%I"
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen: {}
    row: 14
    col: 0
    width: 12
    height: 8
  - title: BigQuery by SKU
    name: BigQuery by SKU
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_date, gcp_billing_export.sku__description,
      gcp_billing_export.service__description, gcp_billing_export.project__name, gcp_billing_export.total_net_cost]
    filters:
      gcp_billing_export.usage_start_month: 5 days
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.total_net_cost: ''
      gcp_billing_export.sku__description: "-%Analysis Slots Attribution%,-%Active%,-%Long\
        \ Term%"
    sorts: [gcp_billing_export.usage_start_date desc]
    limit: 5000
    total: true
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
    column_order: ["$$$_row_numbers_$$$", gcp_billing_export.usage_start_date, gcp_billing_export.service__description,
      gcp_billing_export.sku__description, gcp_billing_export.project__name, pricing.pricing_unit_description,
      gcp_billing_export.total_net_cost]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      gcp_billing_export.usage_start_date: 120
      gcp_billing_export.sku__description: 300
      gcp_billing_export.service__description: 180
      gcp_billing_export.project__name: 200
      gcp_billing_export.total_net_cost: 100
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#112B4A",
        font_color: !!null '', color_application: {collection_id: cme-colors, palette_id: cme-colors-diverging-0,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    hidden_series: []
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 10
    width: 14
    height: 14
  - title: BigQuery by Category Resource Group
    name: BigQuery by Category Resource Group
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month,
      gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_month: after 2022/01/01
    sorts: [gcp_billing_export.usage_start_month
        desc]
    limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_series: []
    label_value_format: "$#,###"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 0
    width: 10
    height: 8
  - title: BigQuery Storage by Hour (7 days)
    name: BigQuery Storage by Hour (7 days)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.service__description, gcp_billing_export.usage_start_time,
      gcp_billing_export.total_net_cost]
    pivots: [gcp_billing_export.service__description]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_date: 7 days
      gcp_billing_export.sku__description: "%Storage%"
    sorts: [gcp_billing_export.service__description, gcp_billing_export.usage_start_time
        desc]
    limit: 5000
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
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
    hidden_series: []
    series_types: {}
    x_axis_datetime_label: "%I"
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 22
    col: 0
    width: 24
    height: 7
  - title: BigQuery Storage in PB by Day for 120 days (Uncompressed)
    name: BigQuery Storage in PB by Day for 120 days (Uncompressed)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_date, gcp_billing_export.total_usage_amount]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.sku__description: "%Storage%"
      gcp_billing_export.usage_start_date: 120 days
    sorts: [gcp_billing_export.usage_start_date
        desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0.00"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_usage_amount]
    y_axes: []
    listen: {}
    row: 29
    col: 0
    width: 24
    height: 7
  - title: BigQuery Storage in PB by Project
    name: BigQuery Storage in PB by Project
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage_start_date, gcp_billing_export.total_usage_amount,
      gcp_billing_export.project__name]
    pivots: [gcp_billing_export.project__name]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.sku__description: "%Storage%"
      gcp_billing_export.usage_start_date: 120 days
    sorts: [gcp_billing_export.project__name, gcp_billing_export.usage_start_date
        desc]
    limit: 5000
    column_limit: 5000
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr}]
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
    legend_position: left
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_series: [sbx-latency-test - sbx-latency-test - usage_in_pb, prj-test-pet-0b0a
        - prj-test-pet-0b0a - usage_in_pb, prj-qa-proc-post-trade-2caf - prj-qa-proc-post-trade-2caf
        - usage_in_pb, prj-qa-proc-marketdata-3408 - prj-qa-proc-marketdata-3408 -
        usage_in_pb, prj-test-pet-f8a7 - prj-test-pet-f8a7 - usage_in_pb]
    hide_legend: false
    label_value_format: "#,##0.00"
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_usage_amount]
    y_axes: []
    listen: {}
    row: 43
    col: 0
    width: 24
    height: 13
  - title: BigQuery Storage in PB by Day for 120 days (Compressed)
    name: BigQuery Storage in PB by Day for 120 days (Compressed)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_date, gcp_billing_export.total_usage_amount,
      gcp_billing_export.sku__description]
    pivots: [gcp_billing_export.sku__description]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.sku__description: "%Physical%"
      gcp_billing_export.usage_start_date: 120 days
    sorts: [gcp_billing_export.sku__description, gcp_billing_export.usage_start_date
        desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0.00"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_usage_amount]
    y_axes: []
    row: 36
    col: 0
    width: 24
    height: 7
  - title: BigQuery Analysis by Region for 120 Days
    name: BigQuery Analysis by Region for 120 Days
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_date, gcp_billing_export.location__region]
    pivots: [gcp_billing_export.location__region]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
      gcp_billing_export.sku__description: "-%Storage%,-%Streaming%,-%Engine%,-%Attribution%"
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_date: 120 days
    sorts: [gcp_billing_export.location__region, gcp_billing_export.usage_start_date
        desc]
    limit: 5000
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: left
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
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: [BigQuery Reservation API - gcp_billing_export.total_cost]
    label_value_format: ''
    series_types: {}
    x_axis_datetime_label: "%I"
    defaults_version: 1
    groupBars: true
    labelSize: 10pt
    showLegend: true
    show_null_points: true
    interpolation: linear
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
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 56
    col: 0
    width: 24
    height: 6
  - title: Cost per GB for Physical Storage (compressed)
    name: Cost per GB for Physical Storage (compressed)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage__amount_in_calculated_units,
      gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.sku__description: "%Physical%"
      gcp_billing_export.service__description: "%BigQuery%"
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr,
        is_disabled: true}, {category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/(${gcp_billing_export.usage__amount_in_calculated_units})",
        label: Cost Per GB, value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        table_calculation: cost_per_gb, _type_hint: number}]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
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
    stacking: normal
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0.00"
    defaults_version: 1
    hidden_fields:
    y_axes: []
    hidden_pivots: {}
    series_types: {}
    listen: {}
    row: 82
    col: 0
    width: 8
    height: 7
  - title: Slots Owned per Hour for Last 60 Days
    name: Slots Owned per Hour for Last 60 Days
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage_start_time, gcp_billing_export.total_usage_amount,
      gcp_billing_export.project__name]
    pivots: [gcp_billing_export.project__name]
    filters:
      gcp_billing_export.sku__description: Analysis Slots Attribution,BigQuery Flat
        Rate Flex for US (multi-region),BigQuery Flat Rate Monthly for US (multi-region)
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_time: 60 days
      gcp_billing_export.total_net_cost: ">0"
    sorts: [gcp_billing_export.project__name, gcp_billing_export.usage_start_time
        desc]
    limit: 5000
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr,
        is_disabled: true}, {category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/(${gcp_billing_export.usage__amount_in_calculated_units})",
        label: Cost Per PB, value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        table_calculation: cost_per_pb, _type_hint: number, is_disabled: true}, {
        category: table_calculation, expression: 'round(${gcp_billing_export.total_usage_amount}/60/60,0)',
        label: Total Slots, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: total_slots, _type_hint: number}]
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0"
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: true
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
    hidden_pivots: {}
    listen: {}
    row: 14
    col: 12
    width: 12
    height: 8
  - title: Slots Reserved vs Usage by Project for CME Org
    name: Slots Reserved vs Usage by Project for CME Org
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_time, gcp_billing_export.total_usage_amount,
      type]
    pivots: [type]
    filters:
      gcp_billing_export.sku__description: Analysis Slots Attribution,BigQuery Flat
        Rate Flex for US (multi-region),BigQuery Flat Rate Monthly for US (multi-region)
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_time: 14 days
      gcp_billing_export.gcp_org_id: '1036178998277'
    sorts: [type, gcp_billing_export.usage_start_time desc]
    limit: 5000
    column_limit: 5000
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr,
        is_disabled: true}, {category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/(${gcp_billing_export.usage__amount_in_calculated_units})",
        label: Cost Per PB, value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        table_calculation: cost_per_pb, _type_hint: number, is_disabled: true}, {
        category: table_calculation, expression: 'round(${gcp_billing_export.total_usage_amount}/60/60,0)',
        label: Total Slots, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: total_slots, _type_hint: number},
      {category: dimension, description: '', label: Type, value_format: !!null '',
        value_format_name: !!null '', calculation_type: group_by, dimension: type,
        args: [gcp_billing_export.project__name, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Slots, filter: 'finops-bqres,prj-ss-bqresvtn-4645'}], !!null ''],
        _kind_hint: dimension, _type_hint: string}]
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
    legend_position: left
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
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0"
    series_types:
      Slots - total_slots: line
    show_null_points: true
    interpolation: linear
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
    hidden_pivots: {}
    note_state: expanded
    note_display: above
    note_text: Hourly for Last 14 Days
    listen: {}
    row: 62
    col: 0
    width: 12
    height: 11
  - title: Slots Reserved vs Usage by Project for Sandbox Org
    name: Slots Reserved vs Usage by Project for Sandbox Org
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_time, gcp_billing_export.total_usage_amount,
      type]
    pivots: [type]
    filters:
      gcp_billing_export.sku__description: Analysis Slots Attribution,BigQuery Flat
        Rate Flex for US (multi-region),BigQuery Flat Rate Monthly for US (multi-region)
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_time: 14 days
      gcp_billing_export.gcp_org_id: '1061028459868'
    sorts: [type, gcp_billing_export.usage_start_time desc]
    limit: 5000
    column_limit: 5000
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr,
        is_disabled: true}, {category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/(${gcp_billing_export.usage__amount_in_calculated_units})",
        label: Cost Per PB, value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        table_calculation: cost_per_pb, _type_hint: number, is_disabled: true}, {
        category: table_calculation, expression: 'round(${gcp_billing_export.total_usage_amount}/60/60,0)',
        label: Total Slots, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: measure, table_calculation: total_slots, _type_hint: number},
      {category: dimension, description: '', label: Type, value_format: !!null '',
        value_format_name: !!null '', calculation_type: group_by, dimension: type,
        args: [gcp_billing_export.project__name, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Slots, filter: 'finops-bqres,prj-ss-bqresvtn-4645'}], !!null ''],
        _kind_hint: dimension, _type_hint: string}]
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
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0"
    series_types:
      Slots - total_slots: line
    show_null_points: true
    interpolation: linear
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
    hidden_pivots: {}
    note_state: expanded
    note_display: above
    note_text: Hourly for Last 14 Days
    listen: {}
    row: 73
    col: 0
    width: 24
    height: 9
  - title: Slot Cost Allocation by Project for CME Org
    name: Slot Cost Allocation by Project for CME Org
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_time, gcp_billing_export.total_usage_amount,
      type, gcp_billing_export.usage_start_date]
    pivots: [type]
    filters:
      gcp_billing_export.sku__description: Analysis Slots Attribution,BigQuery Flat
        Rate Monthly for US (multi-region)
      gcp_billing_export.service__description: "%BigQuery%"
      gcp_billing_export.usage_start_time: 14 days
      gcp_billing_export.gcp_org_id: '1036178998277'
    sorts: [type, gcp_billing_export.usage_start_time desc]
    limit: 5000
    column_limit: 5000
    total: true
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_usage_amount}/1024/1024/1024/1024/1024/86400",
        label: Usage in PB, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: usage_in_pb, _type_hint: number, id: fU0aE0kEVr,
        is_disabled: true}, {category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/(${gcp_billing_export.usage__amount_in_calculated_units})",
        label: Cost Per PB, value_format: !!null '', value_format_name: usd, _kind_hint: measure,
        table_calculation: cost_per_pb, _type_hint: number, is_disabled: true}, {
        category: table_calculation, expression: "if(${test_1}=31,(${gcp_billing_export.total_usage_amount})*0.000006346890773481830,\n\
          if(${test_1}=30,(${gcp_billing_export.total_usage_amount})*0.000006549818624681160,\n\
          if(${test_1}=29,${gcp_billing_export.total_usage_amount}/60/60*0.0244252874,\n\
          if(${test_1}=28,${gcp_billing_export.total_usage_amount}/60/60*0.0252976190,\n\
          \  0))))", label: Total Slots, value_format: !!null '', value_format_name: usd,
        _kind_hint: measure, table_calculation: total_slots, _type_hint: number},
      {category: dimension, description: '', label: Type, value_format: !!null '',
        value_format_name: !!null '', calculation_type: group_by, dimension: type,
        args: [gcp_billing_export.project__name, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Slots, filter: 'finops-bqres,prj-ss-bqresvtn-4645'}], !!null ''],
        _kind_hint: dimension, _type_hint: string}, {category: table_calculation,
        expression: date(), label: test, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: test, _type_hint: 'null', is_disabled: true},
      {category: table_calculation, expression: 'extract_days(add_days(-1, date(extract_years(add_months(1,
          ${gcp_billing_export.usage_start_date})), extract_months(add_months(1, ${gcp_billing_export.usage_start_date})),
          1)))', label: test, value_format: !!null '', value_format_name: decimal_0,
        _kind_hint: dimension, table_calculation: test_1, _type_hint: number}]
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
    legend_position: left
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
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    hide_legend: false
    label_value_format: "#,##0"
    series_types:
      Slots - total_slots: line
    show_null_points: true
    interpolation: linear
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
    hidden_fields: [gcp_billing_export.total_usage_amount, test_1, gcp_billing_export.usage_start_date]
    hidden_pivots: {}
    note_state: expanded
    note_display: above
    note_text: Hourly for Last 14 Days
    listen: {}
    row: 62
    col: 12
    width: 12
    height: 11