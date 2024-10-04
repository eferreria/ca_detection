- dashboard: executive_summary
  title: Executive Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: Invoice Net Cost and Credit Amount
    name: Invoice Net Cost and Credit Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.total_cost, gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount,
      gcp_billing_export.invoice_month_month]
    filters:
      gcp_billing_export.invoice_month_month: 12 months
    sorts: [gcp_billing_export.invoice_month_month desc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_net_cost,
            id: gcp_billing_export.total_net_cost, name: Total Net Cost}, {axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Total Credit Amount}],
        showLabels: true, showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0.00,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    series_types: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 1
    col: 6
    width: 18
    height: 8
  - title: New Tile
    name: New Tile
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.usage_start_date: 2 years
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/offset(${gcp_billing_export.total_net_cost},1)-1",
        label: Change, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: YTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: YTD Costs
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#34A853", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 1
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (2)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_quarter]
    fill_fields: [gcp_billing_export.usage_start_quarter]
    filters:
      gcp_billing_export.usage_start_date: 2 quarters
    sorts: [gcp_billing_export.usage_start_quarter desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/offset(${gcp_billing_export.total_net_cost},1)-1",
        label: Change, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: QTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: YTD Costs
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#34A853", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 3
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (3)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_date: 2 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/offset(${gcp_billing_export.total_net_cost},1)-1",
        label: Change, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: MTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: YTD Costs
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#34A853", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 5
    col: 0
    width: 6
    height: 2
  - title: New Tile
    name: New Tile (4)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_date: 2 weeks
    sorts: [gcp_billing_export.usage_start_week desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/offset(${gcp_billing_export.total_net_cost},1)-1",
        label: Change, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
    custom_color: "#FFF"
    single_value_title: WTD Costs
    value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    comparison_label: YTD Costs
    conditional_formatting: [{type: not equal to, value: -999, background_color: '',
        font_color: "#34A853", color_application: {collection_id: google, palette_id: google-diverging-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 7
    col: 0
    width: 6
    height: 2
  - title: Billing Account
    name: Billing Account
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_single_record
    fields: [gcp_billing_export.billing_account_id, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount]
    sorts: [gcp_billing_export.total_cost desc 0]
    limit: 500
    show_view_names: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 21
    col: 0
    width: 8
    height: 4
  - title: MoM Invoice Amount
    name: MoM Invoice Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.invoice_month_month]
    filters:
      gcp_billing_export.invoice_month_month: 10 months ago for 10 months
    sorts: [gcp_billing_export.invoice_month_month desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_net_cost}/offset(${gcp_billing_export.total_net_cost},1)",
        label: Percent of Previous, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percent_of_previous, _type_hint: number,
        id: i6FdvSbYid}, {category: table_calculation, expression: "${gcp_billing_export.total_net_cost}-(offset(${gcp_billing_export.total_net_cost},1))",
        label: 'Delta From Previous Month ', value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, table_calculation: delta_from_previous_month, _type_hint: number,
        id: sep7RiIQ4F}]
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
    header_text_alignment: center
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels: {}
    series_cell_visualizations:
      gcp_billing_export.total_net_cost:
        is_active: false
      new_calculation:
        is_active: true
        palette:
          palette_id: cme-colors-diverging-0
          collection_id: cme-colors
      delta_from_previous_month:
        is_active: false
        palette:
          palette_id: ca416055-c8ec-01c1-35a0-266e1059dfda
          collection_id: cme-colors
          custom_colors:
          - "#11e817"
          - "#f6ffaf"
          - "#e0552a"
    series_text_format:
      gcp_billing_export.total_net_cost:
        align: center
      percent_of_previous:
        align: center
      delta_from_previous_month:
        align: center
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#112B4A",
        font_color: !!null '', color_application: {collection_id: cme-colors, custom: {
            id: f2b121b9-7f83-ad9e-ab1b-de4c7f321957, label: Custom, type: continuous,
            stops: [{color: "#47ff89", offset: 0}, {color: "#fffc45", offset: 50},
              {color: "#ff4523", offset: 100}]}, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [delta_from_previous_month]}]
    series_value_format:
      gcp_billing_export.total_net_cost:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
    arm_length: 25
    arm_weight: 50
    spinner_length: 100
    spinner_weight: 50
    angle: 90
    cutout: 50
    range_x: 1
    range_y: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_net_cost,
            id: gcp_billing_export.total_net_cost, name: Total Net Cost}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: new_calculation,
            id: new_calculation, name: New Calculation}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    font_size: 12
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    show_null_points: true
    interpolation: linear
    value_labels: legend
    label_type: labPer
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    up_color: false
    down_color: false
    total_color: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 15
    col: 0
    width: 8
    height: 6
  - title: Quarterly Invoice Amount
    name: Quarterly Invoice Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.total_net_cost, gcp_billing_export.invoice_month_quarter,
      gcp_billing_export__credits.total_amount]
    fill_fields: [gcp_billing_export.invoice_month_quarter]
    filters:
      gcp_billing_export.invoice_month_quarter: 8 quarters ago for 8 quarters
    sorts: [gcp_billing_export.invoice_month_quarter desc]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_net_cost,
            id: gcp_billing_export.total_net_cost, name: Total Net Cost}, {axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Total Credit Amount}],
        showLabels: true, showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0.00,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    series_types: {}
    reference_lines: []
    trend_lines: []
    ordering: none
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 9
    col: 8
    width: 16
    height: 8
  - title: Monthly Support Cost Amount
    name: Monthly Support Cost Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_cost, gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount,
      gcp_billing_export.invoice_month_month]
    filters:
      gcp_billing_export.invoice_month_month: 1 years
      gcp_billing_export.service__description: Support
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
    header_text_alignment: center
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
        is_active: false
    series_text_format:
      gcp_billing_export.total_net_cost:
        align: center
      gcp_billing_export__credits.total_amount:
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
    stacking: normal
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_net_cost,
            id: gcp_billing_export.total_net_cost, name: Total Net Cost}, {axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Total Credit Amount}],
        showLabels: true, showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0.00,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    label_value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    series_types: {}
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    show_null_points: true
    interpolation: linear
    listen:
      Usage Start Date: gcp_billing_export.usage_start_date
      Service Name: billing_lookup.service_name
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 9
    col: 0
    width: 8
    height: 6
  - type: button
    name: button_675
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 0
    width: 24
    height: 1
  - title: Contractual Spend with Actual Cost
    name: Contractual Spend with Actual Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [spend.month_month, spend.total_forecast, gcp_billing_export.total_net_cost]
    fill_fields: [spend.month_month]
    filters:
      spend.month_month: NOT NULL
    sorts: [spend.month_month]
    limit: 500
    dynamic_fields: [{category: measure, expression: !!null '', label: Spend, value_format: !!null '',
        value_format_name: !!null '', based_on: spend.cumulative_spend, _kind_hint: measure,
        measure: spend, type: max, _type_hint: number, filters: {}}, {category: table_calculation,
        expression: 'if(${spend.total_forecast} = 0, null, ${spend.total_forecast})',
        label: Forecast, value_format: !!null '', value_format_name: usd_0, _kind_hint: measure,
        table_calculation: forecast, _type_hint: number}, {category: table_calculation,
        label: Total Net Cost, value_format: !!null '', value_format_name: usd_0,
        calculation_type: running_total, table_calculation: total_net_cost, args: [
          gcp_billing_export.total_net_cost], _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: spend.total_spend, id: spend.total_spend,
            name: Total Spend}, {axisId: forecast, id: forecast, name: Forecast}],
        showLabels: true, showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0.00,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '9'
    hidden_series: []
    font_size: 10px
    label_value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    series_types: {}
    label_rotation:
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: center, color: "#000000",
        line_value: '100000000', label: "$100M Commit"}]
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields: [spend.total_forecast, gcp_billing_export.total_net_cost]
    listen:
    row: 17
    col: 8
    width: 16
    height: 8
  filters:
  - name: Usage Start Date
    title: Usage Start Date
    type: field_filter
    default_value: ''
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
  - name: Service Name
    title: Service Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: billing_lookup.service_name
  - name: Project Name
    title: Project Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.project__name
  - name: Location Region
    title: Location Region
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.location__region
  - name: Is Marketplace Purchase? (Yes / No)
    title: Is Marketplace Purchase? (Yes / No)
    type: field_filter
    default_value: 'No'
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_toggles
      display: inline
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: pricing_mapping.marketplace_purchase