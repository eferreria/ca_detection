---
- dashboard: focus_v1_0_ga
  title: FOCUS v1.0 GA
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: USvSv2Ql1OTarx0STzBZKu
  elements:
  - title: Cost by Service Name
    name: Cost by Service Name
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.service__description, gcp_billing_export.total_net_cost]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 16
    col: 0
    width: 13
    height: 6
  - title: Cost by Region
    name: Cost by Region
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.location__region]
    filters:
      gcp_billing_export.location__region: "-NULL"
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 22
    col: 0
    width: 13
    height: 4
  - title: Cost by Billing Account
    name: Cost by Billing Account
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.billing_account_id]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 23
    col: 13
    width: 11
    height: 3
  - title: Cost by Charge Description
    name: Cost by Charge Description
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.sku__description]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
      gcp_billing_export.sku__description: Charge Description
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 8
    col: 13
    width: 11
    height: 6
  - title: Top Billed Service Names
    name: Top Billed Service Names
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_waterfall
    fields: [gcp_billing_export.service__description, gcp_billing_export.total_net_cost]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export.total_net_cost}"
      label: Total Cost
      value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: total_cost
      _type_hint: number
    up_color: "#7CB342"
    down_color: false
    total_color: "#80868B"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: false
    show_y_axis_ticks: true
    y_axis_gridlines: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    label_color: ["#FFF"]
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_net_cost]
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 0
    col: 6
    width: 18
    height: 8
  - title: New Tile
    name: New Tile
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: WTD List Cost
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: Previous Week
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_week]
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 0
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: MTD List Cost
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: Previous Week
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 2
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_quarter]
    fill_fields: [gcp_billing_export.usage_start_quarter]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: QTD List Cost
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: Previous Week
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 4
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (4)
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: YTD List Cost
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: Previous Week
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
    header_font_size: '12'
    rows_font_size: '12'
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 6
    col: 0
    width: 6
    height: 2
  - title: Monthly Spend by Publisher
    name: Monthly Spend by Publisher
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.service__description, gcp_billing_export.total_net_cost,
      gcp_billing_export.usage_start_month]
    pivots: [gcp_billing_export.service__description]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine,BigQuery Reservation
        API,Cloud Data Fusion
      gcp_billing_export.usage_start_month: 12 months
    sorts: [gcp_billing_export.service__description, gcp_billing_export.total_net_cost
        desc 0]
    limit: 10
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export.total_net_cost}"
      label: Total Cost
      value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: total_cost
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: false
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      BigQuery Reservation API - total_cost: Third Party Reseller
      Cloud Data Fusion - total_cost: Other
      Compute Engine - total_cost: Google
    label_color: ["#FFF"]
    up_color: "#7CB342"
    down_color: false
    total_color: "#80868B"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_net_cost]
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 8
    col: 0
    width: 13
    height: 8
  - title: 'Cost by Availability Zone '
    name: 'Cost by Availability Zone '
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.location__zone]
    filters:
      gcp_billing_export.location__zone: "-NULL"
    sorts: [gcp_billing_export.total_net_cost desc 0]
    limit: 500
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
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      gcp_billing_export.service__description: Service Name
      gcp_billing_export.total_net_cost: Total List Cost
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: true
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
    defaults_version: 1
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 19
    col: 13
    width: 11
    height: 4
  - title: Spend by Commitment
    name: Spend by Commitment
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export__credits.type]
    filters:
      gcp_billing_export.usage_start_month: 12 months
      gcp_billing_export__credits.id: "-NULL"
      gcp_billing_export.total_net_cost: ">0"
    sorts: [gcp_billing_export__credits.type, gcp_billing_export.total_net_cost desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${gcp_billing_export.total_net_cost}*100"
      label: Total Cost
      value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: total_cost
      _type_hint: number
    - category: table_calculation
      expression: if(${gcp_billing_export__credits.type}="Discount", "Usage", "Spend")
      label: CUD Type
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: cud_type
      _type_hint: string
    - category: table_calculation
      expression: if(${gcp_billing_export__credits.id} = "Free tier for CCAI Insights
        Analysis (100%)", "Example ID", "Example ID")
      label: CUD ID
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: cud_id
      _type_hint: string
      is_disabled: true
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
      options:
        steps: 5
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      BigQuery Reservation API - total_cost: Third Party Reseller
      Cloud Data Fusion - total_cost: Other
      Compute Engine - total_cost: Google
    label_color: ["#FFF"]
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
    show_null_points: true
    interpolation: linear
    up_color: "#7CB342"
    down_color: false
    total_color: "#80868B"
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_net_cost, gcp_billing_export__credits.type]
    y_axes: []
    listen:
      Billing Period: gcp_billing_export.export_date
      Charge Period: gcp_billing_export.usage_start_date
    row: 14
    col: 13
    width: 11
    height: 5
  filters:
  - name: Billing Period
    title: Billing Period
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcp_billing
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.export_date
  - name: Charge Period
    title: Charge Period
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcp_billing
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.usage_start_date
