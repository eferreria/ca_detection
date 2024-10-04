- dashboard: consumption_summary
  title: Consumption Summary
  layout: newspaper
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: ''
  preferred_slug: 9ji1YVLYgt3yyX1s7YBEOb
  elements:
  - title: Weekly Top Services Usage
    name: Weekly Top Services Usage
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export.usage__amount_in_calculated_units,
      gcp_billing_export.service__description, billing_lookup.unit]
    pivots: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_date: 5 weeks ago for 5 weeks
      gcp_billing_export.app_id: ''
    sorts: [gcp_billing_export.usage_start_week, gcp_billing_export.usage__amount_in_calculated_units
        desc 0]
    limit: 50
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.usage__amount_in_calculated_units}",
        label: Usage Amount, value_format: '[<1000000] 0,"k";0,,"M"', value_format_name: __custom,
        _kind_hint: measure, table_calculation: usage_amount, _type_hint: number}]
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
    series_labels:
      gcp_billing_export.usage__amount_in_calculated_units: Usage Amount
    series_cell_visualizations:
      gcp_billing_export.usage__amount_in_calculated_units:
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: [gcp_billing_export.usage__amount_in_calculated_units]
    y_axes: []
    column_order: []
    note_state: collapsed
    note_display: below
    note_text: 'Note: Data is displayed for the past complete week since this week''s
      data is not finalized.'
    listen:
      Environment: gcp_billing_export.environment
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Service Type: gcp_billing_export.service__description
      Department Name: gcp_billing_export.department_name
      Project ID (PMGT): gcp_billing_export.project_id
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
      Resource App ID: gcp_billing_export.app_id_with_unallocated
      Application Name: applications.name
    row: 1
    col: 0
    width: 24
    height: 6
  - title: Daily Top Services Usage
    name: Daily Top Services Usage
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_date, gcp_billing_export.usage__amount_in_calculated_units,
      gcp_billing_export.service__description, billing_lookup.unit]
    pivots: [gcp_billing_export.usage_start_date]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
      gcp_billing_export.usage_start_date: 5 days ago for 5 days
      gcp_billing_export.app_id: ''
    sorts: [gcp_billing_export.usage_start_date, gcp_billing_export.usage__amount_in_calculated_units
        desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.usage__amount_in_calculated_units} ",
        label: Usage Amount In Calculated Units, value_format: '[<1000000] 0,"k";0,,"M"',
        value_format_name: __custom, _kind_hint: measure, table_calculation: usage_amount_in_calculated_units,
        _type_hint: number}]
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
    series_labels:
      usage_amount_in_calculated_units: Usage Amount
    series_cell_visualizations:
      gcp_billing_export.usage__amount_in_calculated_units:
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
    series_types: {}
    show_null_points: true
    interpolation: linear
    hidden_fields: [gcp_billing_export.usage__amount_in_calculated_units]
    y_axes: []
    listen:
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Service Type: gcp_billing_export.service__description
      Department Name: gcp_billing_export.department_name
      Project ID (PMGT): gcp_billing_export.project_id
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 7
    col: 0
    width: 24
    height: 8
  - title: 'Weekly Services Usage & Costs '
    name: 'Weekly Services Usage & Costs '
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost, gcp_billing_export__credits.total_amount,
      gcp_billing_export.usage_start_week, gcp_billing_export.service__description,
      billing_lookup.unit]
    pivots: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_date: 3 weeks ago for 3 weeks
      gcp_billing_export.app_id: ''
    sorts: [gcp_billing_export.usage_start_week, gcp_billing_export.usage__amount_in_calculated_units
        desc 0]
    limit: 50
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${gcp_billing_export.total_cost}",
        label: Total Cost, value_format: '[<1000000]$0,"k";$0,,"M"', value_format_name: __custom,
        _kind_hint: measure, table_calculation: total_cost, _type_hint: number}, {
        category: table_calculation, expression: "${gcp_billing_export.total_net_cost}",
        label: Total Net Cost, value_format: ' [<1000000]$0,"k";$0,,"M"', value_format_name: __custom,
        _kind_hint: measure, table_calculation: total_net_cost, _type_hint: number},
      {category: table_calculation, expression: "${gcp_billing_export__credits.total_amount}",
        label: Total Credit Amount, value_format: '[<1000000]$0,"k";$0,,"M"', value_format_name: __custom,
        _kind_hint: measure, table_calculation: total_credit_amount, _type_hint: number}]
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
    series_labels:
      gcp_billing_export.usage__amount_in_calculated_units: Usage Amount
      gcp_billing_export__credits.total_amount: Credit Amount
      gcp_billing_export.total_net_cost: Net Cost
      gcp_billing_export.total_cost: Cost
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
    series_text_format:
      gcp_billing_export.usage__amount_in_calculated_units:
        align: center
    series_value_format:
      gcp_billing_export.total_cost:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
      gcp_billing_export.total_net_cost:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
      gcp_billing_export__credits.total_amount:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
      gcp_billing_export.usage__amount_in_calculated_units: '[<1000000] 0,"k";0,,"M"'
      total_cost:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
      total_net_cost:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
        label_prefix: U.S. Dollars
      total_credit_amount:
        name: usd_0
        decimals: '0'
        format_string: "$#,##0"
        label: U.S. Dollars (0)
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
    show_null_points: true
    interpolation: linear
    hidden_fields: [gcp_billing_export.total_cost, gcp_billing_export.total_net_cost,
      gcp_billing_export__credits.total_amount]
    y_axes: []
    column_order: []
    note_state: collapsed
    note_display: below
    note_text: 'Note: Data is displayed for the past complete week since this week''s
      data is not finalized.'
    listen:
      Environment: gcp_billing_export.environment
      Project Name: gcp_billing_export.project__name
      Location Region: gcp_billing_export.location__region
      Service Type: gcp_billing_export.service__description
      Department Name: gcp_billing_export.department_name
      Project ID (PMGT): gcp_billing_export.project_id
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
      Resource App ID: gcp_billing_export.app_id_with_unallocated
      Application Name: applications.name
    row: 15
    col: 0
    width: 24
    height: 13
  - type: button
    name: button_676
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 0
    width: 24
    height: 1
  filters:
  - name: Service Type
    title: Service Type
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
    field: gcp_billing_export.service__description
  - name: Project Name
    title: Project Name
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
      options: []
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.location__region
  - name: Department Name
    title: Department Name
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
    field: gcp_billing_export.department_name
  - name: Project ID (PMGT)
    title: Project ID (PMGT)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.project_id
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