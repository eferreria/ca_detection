- dashboard: cloud_cost_forecasting
  title: Cloud Cost Forecasting
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: VnKIXVmFwX5Pzy2FX0RrCj
  elements:
  - title: Actuals vs Forecast by Month
    name: Actuals vs Forecast by Month
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: looker_area
    fields: [project_explain_forecast_net_cost.time_series_month, project_detect_anomalies_net_cost.total_net_cost,
      project_explain_forecast_net_cost.total_forecast, project_explain_forecast_net_cost.total_trend,
      project_explain_forecast_net_cost.total_additional_projected_spend]
    fill_fields: [project_explain_forecast_net_cost.time_series_month]
    filters: {}
    sorts: [project_explain_forecast_net_cost.time_series_month]
    limit: 500
    column_limit: 50
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: Spend, orientation: left, series: [{axisId: project_detect_anomalies_net_cost.total_net_cost,
            id: project_detect_anomalies_net_cost.total_net_cost, name: Actual Spend},
          {axisId: project_explain_forecast_net_cost.total_trend, id: project_explain_forecast_net_cost.total_trend,
            name: ML Forecast}, {axisId: project_explain_forecast_net_cost.total_additional_projected_spend,
            id: project_explain_forecast_net_cost.total_additional_projected_spend,
            name: Forecast Adjustment}, {axisId: project_explain_forecast_net_cost.total_forecast,
            id: project_explain_forecast_net_cost.total_forecast, name: Expected Spend}],
        showLabels: true, showValues: true, valueFormat: '[>=1000000]$0.0,," M";[>=1000]$0,"
          k";$0', unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [project_explain_forecast_net_cost.total_trend, project_explain_forecast_net_cost.total_additional_projected_spend]
    hide_legend: false
    label_value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    series_types:
      project_detect_anomalies_net_cost.total_net_cost: column
    series_colors:
      project_explain_forecast_net_cost.total_trend: "#80868B"
      project_detect_anomalies_net_cost.total_net_cost: "#7CB342"
      project_explain_forecast_net_cost.total_additional_projected_spend: "#F9AB00"
      project_explain_forecast_net_cost.total_forecast: "#1A73E8"
    series_labels:
      project_explain_forecast_net_cost.total_trend: ML Forecast
      project_detect_anomalies_net_cost.total_net_cost: Actual Spend
      project_explain_forecast_net_cost.total_additional_projected_spend: Forecast
        Adjustment
      project_explain_forecast_net_cost.total_forecast: Expected Spend
    series_point_styles:
      project_explain_forecast_net_cost.total_additional_projected_spend: auto
    ordering: none
    show_null_labels: false
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
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 5
    col: 0
    width: 24
    height: 11
  - title: Actual Spend
    name: Actual Spend
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.total_net_cost]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#1A73E8"
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Actual Spend incurred for the last completed month
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 1
    col: 5
    width: 4
    height: 4
  - title: Expected Spend
    name: Expected Spend
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.total_forecast]
    filters:
      project_explain_forecast_net_cost.time_series_date: 2024/01/01 to 2024/07/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(if (${project_detect_anomalies_net_cost.total_net_cost} != 0,
        ${project_explain_forecast_net_cost.total_trend}, 0))
      label: Forecast
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: forecast
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'Expected spend is the combination of both forecast generated by ML
      and any adjustments made to it. '
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
    row: 1
    col: 9
    width: 6
    height: 2
  - name: '<p style="font-size:24px; background-color: black; color: white">Actuals
      vs Forecast YTD</p>'
    type: text
    title_text: '<p style="font-size:24px; background-color: black; color: white">Actuals
      vs Forecast YTD</p>'
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 5
    width: 14
    height: 1
  - title: Forecast Adjustment
    name: Forecast Adjustment
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.total_additional_projected_spend]
    filters:
      project_explain_forecast_net_cost.time_series_date: 2024/01/01 to 2024/07/01
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#F9AB00",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Additional projected spend based on migration schedule or ongoing cost
      optimization activities
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
    row: 3
    col: 12
    width: 3
    height: 2
  - name: '<p style="font-size:25px; background-color: black; color: white">Budget
      vs Forecast Cumulative</p>'
    type: text
    title_text: '<p style="font-size:25px; background-color: black; color: white">Budget
      vs Forecast Cumulative</p>'
    subtitle_text: ''
    body_text: ''
    row: 23
    col: 5
    width: 14
    height: 1
  - title: Projected Spend
    name: Projected Spend
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.total_forecast, project_detect_anomalies_net_cost.total_net_cost,
      project_explain_forecast_net_cost.time_series_month, project_explain_forecast_net_cost.time_series_year]
    filters: {}
    sorts: [project_explain_forecast_net_cost.time_series_month]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${project_explain_forecast_net_cost.total_trend}+ ${project_explain_forecast_net_cost.total_additional_projected_spend}"
      label: Forecasted Budget
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: forecasted_budget
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      label: 'Actual Spend Running Total '
      value_format:
      value_format_name: usd_0
      calculation_type: running_total
      table_calculation: actual_spend_running_total
      args:
      - project_detect_anomalies_net_cost.total_net_cost
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if(${project_explain_forecast_net_cost.time_series_month} < to_date("2024-07"),
        0, ${project_explain_forecast_net_cost.total_forecast})
      label: Expected Spend Filtered
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: expected_spend_filtered
      _type_hint: number
    - category: table_calculation
      label: 'Expected Spend Running Total '
      value_format:
      value_format_name: usd_0
      calculation_type: running_total
      table_calculation: expected_spend_running_total
      args:
      - expected_spend_filtered
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${actual_spend_running_total}+ ${expected_spend_running_total}"
      label: Projected Spend Running Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: projected_spend_running_total
      _type_hint: number
    - category: table_calculation
      expression: sum(${expected_spend_filtered}) + sum(${project_detect_anomalies_net_cost.total_net_cost})
      label: Sum of Projected spend
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sum_of_projected_spend
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    single_value_title: ''
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#1A73E8",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_fields: [project_explain_forecast_net_cost.total_forecast, project_detect_anomalies_net_cost.total_net_cost,
      actual_spend_running_total, expected_spend_running_total, expected_spend_filtered,
      project_explain_forecast_net_cost.time_series_month, projected_spend_running_total]
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This is projected spend on how you will end this year. This includes
      actuals until YTD, ML Forecast as well as any adjustments. '
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 24
    col: 9
    width: 6
    height: 2
  - title: Budget
    name: Budget
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.yearly_budget]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application:
      collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2
      palette_id: 5d189dfc-4f46-46f3-822b-bfb0b61777b1
    custom_color: "#80868B"
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: This is your budget for this year!
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 26
    col: 9
    width: 6
    height: 2
  - type: extension
    extension_id: gcp_cloud_cost_management::cloud_cost_forecasting
    title: Cloud Cost Forecasting
    name: Cloud Cost Forecasting
    row: 39
    col: 0
    width: 13
    height: 13
  - title: Actuals vs Forecast YTD Summary
    name: Actuals vs Forecast YTD Summary
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: looker_grid
    fields: [project_explain_forecast_net_cost.project_id, project_detect_anomalies_net_cost.total_net_cost,
      project_explain_forecast_net_cost.total_trend, project_explain_forecast_net_cost.total_additional_projected_spend,
      project_explain_forecast_net_cost.total_forecast, project_explain_forecast_net_cost.variance_amount]
    filters:
      project_explain_forecast_net_cost.total_trend: ">0"
      project_explain_forecast_net_cost.time_series_date: 2024/01/01 to 2024/07/01
    sorts: [project_explain_forecast_net_cost.variance_amount desc]
    limit: 50
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${project_detect_anomalies_net_cost.total_net_cost}+${project_explain_forecast_net_cost.total_additional_projected_spend}"
      label: Total Forecasted & Projected Spend
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: total_forecasted_projected_spend
      _type_hint: number
      is_disabled: true
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
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      project_explain_forecast_net_cost.total_trend: ML Forecast
      project_detect_anomalies_net_cost.total_net_cost: Actual Spend
      project_explain_forecast_net_cost.total_additional_projected_spend: Forecast
        Adjustment
      project_explain_forecast_net_cost.total_forecast: Expected Spend
      project_explain_forecast_net_cost.project_id: Application Name
    series_cell_visualizations:
      project_explain_forecast_net_cost.total_trend:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        font_color: !!null '', color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          custom: {id: 8394ed6a-3c54-0dd1-7bae-e78840c55e0e, label: Custom, type: continuous,
            stops: [{color: red, offset: 0}, {color: "#ffffff", offset: 50}, {color: green,
                offset: 100}]}, options: {steps: 10, constraints: {min: {type: minimum},
              mid: {type: number, value: 0}, max: {type: maximum}}, mirror: true,
            reverse: true, stepped: true}}, bold: false, italic: false, strikethrough: false,
        fields: [project_explain_forecast_net_cost.variance_amount]}]
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
    legend_position: right
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: project_explain_forecast_net_cost.total_trend,
            id: project_explain_forecast_net_cost.total_trend, name: Forecasted Spend},
          {axisId: project_explain_forecast_net_cost.total_additional_projected_spend,
            id: project_explain_forecast_net_cost.total_additional_projected_spend,
            name: Total Additional Projected Spend}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: project_detect_anomalies_net_cost.total_net_cost,
            id: project_detect_anomalies_net_cost.total_net_cost, name: Actual Spend}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      project_explain_forecast_net_cost.total_trend: "#F9AB00"
      project_detect_anomalies_net_cost.total_net_cost: "#1A73E8"
      project_explain_forecast_net_cost.total_additional_projected_spend: "#7CB342"
    show_null_points: false
    interpolation: linear
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [project_explain_forecast_net_cost.total_additional_projected_spend,
      project_explain_forecast_net_cost.total_trend]
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
    row: 16
    col: 0
    width: 24
    height: 7
  - title: Actual Spend
    name: Actual Spend (2)
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.total_net_cost]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${project_explain_forecast_net_cost.total_trend}+ ${project_explain_forecast_net_cost.total_additional_projected_spend}"
      label: Forecasted Budget
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: forecasted_budget
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#7CB342",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'Actual spend YTD. Note: This includes all of the spend in the current
      month as well. '
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 24
    col: 5
    width: 4
    height: 4
  - title: Forecast Variance ($)
    name: Forecast Variance ($)
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.total_net_cost, project_explain_forecast_net_cost.total_forecast]
    filters:
      project_explain_forecast_net_cost.time_series_date: 2024/01/01 to 2024/07/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${project_detect_anomalies_net_cost.total_net_cost}-${project_explain_forecast_net_cost.total_forecast}"
      label: Forecast variance
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: forecast_variance
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: '[>=1000000]$#,##0.0,," M";[>=1000]$#,##0.0," K";$#,##0'
    comparison_label: Variance
    conditional_formatting: [{type: greater than, value: 0, background_color: "#e6d7da",
        font_color: red, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: "#c2ffcf",
        font_color: green, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_comparison_project_explain_forecast_net_cost.variance_percentage: true
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.total_net_cost, project_explain_forecast_net_cost.total_forecast]
    hidden_points_if_no: []
    series_labels: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Variance between projected spend and budget in $.
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
    row: 1
    col: 15
    width: 4
    height: 2
  - name: '<p style="font-size:25px; background-color: black; color: white">Vertex
      AI Integrations</p>'
    type: text
    title_text: '<p style="font-size:25px; background-color: black; color: white">Vertex
      AI Integrations</p>'
    subtitle_text: ''
    body_text: ''
    row: 38
    col: 0
    width: 24
    height: 1
  - type: extension
    extension_id: extension_framework::dashboard-summarization
    title: Dashboard Insights Powered by Vertex AI
    name: Dashboard Insights Powered by Vertex AI
    row: 39
    col: 13
    width: 11
    height: 13
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 0
    width: 5
    height: 5
  - title: ML Forecast
    name: ML Forecast
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.total_trend]
    filters:
      project_explain_forecast_net_cost.time_series_date: 2024/01/01 to 2024/07/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: sum(if (${project_detect_anomalies_net_cost.total_net_cost} != 0,
        ${project_explain_forecast_net_cost.total_trend}, 0))
      label: Forecast
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: forecast
      _type_hint: number
      is_disabled: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#80868B",
        font_color: white, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Forecast generated by machine learning
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
    row: 3
    col: 9
    width: 3
    height: 2
  - title: Budget vs Forecast by Month
    name: Budget vs Forecast by Month
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: looker_column
    fields: [project_explain_forecast_net_cost.time_series_month, project_explain_forecast_net_cost.yearly_budget,
      project_detect_anomalies_net_cost.total_net_cost, project_explain_forecast_net_cost.total_forecast]
    fill_fields: [project_explain_forecast_net_cost.time_series_month]
    filters: {}
    sorts: [project_explain_forecast_net_cost.time_series_month]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Actual Spend Running Total
      value_format: 0.000,, "M";0.000, "K"
      value_format_name: __custom
      calculation_type: running_total
      table_calculation: actual_spend_running_total
      args:
      - project_detect_anomalies_net_cost.total_net_cost
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: running_total(if(${project_explain_forecast_net_cost.time_series_month}
        < to_date("2024-07"), 0, ${project_explain_forecast_net_cost.total_forecast}))
      label: Expected Spend Running Total
      value_format: 0.000,, "M"
      value_format_name: __custom
      _kind_hint: measure
      table_calculation: expected_spend_running_total
      _type_hint: number
    - category: table_calculation
      expression: sum(${project_explain_forecast_net_cost.yearly_budget})
      label: Yearly Budget
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: yearly_budget
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
    y_axes: [{label: Spend, orientation: left, series: [{axisId: actual_spend_running_total,
            id: actual_spend_running_total, name: Actual Spend Cumulative}, {axisId: expected_spend_running_total,
            id: expected_spend_running_total, name: Expected Spend Cumulative}, {
            axisId: yearly_budget, id: yearly_budget, name: Yearly Budget}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$#,##0.0,," M";[>=1000]$#,##0.0,"
          K";$#,##0', unpinAxis: false, tickDensity: default, type: linear}]
    x_axis_label: Month
    x_axis_zoom: true
    y_axis_zoom: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hidden_series: [project_explain_forecast_net_cost.total_trend, project_explain_forecast_net_cost.yearly_budget]
    hide_legend: false
    label_value_format: '[>=1000000]$#,##0.0,," M";[>=1000]$#,##0.0," K";$#,##0'
    series_types:
      yearly_budget: line
    series_colors:
      project_explain_forecast_net_cost.total_trend: "#F9AB00"
      project_detect_anomalies_net_cost.total_net_cost: "#1A73E8"
      total_budget: "#1A73E8"
      project_explain_forecast_net_cost.yearly_budget: "#1A73E8"
      project_explain_forecast_net_cost.total_additional_projected_spend: "#F9AB00"
      running_total_of_explain_forecast_total_budget: "#1A73E8"
      yearly_budget: "#EA4335"
      actual_spend_running_total: "#7CB342"
      expected_spend_running_total: "#1A73E8"
    series_labels:
      project_explain_forecast_net_cost.total_trend: Total Actuals
      project_explain_forecast_net_cost.yearly_budget: Total Budget
      project_explain_forecast_net_cost.total_additional_projected_spend: Forecast
        Adjustment
      running_total_of_explain_forecast_total_budget: Cumulative Forecast
      yearly_budget: Yearly Budget
      project_explain_forecast_net_cost.total_forecast_filtered: Expected Spend
      actual_spend_running_total: Actual Spend Cumulative
      expected_spend_running_total: Expected Spend Cumulative
    series_point_styles:
      project_explain_forecast_net_cost.yearly_budget: auto
    reference_lines: []
    show_null_points: false
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
    hidden_fields: [project_explain_forecast_net_cost.yearly_budget, project_explain_forecast_net_cost.total_forecast,
      project_detect_anomalies_net_cost.total_net_cost]
    hidden_pivots: {}
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 28
    col: 0
    width: 24
    height: 10
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 19
    width: 5
    height: 5
  - name: " (3)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 23
    col: 0
    width: 5
    height: 5
  - name: " (4)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 23
    col: 19
    width: 5
    height: 5
  - title: Budget Variance (%)
    name: Budget Variance (%)
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.total_forecast, project_detect_anomalies_net_cost.total_net_cost,
      project_explain_forecast_net_cost.time_series_month, project_explain_forecast_net_cost.time_series_year,
      project_explain_forecast_net_cost.yearly_budget]
    filters: {}
    sorts: [project_explain_forecast_net_cost.time_series_month]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${project_explain_forecast_net_cost.total_trend}+ ${project_explain_forecast_net_cost.total_additional_projected_spend}"
      label: Forecasted Budget
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: forecasted_budget
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      label: 'Actual Spend Running Total '
      value_format:
      value_format_name: usd_0
      calculation_type: running_total
      table_calculation: actual_spend_running_total
      args:
      - project_detect_anomalies_net_cost.total_net_cost
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if(${project_explain_forecast_net_cost.time_series_month} < to_date("2024-07"),
        0, ${project_explain_forecast_net_cost.total_forecast})
      label: Expected Spend Filtered
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: expected_spend_filtered
      _type_hint: number
    - category: table_calculation
      label: 'Expected Spend Running Total '
      value_format:
      value_format_name: usd_0
      calculation_type: running_total
      table_calculation: expected_spend_running_total
      args:
      - expected_spend_filtered
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${actual_spend_running_total}+ ${expected_spend_running_total}"
      label: Projected Spend Running Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: projected_spend_running_total
      _type_hint: number
    - category: table_calculation
      expression: sum(${expected_spend_filtered}) + sum(${project_detect_anomalies_net_cost.total_net_cost})
      label: Sum of Projected spend
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sum_of_projected_spend
      _type_hint: number
    - category: table_calculation
      expression: sum(${project_explain_forecast_net_cost.yearly_budget})
      label: Total Yearly Budget
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_yearly_budget
      _type_hint: number
    - category: table_calculation
      expression: " (${sum_of_projected_spend}-${total_yearly_budget})/${total_yearly_budget}"
      label: Budget Variance
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: budget_variance
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    single_value_title: ''
    value_format: ''
    conditional_formatting: [{type: greater than, value: 0, background_color: "#e6d7da",
        font_color: red, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: "#c2ffcf",
        font_color: green, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_fields: [project_explain_forecast_net_cost.total_forecast, project_detect_anomalies_net_cost.total_net_cost,
      actual_spend_running_total, expected_spend_running_total, expected_spend_filtered,
      project_explain_forecast_net_cost.time_series_month, projected_spend_running_total,
      sum_of_projected_spend, total_yearly_budget, project_explain_forecast_net_cost.yearly_budget,
      project_explain_forecast_net_cost.time_series_year]
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This is projected spend on how you will end this year. This includes
      actuals until YTD, ML Forecast as well as any adjustments. '
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 26
    col: 15
    width: 4
    height: 2
  - title: Budget Variance ($)
    name: Budget Variance ($)
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_explain_forecast_net_cost.total_forecast, project_detect_anomalies_net_cost.total_net_cost,
      project_explain_forecast_net_cost.time_series_month, project_explain_forecast_net_cost.time_series_year,
      project_explain_forecast_net_cost.yearly_budget]
    filters: {}
    sorts: [project_explain_forecast_net_cost.time_series_month]
    limit: 500
    column_limit: 50
    total: true
    dynamic_fields:
    - category: table_calculation
      expression: "${project_explain_forecast_net_cost.total_trend}+ ${project_explain_forecast_net_cost.total_additional_projected_spend}"
      label: Forecasted Budget
      value_format:
      value_format_name: usd
      _kind_hint: measure
      table_calculation: forecasted_budget
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      label: 'Actual Spend Running Total '
      value_format:
      value_format_name: usd_0
      calculation_type: running_total
      table_calculation: actual_spend_running_total
      args:
      - project_detect_anomalies_net_cost.total_net_cost
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: if(${project_explain_forecast_net_cost.time_series_month} < to_date("2024-07"),
        0, ${project_explain_forecast_net_cost.total_forecast})
      label: Expected Spend Filtered
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: expected_spend_filtered
      _type_hint: number
    - category: table_calculation
      label: 'Expected Spend Running Total '
      value_format:
      value_format_name: usd_0
      calculation_type: running_total
      table_calculation: expected_spend_running_total
      args:
      - expected_spend_filtered
      _kind_hint: measure
      _type_hint: number
    - category: table_calculation
      expression: "${actual_spend_running_total}+ ${expected_spend_running_total}"
      label: Projected Spend Running Total
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: projected_spend_running_total
      _type_hint: number
    - category: table_calculation
      expression: sum(${expected_spend_filtered}) + sum(${project_detect_anomalies_net_cost.total_net_cost})
      label: Sum of Projected spend
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: sum_of_projected_spend
      _type_hint: number
    - category: table_calculation
      expression: sum(${project_explain_forecast_net_cost.yearly_budget})
      label: Total Yearly Budget
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: total_yearly_budget
      _type_hint: number
    - category: table_calculation
      expression: " ${sum_of_projected_spend}-${total_yearly_budget}"
      label: Budget Variance
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: budget_variance
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: ''
    single_value_title: ''
    value_format: '[>=1000000]$0.0,," M";[>=1000]$0," k";$0'
    conditional_formatting: [{type: greater than, value: 0, background_color: "#e6d7da",
        font_color: red, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: "#c2ffcf",
        font_color: green, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    series_labels:
      project_explain_forecast_net_cost.total_trend: Forecasted
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    ordering: none
    show_null_labels: false
    hidden_fields: [project_explain_forecast_net_cost.total_forecast, project_detect_anomalies_net_cost.total_net_cost,
      actual_spend_running_total, expected_spend_running_total, expected_spend_filtered,
      project_explain_forecast_net_cost.time_series_month, projected_spend_running_total,
      sum_of_projected_spend, total_yearly_budget, project_explain_forecast_net_cost.yearly_budget]
    hidden_pivots: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: 'This is projected spend on how you will end this year. This includes
      actuals until YTD, ML Forecast as well as any adjustments. '
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
      Date: project_explain_forecast_net_cost.time_series_date
    row: 24
    col: 15
    width: 4
    height: 2
  - title: Forecast Variance (%)
    name: Forecast Variance (%)
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.total_net_cost, project_explain_forecast_net_cost.total_forecast]
    filters:
      project_explain_forecast_net_cost.time_series_date: 2024/01/01 to 2024/07/01
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "(${project_detect_anomalies_net_cost.total_net_cost}-${project_explain_forecast_net_cost.total_forecast})\
        \ /${project_explain_forecast_net_cost.total_forecast}"
      label: Forecast variance
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      table_calculation: forecast_variance
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_format: ''
    comparison_label: Variance
    conditional_formatting: [{type: greater than, value: 0, background_color: "#e6d7da",
        font_color: red, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}, {type: less than, value: 0, background_color: "#c2ffcf",
        font_color: green, color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2,
          palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    show_comparison_project_explain_forecast_net_cost.variance_percentage: true
    hidden_pivots: {}
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.total_net_cost, project_explain_forecast_net_cost.total_forecast]
    hidden_points_if_no: []
    series_labels: {}
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Variance between projected spend and budget in $.
    listen:
      Project ID: project_explain_forecast_net_cost.project_id
    row: 3
    col: 15
    width: 4
    height: 2
  filters:
  - name: Date
    title: Date
    type: field_filter
    default_value: '2024'
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    listens_to_filters: []
    field: project_explain_forecast_net_cost.time_series_date
  - name: Project ID
    title: Project ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: cloud_cost_forecasting
    explore: project_explain_forecast_net_cost
    listens_to_filters: []
    field: project_explain_forecast_net_cost.project_id
