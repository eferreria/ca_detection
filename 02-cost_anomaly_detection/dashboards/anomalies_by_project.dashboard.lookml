---
- dashboard: anomaly_overview_by_project
  title: Anomaly Overview by Project
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: yq3maP67LSv0Eg6hp4qaek
  elements:
  - title: Anomaly Details
    name: Anomaly Details
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: looker_grid
    fields: [project_detect_anomalies_net_cost.usage_start_date, project_detect_anomalies_net_cost.anomaly_direction,
      project_detect_anomalies_net_cost.total_cost, project_detect_anomalies_net_cost.lower_bound,
      project_detect_anomalies_net_cost.upper_bound, project_detect_anomalies_net_cost.anomaly_probability,
      project_detect_anomalies_net_cost.is_anomaly, project_detect_anomalies_net_cost.absolute_distance_from_threshold,
      project_detect_anomalies_net_cost.absolute_percent_from_threshold, project_detect_anomalies_net_cost.link_to_anomaly_deep_dive]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    sorts: [project_detect_anomalies_net_cost.usage_start_date desc]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: mean(offset_list(${project_detect_anomalies_net_cost.total_cost},0,7))
      label: 7 Day Average
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: 7_day_average
      _type_hint: number
    - category: table_calculation
      expression: mean(offset_list(${project_detect_anomalies_net_cost.total_cost},0,30))
      label: 30 Day Average
      value_format:
      value_format_name: usd
      _kind_hint: dimension
      table_calculation: 30_day_average
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
    column_order: ["$$$_row_numbers_$$$", project_detect_anomalies_net_cost.usage_start_date,
      project_detect_anomalies_net_cost.anomaly_direction, project_detect_anomalies_net_cost.total_cost,
      project_detect_anomalies_net_cost.absolute_distance_from_threshold, project_detect_anomalies_net_cost.absolute_percent_from_threshold,
      project_detect_anomalies_net_cost.anomaly_probability, project_detect_anomalies_net_cost.lower_bound,
      project_detect_anomalies_net_cost.upper_bound, 7_day_average, 30_day_average]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      project_detect_anomalies_net_cost.absolute_distance_from_threshold: Deviation
        ($)
      project_detect_anomalies_net_cost.absolute_percent_from_threshold: Deviation
        (%)
      7_day_average: 7 Day Average Cost
      30_day_average: 30 Day Average Cost
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#1A73E8",
        bold: false, italic: false, strikethrough: false, fields: [project_detect_anomalies_net_cost.absolute_distance_from_threshold],
        color_application: {collection_id: 7c56cc21-66e4-41c9-81ce-a60e1c3967b2, palette_id: 56d0c358-10a0-4fd6-aa0b-b117bef527ab}}]
    series_value_format:
      project_detect_anomalies_net_cost.lower_bound: "$#,##0.00"
      project_detect_anomalies_net_cost.upper_bound: "$#,##0.00"
      project_detect_anomalies_net_cost.anomaly_probability: "###.00%"
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
    x_axis_zoom: true
    y_axis_zoom: true
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
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Anomaly Rate
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: [project_detect_anomalies_net_cost.is_anomaly]
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 23
    col: 0
    width: 24
    height: 9
  - name: "<h1>Model Information</h1>"
    type: text
    title_text: "<h1>Model Information</h1>"
    body_text: ''
    row: 32
    col: 4
    width: 17
    height: 2
  - title: Explainable AI Metrics (hover for details)
    name: Explainable AI Metrics (hover for details)
    model: cost_anomaly_detection
    explore: project_explain_forecast_net_cost
    type: looker_grid
    fields: [project_explain_forecast_net_cost.total_holiday_effect, project_explain_forecast_net_cost.total_seasonal_period_daily,
      project_explain_forecast_net_cost.total_seasonal_period_monthly, project_explain_forecast_net_cost.total_seasonal_period_quarterly,
      project_explain_forecast_net_cost.total_seasonal_period_weekly, project_explain_forecast_net_cost.total_seasonal_period_yearly,
      project_explain_forecast_net_cost.total_spikes_and_dips, project_explain_forecast_net_cost.total_step_changes,
      project_explain_forecast_net_cost.total_time_series_adjusted_data, project_explain_forecast_net_cost.total_time_series_data,
      project_explain_forecast_net_cost.total_trend]
    limit: 500
    column_limit: 50
    query_timezone: America/Chicago
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
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
    series_cell_visualizations:
      project_explain_forecast_net_cost.total_holiday_effect:
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
    show_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Project Name: project_explain_forecast_net_cost.project_id
    row: 45
    col: 0
    width: 24
    height: 3
  - title: Model Evaluation Metrics
    name: Model Evaluation Metrics
    model: cost_anomaly_detection
    explore: project_arima_evaluate_net_cost
    type: looker_grid
    fields: [project_arima_evaluate_net_cost.aic, project_arima_evaluate_net_cost.log_likelihood,
      project_arima_evaluate_net_cost.variance, project_arima_evaluate_net_cost.non_seasonal_p,
      project_arima_evaluate_net_cost.non_seasonal_d, project_arima_evaluate_net_cost.non_seasonal_q,
      project_arima_evaluate_net_cost.has_drift, project_arima_evaluate_net_cost.has_holiday_effect,
      project_arima_evaluate_net_cost.has_spikes_and_dips, project_arima_evaluate_net_cost.has_step_changes,
      project_arima_evaluate_net_cost.intercept_or_drift, project_arima_evaluate_net_cost.ma_coefficients,
      project_arima_evaluate_net_cost.seasonal_periods]
    filters:
      project_arima_evaluate_net_cost.is_latest_model_version: 'Yes'
    sorts: [project_arima_evaluate_net_cost.aic]
    limit: 500
    column_limit: 50
    query_timezone: America/Chicago
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
    hidden_fields: [project_arima_evaluate_net_cost.ma_coefficients, project_arima_evaluate_net_cost.intercept_or_drift]
    listen:
      Project Name: project_arima_evaluate_net_cost.project_id
    row: 42
    col: 0
    width: 24
    height: 3
  - name: Evaluation Metrics Description
    type: text
    title_text: Evaluation Metrics Description
    body_text: "- **AIC (Akaike Information Criterion)**: A measure of the amount\
      \ of information lost by training and generalizing the model. It indicates how\
      \ well a model fits the data, while penalizing models with more parameters.\n\
      \  - Lower AIC values indicate better models.\n- **Log Likelihood**: A measure\
      \ of how likely the data is to have been generated by the model.\n  - Higher\
      \ log likelihood values indicate better models.\n- **Variance**: A measure of\
      \ how spread out the data is around the mean. \n  - Lower variance values indicate\
      \ more consistent data. \n- **Non Seasonal p**: The order of the autoregressive\
      \ (AR) component of the model which captures the linear trend in the data. \n\
      \  - Higher values indicate the model is more sensitive to linear trends.\n\
      - **Non Seasonal d**: The order of the model's differencing component which\
      \ captures the seasonal effects in the data. \n  - Higher values indicate the\
      \ model is more sensitive to seasonal effects.\n- **Non Seasonal q**: The order\
      \ of the moving average (MA) component of the model which captures the noise\
      \ in the data. \n  - Higher values indicate the model is more sensitive to noise.\n\
      - **Has Drift**: Indicates whether the model includes a drift term which captures\
      \ the long-term trend in the data.\n- **Has Holiday Effect**: Indicates whether\
      \ the model includes holiday effects which captures changes in data due to holidays.\n\
      - **Has Spikes and Dips**: Indicates whether the model includes spikes and dips\
      \ which are sudden changes in the data that are not due to seasonality or trends.\n\
      - **Has Step Changes**: Indicates whether the model includes step changes which\
      \ are sudden changes in the level of the data.\n- **Seasonal Periods**: Indicates\
      \ the number of periods in a season which is used to calculate the seasonal\
      \ effects in the data."
    row: 34
    col: 2
    width: 21
    height: 8
  - title: Cost by Service by Date
    name: Cost by Service by Date
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.total_cost, gcp_billing_export.service__description,
      gcp_billing_export.usage_start_date]
    pivots: [gcp_billing_export.service__description]
    filters:
      gcp_billing_export.total_cost: ">25"
    sorts: [gcp_billing_export.service__description, gcp_billing_export.total_cost
        desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: change
      label: Change
      expression: |-
        (${gcp_billing_export.total_cost}-offset(${gcp_billing_export.total_cost},1))
        /if(${gcp_billing_export.total_cost}=0,null,${gcp_billing_export.total_cost})
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      _type_hint: number
      is_disabled: true
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
    series_colors:
      Cloud Filestore - gcp_billing_export.total_cost: "#ed7564"
      Compute Engine - gcp_billing_export.total_cost: "#a392ed"
    trend_lines: []
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Usage Date: gcp_billing_export.usage_start_date
      Project Name: gcp_billing_export.project__id
    row: 9
    col: 12
    width: 12
    height: 14
  - title: GCP Project Details
    name: GCP Project Details
    model: gcp_billing
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.project__id, gcp_billing_export.project__name]
    filters:
      gcp_billing_export.total_cost: ">25"
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
      list_of_environment: Environments
      list_of_resource_app_id: Resource App IDs
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: []
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
    value_labels: legend
    label_type: labPer
    inner_radius: 40
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    hidden_pivots: {}
    listen:
      Usage Date: gcp_billing_export.usage_start_date
      Project Name: gcp_billing_export.project__id
    row: 2
    col: 5
    width: 13
    height: 3
  - title: total data
    name: total data
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.anomaly_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Unique Project and Date Combinations
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
      project_detect_anomalies_net_cost.row_count: Total Data Points
      project_detect_anomalies_net_cost.anomaly_count: Total Anomalies
      project_detect_anomalies_net_cost.anomaly_pct: Anomaly Rate %
    series_cell_visualizations:
      project_detect_anomalies_net_cost.row_count:
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.anomaly_count, project_detect_anomalies_net_cost.anomaly_pct]
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 5
    col: 2
    width: 4
    height: 4
  - title: anomaly count
    name: anomaly count
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.anomaly_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Anomaly Count
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
      project_detect_anomalies_net_cost.row_count: Total Data Points
      project_detect_anomalies_net_cost.anomaly_count: Total Anomalies
      project_detect_anomalies_net_cost.anomaly_pct: Anomaly Rate %
    series_cell_visualizations:
      project_detect_anomalies_net_cost.row_count:
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.anomaly_pct, project_detect_anomalies_net_cost.row_count]
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 5
    col: 6
    width: 4
    height: 4
  - title: anomaly rate
    name: anomaly rate
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.anomaly_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Anomaly Rate
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
      project_detect_anomalies_net_cost.row_count: Total Data Points
      project_detect_anomalies_net_cost.anomaly_count: Total Anomalies
      project_detect_anomalies_net_cost.anomaly_pct: Anomaly Rate %
    series_cell_visualizations:
      project_detect_anomalies_net_cost.row_count:
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count]
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 5
    col: 10
    width: 4
    height: 4
  - title: Cost by Date
    name: Cost by Date
    model: cost_anomaly_detection
    explore: project_explain_forecast_net_cost
    type: looker_line
    fields: [project_detect_anomalies_net_cost.usage_start_date, project_detect_anomalies_net_cost.is_anomaly,
      project_detect_anomalies_net_cost.total_net_cost, project_detect_anomalies_net_cost.anomaly_time_series_data,
      project_detect_anomalies_net_cost.min_lower_bound, project_detect_anomalies_net_cost.max_upper_bound,
      project_explain_forecast_net_cost.forecast_period_highlight]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    sorts: [project_detect_anomalies_net_cost.usage_start_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Chicago
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: project_detect_anomalies_net_cost.total_net_cost,
            id: project_detect_anomalies_net_cost.total_net_cost, name: Total Net
              Cost}, {axisId: project_detect_anomalies_net_cost.anomaly_time_series_data,
            id: project_detect_anomalies_net_cost.anomaly_time_series_data, name: Anomaly},
          {axisId: project_detect_anomalies_net_cost.min_lower_bound, id: project_detect_anomalies_net_cost.min_lower_bound,
            name: Lower Bound}, {axisId: project_detect_anomalies_net_cost.max_upper_bound,
            id: project_detect_anomalies_net_cost.max_upper_bound, name: Upper Bound}],
        showLabels: true, showValues: true, valueFormat: "$#,##0.00", unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}, {label: !!null '',
        orientation: right, series: [{axisId: project_explain_forecast_net_cost.forecast_period_highlight,
            id: project_explain_forecast_net_cost.forecast_period_highlight, name: Forecast
              Period}], showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_types:
      project_explain_forecast_net_cost.forecast_period_highlight: area
      project_detect_anomalies_net_cost.anomaly_time_series_data: scatter
    series_colors:
      project_detect_anomalies_net_cost.anomaly_time_series_data: "#ed2514"
      project_detect_anomalies_net_cost.min_lower_bound: "#c0d4e8"
      project_detect_anomalies_net_cost.max_upper_bound: "#c0d4e8"
      project_explain_forecast_net_cost.forecast_period_highlight: "#98eddc"
    series_labels:
      project_detect_anomalies_net_cost.min_lower_bound: Lower Bound
      project_detect_anomalies_net_cost.max_upper_bound: Upper Bound
      project_explain_forecast_net_cost.forecast_period_highlight: Forecast Period
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.is_anomaly]
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 9
    col: 0
    width: 12
    height: 14
  - name: ''
    type: text
    title_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 0
    width: 5
    height: 5
  - name: "<h1>Project Level Breakdown</h1>"
    type: text
    title_text: "<h1>Project Level Breakdown</h1>"
    body_text: ''
    row: 0
    col: 6
    width: 12
    height: 2
  - title: New Tile
    name: New Tile
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: looker_grid
    fields: [project_detect_anomalies_net_cost.link_to_gcp_console]
    sorts: [project_detect_anomalies_net_cost.link_to_gcp_console]
    limit: 500
    column_limit: 50
    query_timezone: America/Chicago
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: false
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
      project_detect_anomalies_net_cost.link_to_gcp_console: "​"
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
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
    title_hidden: true
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 2
    col: 18
    width: 6
    height: 3
  - title: New Tile
    name: New Tile (2)
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.avg_absolute_delta, project_detect_anomalies_net_cost.anomaly_count]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${project_detect_anomalies_net_cost.anomaly_count}*${project_detect_anomalies_net_cost.avg_absolute_delta}"
      label: Estimated Impact
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: estimated_impact
      _type_hint: number
    query_timezone: America/Chicago
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Estimated Anomaly Impact
    value_format: "$#,##0"
    hidden_pivots: {}
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
    hidden_fields: [project_detect_anomalies_net_cost.avg_absolute_delta, project_detect_anomalies_net_cost.anomaly_count]
    listen:
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 5
    col: 18
    width: 4
    height: 4
  - title: New Tile (Copy)
    name: New Tile (Copy)
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.avg_absolute_delta, project_detect_anomalies_net_cost.anomaly_count]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${project_detect_anomalies_net_cost.anomaly_count}*${project_detect_anomalies_net_cost.avg_absolute_delta}"
      label: Estimated Impact
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: estimated_impact
      _type_hint: number
    query_timezone: America/Chicago
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Average Anomaly Deviation Amount
    value_format: "$#,##0.00"
    hidden_pivots: {}
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
    hidden_fields: [project_detect_anomalies_net_cost.anomaly_count, estimated_impact]
    listen:
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 5
    col: 14
    width: 4
    height: 4
  - name: " (2)"
    type: text
    title_text: ''
    body_text: ''
    row: 0
    col: 18
    width: 6
    height: 2
  filters:
  - name: Usage Date
    title: Usage Date
    type: field_filter
    default_value: 2023/07/01 to 2023/07/31
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.usage_start_date
  - name: Project Name
    title: Project Name
    type: field_filter
    default_value: llmncs
    allow_multiple_values: false
    required: false
    ui_config:
      type: advanced
      display: popover
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.project_name
  - name: Anomaly Probability Threshold
    title: Anomaly Probability Threshold
    type: field_filter
    default_value: '0.99'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
  - name: Total Cost Difference from Threshold
    title: Total Cost Difference from Threshold
    type: field_filter
    default_value: '1500'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.set_absolute_delta_threshold
  - name: Percent Difference from Threshold
    title: Percent Difference from Threshold
    type: field_filter
    default_value: '0.15'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: cost_anomaly_detection
    explore: project_explain_forecast_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.set_absolute_percent_threshold
