- dashboard: overview_of_anomaliesto_be_merged
  title: Overview of Anomalies-To Be Merged
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 6a3AswgmwAxgi86bdCOGkq
  elements:
  - title: Possible Project Anomalies
    name: Possible Project Anomalies
    model: ccm_reporting
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
    single_value_title: Possible Anomalies
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
    note_state: collapsed
    note_display: above
    note_text: Total number of possible project based anomalies filtered by anomaly
      direction. Projects that have total spend within upper and lower bound threshold
      are not counted. (Number of projects that had an actual spend outside of upper
      bound or lower bound threshold) x (number of days within the filtered period)
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 4
    width: 5
    height: 3
  - title: Project Anomaly Count
    name: Project Anomaly Count
    model: ccm_reporting
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
    note_state: collapsed
    note_display: hover
    note_text: The number of anomalies that have occurred within the filtered settings
      (anomaly probability threshold, total spend and percent difference thresholds,
      anomaly direction)
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 0
    width: 4
    height: 3
  - title: Project Anomaly Rate
    name: Project Anomaly Rate
    model: ccm_reporting
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
    note_state: collapsed
    note_display: above
    note_text: "(Anomaly Count) / (Possible Anomalies)"
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 9
    width: 5
    height: 3
  - title: Project Anomalies by Week
    name: Project Anomalies by Week
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    type: looker_line
    fields: [project_detect_anomalies_net_cost.anomaly_count, project_detect_anomalies_net_cost.usage_start_week]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    sorts: [project_detect_anomalies_net_cost.usage_start_week desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 11
    col: 12
    width: 12
    height: 11
  - title: Anomalies by Project
    name: Anomalies by Project
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    type: looker_grid
    fields: [project_detect_anomalies_net_cost.project_name, project_detect_anomalies_net_cost.project_id,
      project_detect_anomalies_net_cost.anomaly_count, project_detect_anomalies_net_cost.avg_time_series_data,
      project_detect_anomalies_net_cost.avg_absolute_delta, project_detect_anomalies_net_cost.anomaly_positive_pct,
      project_detect_anomalies_net_cost.anomaly_negative_pct, project_detect_anomalies_net_cost.link_to_anomaly_deep_dive]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
      project_detect_anomalies_net_cost.anomaly_count: ">=1"
    sorts: [estimated_impact desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      description: " (Anomaly Count) x (Average Anomaly Deviation)"
      expression: "${project_detect_anomalies_net_cost.anomaly_count}*${project_detect_anomalies_net_cost.avg_absolute_delta}"
      label: Estimated Impact
      value_format:
      value_format_name: usd_0
      _kind_hint: measure
      table_calculation: estimated_impact
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
      project_detect_anomalies_net_cost.anomaly_negative_pct, project_detect_anomalies_net_cost.link_to_anomaly_deep_dive]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      project_detect_anomalies_net_cost.avg_absolute_delta: Average Anomalous Spend
      project_detect_anomalies_net_cost.anomaly_positive_pct: "% of Overrun Anomalies"
      project_detect_anomalies_net_cost.anomaly_negative_pct: "% of Underrun Anomalies"
      project_detect_anomalies_net_cost.avg_time_series_data: Average Daily Spend
      estimated_impact: Total Potential Impact
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
      project_detect_anomalies_net_cost.avg_time_series_data:
        name: usd
        decimals: '2'
        format_string: "$#,##0.00"
        label: U.S. Dollars (2)
        label_prefix: U.S. Dollars
      project_detect_anomalies_net_cost.avg_absolute_delta:
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
    hidden_fields: [project_detect_anomalies_net_cost.project_id]
    note_state: collapsed
    note_display: hover
    note_text: |-
      Shows anomaly details by project name. Click on project name to drill into anomaly overview by project.
      <li><b>Average Daily Spend</b> - Average daily spend over the filtered time period</li>
      <li><b>Anomaly Count</b> - Total number of anomalies in the given project over the specified time period</li>
      <li><b>Average Anomalous Spend</b> - Average dollar amount that anomalies exceeded or fell short of its upper/lower bounds</li>
      <li><b>Estimated Impact</b> - (Anomaly Count) x (Average Anomaly Deviation)</li>
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 11
    col: 0
    width: 12
    height: 11
  - name: ''
    type: text
    title_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 0
    width: 5
    height: 5
  - title: Project Average Anomaly Deviation Amount
    name: Project Average Anomaly Deviation Amount
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.avg_absolute_delta]
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
    note_state: collapsed
    note_display: above
    note_text: Out of all the anomalies observed, the average of the spend difference
      between each anomaly and its upper or lower bounds. Average dollar amount that
      anomalies exceeded or fell short of its upper/lower bounds
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 14
    width: 5
    height: 3
  - name: "<h1>Overview of Anomalies</h1>"
    type: text
    title_text: "<h1>Overview of Anomalies</h1>"
    body_text: "This dashboard shows anomalies over the filtered time period and gives\
      \ a higher level view into the total anomaly count and the sum of the anomaly\
      \ financial impact. Use this dashboard to look for information around anomalies\
      \ in aggregate.\n\n<b> Dashboard Filters</b>\n<ul>\n<li><b>Usage Date</b> -\
      \ The usage date will default to ‘last 30 days’</li>\n<li><b>Anomaly Probability\
      \ Threshold</b> - Allows you to adjust the confidence level of the anomaly.\
      \ If you want to see spend spikes that the tool is less certain to be anomalies\
      \ you can adjust the value down</li>\n<li><b>Total Spend Difference from Threshold</b>\
      \ - Allows you to adjust how much higher you want the actual spend to be than\
      \ the expected max spend value for that particular day to be considered an anomaly.\
      \ To be considered an anomaly the actual spend has to exceed both the dollar\
      \ and percentage thresholds </li> \n<li><b>Percent Difference from Threshold</b>\
      \ - Allows you to adjust how much higher, in percentage, you want the actual\
      \ spend to be than the expected max spend value for that particular day to be\
      \ considered an anomaly. To be considered an anomaly the actual spend has to\
      \ exceed both the dollar and percentage thresholds</li>\n<li><b>Anomaly Direction</b>\
      \ - Allows you to select whether you want to see overrun anomalies or underrun\
      \ anomalies</li> \n</ul>"
    row: 0
    col: 5
    width: 19
    height: 5
  - title: Project Estimated Anomaly Impact
    name: Project Estimated Anomaly Impact
    model: ccm_reporting
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
    note_state: collapsed
    note_display: above
    note_text: "(Anomaly Count) x (Average Anomaly Deviation). A conservative estimate\
      \ because it assumes that anomalies are resolved in 1 day"
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 19
    width: 5
    height: 3
  - name: "<h2>Project Level Anomalies</h2>"
    type: text
    title_text: "<h2>Project Level Anomalies</h2>"
    body_text: ''
    row: 5
    col: 0
    width: 24
    height: 3
  filters:
  - name: Usage Date
    title: Usage Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: ccm_reporting
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
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
  - name: Minimum Spend Difference from Threshold
    title: Minimum Spend Difference from Threshold
    type: field_filter
    default_value: '1500'
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: ccm_reporting
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
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.set_absolute_percent_threshold
  - name: Anomaly Direction
    title: Anomaly Direction
    type: field_filter
    default_value: "⬆️ Above Upper Threshold,⬇️ Below Lower Threshold"
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.anomaly_direction
