- dashboard: marketplace
  title: Marketplace
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: MCmrLpfG7BuvKhgRw2pScK
  elements:
  - title: Marketplace SKU Details
    name: Marketplace SKU Details
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.sku__description, gcp_billing_export.service__description,
      gcp_billing_export.total_cost, gcp_billing_export.total_net_cost]
    sorts: [gcp_billing_export.total_cost desc]
    limit: 500
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
    series_types: {}
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", gcp_billing_export.sku__description, gcp_billing_export.service__description,
      gcp_billing_export.total_net_cost, gcp_billing_export.total_cost]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_column_widths:
      gcp_billing_export.sku__description: 405.33299999999997
      gcp_billing_export.service__description: 387.3370000000001
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
    series_text_format:
      gcp_billing_export.total_cost:
        align: center
      gcp_billing_export.total_net_cost:
        align: center
    hidden_fields: []
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 16
    col: 0
    width: 24
    height: 5
  - title: Marketplace Costs vs GCP costs
    name: Marketplace Costs vs GCP costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_marketplace_cost, gcp_billing_export.usage_start_month,
      gcp_billing_export.total_net_cost]
    filters: {}
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}-${gcp_billing_export.total_marketplace_cost}",
        label: Total GCP Cost, value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, table_calculation: total_gcp_cost, _type_hint: number},
      {category: table_calculation, expression: "${gcp_billing_export.total_marketplace_cost}/${gcp_billing_export.total_net_cost}",
        label: Marketplace % of Costs, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: marketplace_of_costs, _type_hint: number},
      {category: table_calculation, expression: "${total_gcp_cost}/${gcp_billing_export.total_net_cost}",
        label: GCP % of Costs, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: gcp_of_costs, _type_hint: number}]
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
    column_order: ["$$$_row_numbers_$$$", gcp_billing_export.usage_start_month, gcp_billing_export.total_marketplace_cost,
      marketplace_of_costs, total_gcp_cost, gcp_of_costs, gcp_billing_export.total_cost]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      gcp_billing_export.total_marketplace_cost:
        is_active: false
    series_text_format:
      gcp_billing_export.total_marketplace_cost:
        align: center
      gcp_billing_export.total_cost:
        align: center
      total_gcp_cost:
        align: center
      marketplace_of_costs:
        align: center
      gcp_of_costs:
        align: center
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 11
    col: 0
    width: 24
    height: 5
  - title: Trending Marketplace Costs
    name: Trending Marketplace Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.service__description, gcp_billing_export.total_cost,
      gcp_billing_export.usage_start_month]
    pivots: [gcp_billing_export.service__description]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_week: 6 months ago for 6 months
      pricing_mapping.marketplace_purchase: 'Yes'
    sorts: [gcp_billing_export.service__description, gcp_billing_export.usage_start_month
        desc]
    limit: 500
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
    show_null_points: true
    interpolation: linear
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    truncate_header: false
    size_to_fit: true
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    defaults_version: 1
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 4
    col: 0
    width: 18
    height: 7
  - title: Untitled (Copy)
    name: Untitled (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_marketplace_cost, gcp_billing_export.total_net_cost,
      gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters: {}
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}-${gcp_billing_export.total_marketplace_cost}",
        label: Total GCP Costs, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, table_calculation: total_gcp_costs, _type_hint: number},
      {category: table_calculation, expression: "${total_gcp_costs}/${gcp_billing_export.total_net_cost}",
        label: Percentage, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percentage, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#006db6"
    single_value_title: YTD GCP Cost,
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: of Total Cost
    series_types: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_marketplace_cost, gcp_billing_export.total_net_cost]
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 8
    width: 8
    height: 3
  - title: Trending Marketplace Costs (Copy)
    name: Trending Marketplace Costs (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.invoice_month_month, gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.invoice_month_month]
    filters:
      gcp_billing_export.invoice_month_month: 14 months ago for 14 months
      pricing_mapping.marketplace_purchase: 'Yes'
    sorts: [gcp_billing_export.invoice_month_month desc]
    limit: 500
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
      gcp_billing_export.total_cost:
        is_active: false
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
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    title_hidden: true
    listen: {}
    row: 4
    col: 18
    width: 6
    height: 7
  - title: Untitled (Copy 3)
    name: Untitled (Copy 3)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_marketplace_cost, gcp_billing_export.total_net_cost,
      gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters: {}
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_marketplace_cost}/${gcp_billing_export.total_net_cost}",
        label: Marketplace % of Cost, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: marketplace_of_cost, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#006db6"
    single_value_title: YTD Marketplace Cost
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: of Total Cost
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [gcp_billing_export.total_net_cost]
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 0
    width: 8
    height: 3
  - title: Untitled (Copy 0)
    name: Untitled (Copy 0)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_marketplace_cost, gcp_billing_export.total_net_cost,
      gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters: {}
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_marketplace_cost}/${gcp_billing_export.total_net_cost}",
        label: Marketplace % of Cost, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: marketplace_of_cost, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#006db6"
    single_value_title: YTD Total Net Cost
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: of Total Cost
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [gcp_billing_export.total_marketplace_cost, marketplace_of_cost,
      gcp_billing_export.usage_start_year]
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 16
    width: 8
    height: 3
  - type: button
    name: button_680
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 0
    width: 24
    height: 1
  filters:
  - name: Usage Start Date
    title: Usage Start Date
    type: field_filter
    default_value: 12 month ago for 12 month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.usage_start_date