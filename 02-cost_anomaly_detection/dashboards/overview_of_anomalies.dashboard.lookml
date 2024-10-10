- dashboard: overview_of_anomalies
  title: Overview of Anomalies
  layout: newspaper
  preferred_viewer: dashboards-next
  filters_location_top: false
  description: ''
  preferred_slug: 375pzVTOLkUDyW7HjfytMN
  elements:
  - title: New Tile
    name: New Tile
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.anomaly_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
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
    single_value_title: Unique Project and Date Combinations
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
    hidden_fields: [project_detect_anomalies_net_cost.anomaly_count, project_detect_anomalies_net_cost.anomaly_pct]
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 9
    col: 2
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (2)
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.anomaly_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
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
    single_value_title: Anomaly Count
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
    hidden_fields: [project_detect_anomalies_net_cost.anomaly_pct, project_detect_anomalies_net_cost.row_count]
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 9
    col: 6
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (3)
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.anomaly_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
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
    single_value_title: Anomaly Rate
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
    hidden_fields: [project_detect_anomalies_net_cost.row_count, project_detect_anomalies_net_cost.anomaly_count]
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 9
    col: 10
    width: 4
    height: 3
  - title: New Tile
    name: New Tile (4)
    model: cost_anomaly_detection
    explore: bqml_model_info
    type: looker_grid
    fields: [bqml_model_info.max_business_date, bqml_model_info.min_business_date,
      bqml_model_info.model_name]
    filters:
      bqml_model_info.is_latest_model_version: 'Yes'
    sorts: [bqml_model_info.max_business_date desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", bqml_model_info.model_name, bqml_model_info.min_business_date,
      bqml_model_info.max_business_date]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      bqml_model_info.min_business_date: Training Data Start Date
      bqml_model_info.max_business_date: Training Data Cutoff Date
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
    hidden_pivots: {}
    title_hidden: true
    listen: {}
    row: 0
    col: 18
    width: 6
    height: 3
  - title: Project Anomalies by Week
    name: Project Anomalies by Week
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: looker_line
    fields: [project_detect_anomalies_net_cost.anomaly_count, project_detect_anomalies_net_cost.usage_start_week]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    sorts: [project_detect_anomalies_net_cost.usage_start_week desc]
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x_axis_zoom: true
    y_axis_zoom: true
    show_dropoff: false
    custom_color_enabled: true
    show_single_value_title: true
    single_value_title: Anomaly Rate
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields:
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
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 12
    col: 12
    width: 12
    height: 11
  - title: Anomalies by Project
    name: Anomalies by Project
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: looker_grid
    fields: [project_detect_anomalies_net_cost.project_name, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.avg_time_series_data, project_detect_anomalies_net_cost.avg_absolute_delta,
      project_detect_anomalies_net_cost.anomaly_positive_pct, project_detect_anomalies_net_cost.anomaly_negative_pct]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    sorts: [project_detect_anomalies_net_cost.anomaly_count desc]
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
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: false
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
    column_order: ["$$$_row_numbers_$$$", project_detect_anomalies_net_cost.project_name,
      project_detect_anomalies_net_cost.avg_time_series_data, project_detect_anomalies_net_cost.anomaly_count,
      project_detect_anomalies_net_cost.avg_absolute_delta, estimated_impact, project_detect_anomalies_net_cost.anomaly_positive_pct,
      project_detect_anomalies_net_cost.anomaly_negative_pct]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      project_detect_anomalies_net_cost.avg_absolute_delta: Average Deviation Amount
      project_detect_anomalies_net_cost.anomaly_positive_pct: "% of Overrun Anomalies"
      project_detect_anomalies_net_cost.anomaly_negative_pct: "% of Underrun Anomalies"
      project_detect_anomalies_net_cost.avg_time_series_data: Average Daily Cost
    series_cell_visualizations:
      project_detect_anomalies_net_cost.anomaly_count:
        is_active: false
      estimated_impact:
        is_active: true
        palette:
          palette_id: 6162562e-807f-ab17-1c93-75fb72e341dc
          collection_id: cme-group-primary
          custom_colors:
          - "#d4d410"
          - "#d1a704"
          - "#e38106"
          - "#cc4d19"
          - "#c40d23"
    series_text_format:
      estimated_impact:
        align: right
    conditional_formatting: []
    series_value_format:
      project_detect_anomalies_net_cost.avg_time_series_data: "$#,##0.00"
      project_detect_anomalies_net_cost.avg_absolute_delta: "$#,##0.00"
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
    note_state: collapsed
    note_display: hover
    note_text: Click on Project Name to drill into anomaly overview by project.
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 12
    col: 0
    width: 12
    height: 11
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
  - title: New Tile (Copy)
    name: New Tile (Copy)
    model: cost_anomaly_detection
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.avg_absolute_delta]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    limit: 500
    column_limit: 50
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
    hidden_fields: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 9
    col: 14
    width: 4
    height: 3
  - name: "<h1>Overview of Anomalies</h1>"
    type: text
    title_text: "<h1>Overview of Anomalies</h1>"
    subtitle_text: ''
    body_text: ''
    row: 0
    col: 6
    width: 12
    height: 5
  - title: New Tile (Copy 2)
    name: New Tile (Copy 2)
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
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Total Cost Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
    row: 9
    col: 18
    width: 4
    height: 3
  - name: "<h2>Project Level Anomalies</h2>"
    type: text
    title_text: "<h2>Project Level Anomalies</h2>"
    subtitle_text: ''
    body_text: ''
    row: 5
    col: 1
    width: 22
    height: 4
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
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.set_absolute_percent_threshold
