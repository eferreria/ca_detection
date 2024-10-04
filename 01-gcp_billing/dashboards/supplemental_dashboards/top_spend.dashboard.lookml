- dashboard: top_cost_categories
  title: Top Cost Categories
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: aGUDLB74yNLDSujQ0N41Kb
  elements:
  - title: Top 10 GCP Services
    name: Top 10 GCP Services
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export.total_cost]
    filters:
    sorts: [gcp_billing_export.total_cost desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${gcp_billing_export.total_cost}+0",
        label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null '',
        id: c0mA2XJJ8L}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      total_cost: "#3CC8FF"
    label_color: []
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    y_axes: []
    listen:
      Service Type: gcp_billing_export.service__description
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 0
    width: 7
    height: 7
  - title: Top 10 GCP SKUs
    name: Top 10 GCP SKUs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export.total_cost, gcp_billing_export.sku__description]
    sorts: [gcp_billing_export.total_cost desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${gcp_billing_export.total_cost}+0",
        label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null '',
        id: c0mA2XJJ8L}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      total_cost: "#3CC8FF"
    label_color: []
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    y_axes: []
    listen:
      Service Type: gcp_billing_export.service__description
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 8
    col: 0
    width: 7
    height: 7
  - title: Top 10 App IDs
    name: Top 10 App IDs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_bar
    fields: [gcp_billing_export.total_cost]
    filters:
    sorts: [gcp_billing_export.total_cost desc]
    limit: 10
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      total_cost: "#112B4A"
      gcp_billing_export.total_cost: "#3CC8FF"
    label_color: []
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Service Type: gcp_billing_export.service__description
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 15
    col: 0
    width: 7
    height: 6
  - title: GCP SKUs Month Over Month
    name: GCP SKUs Month Over Month
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_cost, gcp_billing_export.sku__description, gcp_billing_export.usage_start_month]
    pivots: [gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 3 months ago for 3 months
    sorts: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost desc
        0]
    limit: 10
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: 'Percent Change ', value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number, id: YZbVhBYMqN}]
    show_view_names: true
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
    y_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      total_cost: "#112B4A"
    label_color: []
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Usage Start Date does not filter this Visualization
    listen:
      Service Type: gcp_billing_export.service__description
    row: 28
    col: 0
    width: 24
    height: 7
  - title: GCP SKUs Week Over Week
    name: GCP SKUs Week Over Week
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.total_cost, gcp_billing_export.sku__description, gcp_billing_export.usage_start_week]
    pivots: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 4 weeks ago for 4 weeks
      gcp_billing_export.total_cost: ">50,NOT NULL"
    sorts: [gcp_billing_export.usage_start_week, percent_change desc 3]
    limit: 10
    column_limit: 20
    dynamic_fields: [{category: table_calculation, label: 'Percent Change ', value_format: !!null '',
        value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number, id: EjkFG5jIxW}]
    show_view_names: true
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
    y_axis_gridlines: false
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      total_cost: "#112B4A"
    label_color: []
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: Usage Start Date does not filter this Visualization
    listen:
      Service Type: gcp_billing_export.service__description
    row: 21
    col: 0
    width: 24
    height: 7
  - title: Top 10 GCP Projects
    name: Top 10 GCP Projects
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_waterfall
    fields: [gcp_billing_export.project__name, gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.project__name: "-NULL"
    sorts: [gcp_billing_export.total_cost desc]
    limit: 10
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${gcp_billing_export.total_cost}+0",
        label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null '',
        id: c0mA2XJJ8L}]
    up_color: "#25a9e0"
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
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    label_color: []
    x_axis_gridlines: false
    show_view_names: true
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
    show_null_labels: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    series_types: {}
    series_colors:
      total_cost: "#112B4A"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    y_axes: []
    listen:
      Service Type: gcp_billing_export.service__description
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 10
    col: 7
    width: 17
    height: 11
  - title: Service Type Daily Spend
    name: Service Type Daily Spend
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_date]
    fill_fields: [gcp_billing_export.usage_start_date]
    filters:
    sorts: [ gcp_billing_export.total_cost desc 0]
    limit: 100
    dynamic_fields: [{_kind_hint: measure, table_calculation: total_cost, _type_hint: number,
        category: table_calculation, expression: "${gcp_billing_export.total_cost}+0",
        label: Total Cost, value_format: '[>=1000000]$0.0,,"M";$0.0,"K"', value_format_name: !!null '',
        id: c0mA2XJJ8L}]
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: false
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
    show_null_labels: true
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: true
    series_types: {}
    series_colors:
      total_cost: "#112B4A"
    label_color: []
    up_color: "#34A853"
    down_color: false
    total_color: "#9AA0A6"
    defaults_version: 1
    hidden_fields: [gcp_billing_export.total_cost]
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: 'Note: Data is displayed for the past complete week since this week''s
      data is not finalized.'
    listen:
      Service Type: gcp_billing_export.service__description
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 1
    col: 7
    width: 17
    height: 9
  - type: button
    name: button_283
    rich_content_json: '{"text":"Top Spend Categories (Net Cost)","description":"","newTab":true,"alignment":"left","size":"small","style":"FILLED","color":"#1A73E8","href":"https://cmebilling.cloud.looker.com/dashboards/30?Usage+Start+Date=3+month+ago+for+3+month&App+Name=&App+ID="}'
    row: 0
    col: 0
    width: 4
    height: 1
  - type: button
    name: button_329
    rich_content_json: '{"text":"Consumption Summary","description":"","newTab":true,"alignment":"left","size":"small","style":"FILLED","color":"#1A73E8","href":"https://cmebilling.cloud.looker.com/dashboards/25?App+ID=&Environment=&Project+Name=&Location+Region=&Service+Type=-Citrix+Virtual+Apps+and+Desktops+Service+for+Google+Cloud%2C-%22Palo+Alto+Networks%2C+Inc.+Strata%22&Department+Name=&Is+Marketplace+Purchase%3F+%28Yes+%2F+No%29=No&Project+ID+%28PMGT%29="}'
    row: 0
    col: 4
    width: 4
    height: 1
  - type: button
    name: button_678
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 15
    width: 8
    height: 1
  filters:
  - name: Usage Start Date
    title: Usage Start Date
    type: field_filter
    default_value: 3 month ago for 3 month
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