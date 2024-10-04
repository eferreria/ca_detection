- dashboard: credit_analysis
  title: Credit Analysis
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: MTD Credit Amount
    name: MTD Credit Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 2 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Month to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_month]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 12
    col: 6
    width: 6
    height: 3
  - title: YTD Promotion Credits
    name: YTD Promotion Credits
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_promotional_credit, gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.usage_start_year: 2 years
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_year]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 23
    col: 17
    width: 7
    height: 3
  - title: Cost and Credit Breakdown
    name: Cost and Credit Breakdown
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount]
    fill_fields: [gcp_billing_export.usage_start_month]
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'mean(offset_list(${gcp_billing_export.total_net_cost},0,4))',
        label: 4-Week Average, value_format: !!null '', value_format_name: usd_0,
        _kind_hint: measure, table_calculation: 4_week_average, _type_hint: number}]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: gcp_billing_export.total_cost, name: Gross Cost}, {axisId: gcp_billing_export.total_net_cost,
            id: gcp_billing_export.total_net_cost, name: Net Cost}, {axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Credits}, {axisId: 4_week_average,
            id: 4_week_average, name: 4-Week Net Cost Average}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0.00,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      4_week_average: line
    series_colors:
      gcp_billing_export__credits.total_amount: "#34A853"
    series_labels:
      gcp_billing_export__credits.total_amount: Credits
      gcp_billing_export.total_cost: Gross Cost
      gcp_billing_export.total_net_cost: Net Cost
      4_week_average: 4-Week Net Cost Average
    series_point_styles: {}
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 15
    col: 8
    width: 16
    height: 8
  - title: Credit Distribution by Project
    name: Credit Distribution by Project
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.project__name, gcp_billing_export__credits.total_amount]
    filters:
      gcp_billing_export.project__name: "-NULL"
    sorts: [gcp_billing_export__credits.total_amount desc]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    series_labels:
      gcp_billing_export__project__labels.value: Team
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      gcp_billing_export__credits.total_amount:
        is_active: true
        palette:
          palette_id: 6aced918-c4ed-89f5-d46d-c8f47e6114dd
          collection_id: google
          custom_colors:
          - "#ffffff"
          - "#4285F4"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Year to Date
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 15
    col: 0
    width: 8
    height: 8
  - title: Discount Breakdown
    name: Discount Breakdown
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export__credits.type,
      gcp_billing_export__credits.total_amount]
    pivots: [gcp_billing_export__credits.type]
    fill_fields: [gcp_billing_export.usage_start_month]
    sorts: [gcp_billing_export.usage_start_month desc, gcp_billing_export__credits.type]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export__credits.total_amount,
            id: DISCOUNT - gcp_billing_export__credits.total_amount, name: DISCOUNT},
          {axisId: gcp_billing_export__credits.total_amount, id: PROMOTION - gcp_billing_export__credits.total_amount,
            name: PROMOTION}, {axisId: gcp_billing_export__credits.total_amount, id: gcp_billing_export__credits.type___null
              - gcp_billing_export__credits.total_amount, name: "∅"}], showLabels: false,
        showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0.00,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [gcp_billing_export__credits.type___null - gcp_billing_export__credits.total_amount]
    label_value_format: '[>=1000000]$0.00,,"M";$0.00,"K"'
    series_types: {}
    series_colors:
      gcp_billing_export__credits.total_amount: "#34A853"
    series_labels:
      gcp_billing_export__credits.total_amount: Credits
      gcp_billing_export.total_cost: Gross Cost
      gcp_billing_export.total_net_cost: Net Cost
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 26
    col: 8
    width: 16
    height: 8
  - title: YTD Credit Amount
    name: YTD Credit Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.usage_start_year: 2 years
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Year to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_year]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 12
    col: 17
    width: 7
    height: 3
  - title: QTD Promotion Credits
    name: QTD Promotion Credits
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_promotional_credit, gcp_billing_export.usage_start_quarter]
    fill_fields: [gcp_billing_export.usage_start_quarter]
    filters:
      gcp_billing_export.usage_start_quarter: 2 quarters
    sorts: [gcp_billing_export.usage_start_quarter desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Quarter to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_quarter]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 23
    col: 12
    width: 5
    height: 3
  - title: WTD Credit Amount
    name: WTD Credit Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 2 weeks
    sorts: [gcp_billing_export.usage_start_week desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Week to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_week]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 12
    col: 0
    width: 6
    height: 3
  - title: MTD Promotion Credits
    name: MTD Promotion Credits
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_promotional_credit, gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 2 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Month to Date
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 23
    col: 6
    width: 6
    height: 3
  - title: QTD Credit Amount
    name: QTD Credit Amount
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.usage_start_quarter]
    fill_fields: [gcp_billing_export.usage_start_quarter]
    filters:
      gcp_billing_export.usage_start_quarter: 2 quarters
    sorts: [gcp_billing_export.usage_start_quarter desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Quarter to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_quarter]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 12
    col: 12
    width: 5
    height: 3
  - title: WTD Promotion Credits
    name: WTD Promotion Credits
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export__credits.total_promotional_credit, gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 2 weeks
    sorts: [gcp_billing_export.usage_start_week desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: Last Week to Date
    defaults_version: 1
    hidden_fields: [gcp_billing_export.usage_start_week]
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 23
    col: 0
    width: 6
    height: 3
  - title: Promotion Distribution by Project
    name: Promotion Distribution by Project
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.project__name, gcp_billing_export__credits.total_promotional_credit]
    filters:
      gcp_billing_export.project__name: "-NULL"
    sorts: [gcp_billing_export__credits.total_promotional_credit desc 0]
    limit: 20
    column_limit: 50
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: unstyled
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
    series_labels:
      gcp_billing_export__project__labels.value: Team
    series_cell_visualizations:
      gcp_billing_export__credits.total_amount:
        is_active: true
        palette:
          palette_id: 6aced918-c4ed-89f5-d46d-c8f47e6114dd
          collection_id: google
          custom_colors:
          - "#ffffff"
          - "#4285F4"
      gcp_billing_export__credits.total_promotional_credit:
        is_active: true
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Last Year to Date
    defaults_version: 1
    hidden_fields: []
    series_types: {}
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 26
    col: 0
    width: 8
    height: 8
  - title: Credit & Net Cost Percent Total
    name: Credit & Net Cost Percent Total
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.total_net_cost,
      gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    sorts: [gcp_billing_export.usage_start_month desc]
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
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    series_types:
      4_week_credit_average: line
    series_colors:
      gcp_billing_export__credits.total_amount: "#34A853"
    series_labels:
      gcp_billing_export__credits.total_amount: Credits
      gcp_billing_export.total_cost: Gross Cost
      gcp_billing_export.total_net_cost: Net Cost
    reference_lines: []
    column_group_spacing_ratio: 0
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 5
    width: 19
    height: 7
  - title: Total Discounts
    name: Total Discounts
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_single_record
    fields: [gcp_billing_export.billing_account_id, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount,
      gcp_billing_export__credits.total_promotional_credit, gcp_billing_export__credits.total_sustained_use_discount,
      gcp_billing_export__credits.total_committed_use_discount]
    sorts: [gcp_billing_export.total_cost desc 0]
    limit: 500
    show_view_names: false
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 0
    width: 5
    height: 7
  - title: MoM Credit Trends
    name: MoM Credit Trends
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export__credits.total_amount, gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: Percent Change of Previous,
        value_format: !!null '', value_format_name: percent_0, calculation_type: percent_difference_from_previous,
        table_calculation: percent_change_of_previous, args: [gcp_billing_export__credits.total_amount],
        _kind_hint: measure, _type_hint: number, id: RPOB1hbZt2}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_labels:
      gcp_billing_export__credits.total_amount: Credits
      gcp_billing_export.total_cost: Gross Cost
      gcp_billing_export.total_net_cost: Net Cost
    series_cell_visualizations:
      gcp_billing_export__credits.total_amount:
        is_active: true
      percent_change_of_previous:
        is_active: false
        palette:
          palette_id: cme-colors-diverging-0
          collection_id: cme-colors
    conditional_formatting: []
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: time
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    series_types: {}
    series_colors:
      gcp_billing_export__credits.total_amount: "#34A853"
    reference_lines: []
    column_group_spacing_ratio: 0
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 8
    col: 0
    width: 24
    height: 4
  - title: Adjustments View
    name: Adjustments View
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.adjustment_info__description, gcp_billing_export.adjustment_info__mode,
      gcp_billing_export.adjustment_info__type, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.adjustment_info__description: "-NULL"
    sorts: [gcp_billing_export.total_cost]
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
    series_column_widths:
      gcp_billing_export.adjustment_info__description: 548.3299999999999
      gcp_billing_export.adjustment_info__mode: 307
      gcp_billing_export.adjustment_info__type: 195
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
    series_text_format:
      gcp_billing_export.total_cost:
        align: left
    series_value_format:
      gcp_billing_export.total_cost:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 42
    col: 0
    width: 24
    height: 6
  - title: Credit Name
    name: Credit Name
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export__credits.name, gcp_billing_export__credits.type, gcp_billing_export__credits.total_amount]
    filters:
      gcp_billing_export__credits.name: "-NULL"
    sorts: [gcp_billing_export__credits.total_amount]
    limit: 500
    dynamic_fields: [{category: dimension, description: '', label: Credit Type Field,
        value_format: !!null '', value_format_name: !!null '', calculation_type: group_by,
        dimension: credit_type_field, args: [gcp_billing_export__credits.type, [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Credit Type Group, filter: ''}], !!null ''], _kind_hint: dimension,
        _type_hint: string}]
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
    series_column_widths:
      gcp_billing_export__credits.type: 324
      gcp_billing_export__credits.name: 468
    series_cell_visualizations:
      gcp_billing_export__credits.amount:
        is_active: false
    series_text_format:
      gcp_billing_export__credits.amount:
        align: center
      gcp_billing_export__credits.type:
        align: center
    series_value_format:
      gcp_billing_export__credits.amount:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
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
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 36
    col: 0
    width: 24
    height: 6
  - name: Credit Adjustments
    type: text
    title_text: Credit Adjustments
    subtitle_text: Previous 12 Months
    body_text: ''
    row: 34
    col: 0
    width: 24
    height: 2
  - type: button
    name: button_677
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 0
    width: 24
    height: 1
  filters:
  - name: GCP Project ID
    title: GCP Project ID
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
    field: gcp_billing_export.project__id
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