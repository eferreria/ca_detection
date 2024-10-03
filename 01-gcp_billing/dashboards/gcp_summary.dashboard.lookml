- dashboard: gcp_summary
  title: GCP Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 6dbjXp0ah43jfdioKunIn8
  elements:
  - title: YTD Costs
    name: YTD Costs
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.usage_start_year, gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.usage_start_year: 2 years
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
    hidden_pivots: {}
    listen:
      Service Type: gcp_billing_export.service__description
    row: 1
    col: 0
    width: 4
    height: 2
  - title: WTD Costs
    name: WTD Costs
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 2 weeks
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
    hidden_pivots: {}
    listen:
      Service Type: gcp_billing_export.service__description
    row: 7
    col: 0
    width: 4
    height: 2
  - title: MTD Costs
    name: MTD Costs
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 2 months
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
    hidden_pivots: {}
    listen:
      Service Type: gcp_billing_export.service__description
    row: 5
    col: 0
    width: 4
    height: 2
  - title: QTD Costs
    name: QTD Costs
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.usage_start_quarter, gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_quarter]
    filters:
      gcp_billing_export.usage_start_quarter: 2 quarters
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
    hidden_pivots: {}
    listen:
      Service Type: gcp_billing_export.service__description
    row: 3
    col: 0
    width: 4
    height: 2
  - name: "<b>SPEND TO DATE</b>"
    type: text
    title_text: "<b>SPEND TO DATE</b>"
    body_text: ''
    row: 0
    col: 0
    width: 22
    height: 1
  - name: "<b>CREDIT ANALYSIS</b>"
    type: text
    title_text: "<b>CREDIT ANALYSIS</b>"
    body_text: ''
    row: 9
    col: 0
    width: 24
    height: 2
  - title: CREDIT USAGE BY PROJECT
    name: CREDIT USAGE BY PROJECT
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.project__name]
    filters:
      gcp_billing_export.usage_start_week: 52 weeks
      gcp_billing_export.project__name: "-NULL"
    sorts: [gcp_billing_export__credits.total_amount desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: running_total, _type_hint: number,
        category: table_calculation, expression: 'running_total(${gcp_billing_export__credits.total_amount})',
        label: Running Total, value_format: !!null '', value_format_name: usd_0, is_disabled: true}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: bottom, series: [{axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Total Credit Amount}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    label_value_format: '[<=1000000]$0.0,"K";$0.0,,"M"'
    series_types: {}
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: []
    listen:
      Service Type: gcp_billing_export.service__description
    row: 14
    col: 0
    width: 7
    height: 9
  - title: TOP BILLED PROJECTS
    name: TOP BILLED PROJECTS
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_waterfall
    fields: [gcp_billing_export.project__name, gcp_billing_export.total_cost]
    sorts: [gcp_billing_export.total_cost desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${gcp_billing_export.total_cost}+0",
        label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null ''}]
    query_timezone: America/Los_Angeles
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    show_value_labels: true
    show_x_axis_ticks: true
    show_x_axis_label: false
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: false
    y_axis_gridlines: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    label_color: ["#FFF"]
    x_axis_gridlines: false
    show_view_names: false
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [gcp_billing_export.total_cost]
    y_axes: []
    listen:
      Service Type: gcp_billing_export.service__description
    row: 25
    col: 0
    width: 24
    height: 8
  - name: "<b>COST BREAKDOWN DETAILS</b>"
    type: text
    title_text: "<b>COST BREAKDOWN DETAILS</b>"
    body_text: ''
    row: 23
    col: 0
    width: 24
    height: 2
  - title: YEAR OVER YEAR SPEND
    name: YEAR OVER YEAR SPEND
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year]
    pivots: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.currency: USD
      gcp_billing_export.usage_start_year: 3 years ago for 3 years,1 years
      gcp_billing_export.total_cost: NOT NULL
    sorts: [gcp_billing_export.usage_start_year, gcp_billing_export.usage_start_month_name]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2020 - gcp_billing_export.total_cost, name: '2020'}, {axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: '2021'}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.0,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Service Type: gcp_billing_export.service__description
    row: 1
    col: 4
    width: 20
    height: 8
  - type: button
    name: button_674
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#1A73E8","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 22
    width: 2
    height: 1
  - title: REGION
    name: REGION
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_cost, gcp_billing_export__credits.total_amount,
      gcp_billing_export.location__region]
    filters:
      gcp_billing_export.location__region: "-NULL"
    sorts: [gcp_billing_export.total_cost desc 0]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Service Type: gcp_billing_export.service__description
    row: 39
    col: 0
    width: 12
    height: 6
  - title: SKU
    name: SKU
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.sku__description, gcp_billing_export.total_cost, gcp_billing_export__credits.total_amount]
    sorts: [gcp_billing_export.total_cost desc 0]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Service Type: gcp_billing_export.service__description
    row: 33
    col: 12
    width: 12
    height: 6
  - title: SERVICE AMOUNT
    name: SERVICE AMOUNT
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_cost, gcp_billing_export__credits.total_amount,
      gcp_billing_export.service__description]
    sorts: [gcp_billing_export.total_cost desc 0]
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen:
      Service Type: gcp_billing_export.service__description
    row: 33
    col: 0
    width: 12
    height: 6
  - title: Credit Amount
    name: Credit Amount
    model: gcp_billing
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.total_cost]
    sorts: [gcp_billing_export__credits.total_amount desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: running_total, _type_hint: number,
        category: table_calculation, expression: 'running_total(${gcp_billing_export__credits.total_amount})',
        label: Running Total, value_format: !!null '', value_format_name: usd_0, is_disabled: true},
      {category: table_calculation, expression: "${gcp_billing_export__credits.total_amount}/${gcp_billing_export.total_cost}",
        label: Percent of Total, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: percent_of_total, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    value_format: '[<=1000000]$0.0,"K";$0.0,,"M"'
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Total Credit Amount}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    label_value_format: '[<=1000000]$0.0,"K";$0.0,,"M"'
    series_types: {}
    show_null_points: true
    defaults_version: 1
    interpolation: linear
    hidden_fields: [gcp_billing_export.total_cost]
    listen:
      Service Type: gcp_billing_export.service__description
    row: 11
    col: 0
    width: 7
    height: 3
  - title: COST VS CREDIT ANALYSIS
    name: COST VS CREDIT ANALYSIS
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export__credits.total_amount,
      gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 52 weeks ago for 52 weeks
    sorts: [gcp_billing_export.usage_start_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'mean(offset_list(${gcp_billing_export.total_net_cost},0,4))',
        label: 4-Week Moving Average, value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, table_calculation: 4_week_moving_average, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Total Credit Amount},
          {axisId: gcp_billing_export.total_net_cost, id: gcp_billing_export.total_net_cost,
            name: Total Net Cost}, {axisId: 4_week_moving_average, id: 4_week_moving_average,
            name: 4-Week Moving Average}], showLabels: true, showValues: true, valueFormat: '[<=1000000]$0.0,"K";$0.0,,"M"',
        unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      4_week_moving_average: line
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Service Type: gcp_billing_export.service__description
    row: 11
    col: 7
    width: 17
    height: 7
  - title: PERCENT OF SPEND
    name: PERCENT OF SPEND
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export__credits.total_amount,
      gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 52 weeks ago for 52 weeks
    sorts: [gcp_billing_export.usage_start_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'mean(offset_list(${gcp_billing_export.total_net_cost},0,4))',
        label: 4-Week Moving Average, value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, table_calculation: 4_week_moving_average, _type_hint: number}]
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Credit %}, {axisId: gcp_billing_export.total_net_cost,
            id: gcp_billing_export.total_net_cost, name: Net Cost %}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '8'
    series_types:
      4_week_moving_average: line
    series_labels:
      gcp_billing_export__credits.total_amount: Credit %
      gcp_billing_export.total_net_cost: Net Cost %
    label_color: [transparent, black]
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: ".25"}, {reference_type: line, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", line_value: ".5"}]
    show_null_points: false
    interpolation: monotone
    defaults_version: 1
    hidden_fields: [4_week_moving_average]
    hidden_pivots: {}
    listen:
      Service Type: gcp_billing_export.service__description
    row: 18
    col: 7
    width: 17
    height: 5
  filters:
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: "-Support"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: gcp_billing
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description
