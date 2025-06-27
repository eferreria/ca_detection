- dashboard: project_anomaly_deep_diveto_be_merge
  title: Project Anomaly Deep Dive-To be Merge
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: PGB0FOqWmAxapcgmDQYaZj
  elements:
  - title: Actual Spend Service by Date
    name: Actual Spend Service by Date
    model: ccm_reporting
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
    y_axes: [{label: Actual Spend, orientation: left, series: [{axisId: Address Validation
              API - gcp_billing_export.total_cost, id: Address Validation API - gcp_billing_export.total_cost,
            name: Address Validation API}, {axisId: AlloyDB - gcp_billing_export.total_cost,
            id: AlloyDB - gcp_billing_export.total_cost, name: AlloyDB}, {axisId: Anthos
              / GDC-V - gcp_billing_export.total_cost, id: Anthos / GDC-V - gcp_billing_export.total_cost,
            name: Anthos / GDC-V}, {axisId: Apache Airflow™ on Astronomer - gcp_billing_export.total_cost,
            id: Apache Airflow™ on Astronomer - gcp_billing_export.total_cost, name: Apache
              Airflow™ on Astronomer}, {axisId: Apache Kafka® on Confluent Cloud™
              - gcp_billing_export.total_cost, id: Apache Kafka® on Confluent Cloud™
              - gcp_billing_export.total_cost, name: Apache Kafka® on Confluent Cloud™},
          {axisId: App Engine - gcp_billing_export.total_cost, id: App Engine - gcp_billing_export.total_cost,
            name: App Engine}, {axisId: Artifact Registry - gcp_billing_export.total_cost,
            id: Artifact Registry - gcp_billing_export.total_cost, name: Artifact
              Registry}, {axisId: Astronomer - gcp_billing_export.total_cost, id: Astronomer
              - gcp_billing_export.total_cost, name: Astronomer}, {axisId: BigQuery
              - gcp_billing_export.total_cost, id: BigQuery - gcp_billing_export.total_cost,
            name: BigQuery}, {axisId: BigQuery BI Engine - gcp_billing_export.total_cost,
            id: BigQuery BI Engine - gcp_billing_export.total_cost, name: BigQuery
              BI Engine}, {axisId: BigQuery Reservation API - gcp_billing_export.total_cost,
            id: BigQuery Reservation API - gcp_billing_export.total_cost, name: BigQuery
              Reservation API}, {axisId: BigQuery Storage API - gcp_billing_export.total_cost,
            id: BigQuery Storage API - gcp_billing_export.total_cost, name: BigQuery
              Storage API}, {axisId: Chronicle - gcp_billing_export.total_cost, id: Chronicle
              - gcp_billing_export.total_cost, name: Chronicle}, {axisId: CIS (Center
              for Internet Security) CIS Microsoft Windows Server 2019 Benchmark -
              Level 1 - gcp_billing_export.total_cost, id: CIS (Center for Internet
              Security) CIS Microsoft Windows Server 2019 Benchmark - Level 1 - gcp_billing_export.total_cost,
            name: CIS (Center for Internet Security) CIS Microsoft Windows Server
              2019 Benchmark - Level 1}, {axisId: CIS (Center for Internet Security)
              CIS Ubuntu Linux 20.04 LTS Benchmark - Level 1 - gcp_billing_export.total_cost,
            id: CIS (Center for Internet Security) CIS Ubuntu Linux 20.04 LTS Benchmark
              - Level 1 - gcp_billing_export.total_cost, name: CIS (Center for Internet
              Security) CIS Ubuntu Linux 20.04 LTS Benchmark - Level 1}, {axisId: CIS
              Microsoft Windows Server 2019 Benchmark - Level 1 - gcp_billing_export.total_cost,
            id: CIS Microsoft Windows Server 2019 Benchmark - Level 1 - gcp_billing_export.total_cost,
            name: CIS Microsoft Windows Server 2019 Benchmark - Level 1}, {axisId: Cloud
              AutoML - gcp_billing_export.total_cost, id: Cloud AutoML - gcp_billing_export.total_cost,
            name: Cloud AutoML}, {axisId: Cloud Bigtable - gcp_billing_export.total_cost,
            id: Cloud Bigtable - gcp_billing_export.total_cost, name: Cloud Bigtable},
          {axisId: Cloud Build - gcp_billing_export.total_cost, id: Cloud Build -
              gcp_billing_export.total_cost, name: Cloud Build}, {axisId: Cloud Composer
              - gcp_billing_export.total_cost, id: Cloud Composer - gcp_billing_export.total_cost,
            name: Cloud Composer}, {axisId: Cloud Data Fusion - gcp_billing_export.total_cost,
            id: Cloud Data Fusion - gcp_billing_export.total_cost, name: Cloud Data
              Fusion}, {axisId: Cloud Data Loss Prevention - gcp_billing_export.total_cost,
            id: Cloud Data Loss Prevention - gcp_billing_export.total_cost, name: Cloud
              Data Loss Prevention}, {axisId: Cloud Dataflow - gcp_billing_export.total_cost,
            id: Cloud Dataflow - gcp_billing_export.total_cost, name: Cloud Dataflow},
          {axisId: Cloud Dialogflow API - gcp_billing_export.total_cost, id: Cloud
              Dialogflow API - gcp_billing_export.total_cost, name: Cloud Dialogflow
              API}, {axisId: Cloud DNS - gcp_billing_export.total_cost, id: Cloud
              DNS - gcp_billing_export.total_cost, name: Cloud DNS}, {axisId: Cloud
              Document AI API - gcp_billing_export.total_cost, id: Cloud Document
              AI API - gcp_billing_export.total_cost, name: Cloud Document AI API},
          {axisId: Cloud Filestore - gcp_billing_export.total_cost, id: Cloud Filestore
              - gcp_billing_export.total_cost, name: Cloud Filestore}, {axisId: Cloud
              Functions - gcp_billing_export.total_cost, id: Cloud Functions - gcp_billing_export.total_cost,
            name: Cloud Functions}, {axisId: Cloud Key Management Service (KMS) -
              gcp_billing_export.total_cost, id: Cloud Key Management Service (KMS)
              - gcp_billing_export.total_cost, name: Cloud Key Management Service
              (KMS)}, {axisId: Cloud Logging - gcp_billing_export.total_cost, id: Cloud
              Logging - gcp_billing_export.total_cost, name: Cloud Logging}, {axisId: Cloud
              Memorystore for Redis - gcp_billing_export.total_cost, id: Cloud Memorystore
              for Redis - gcp_billing_export.total_cost, name: Cloud Memorystore for
              Redis}, {axisId: Cloud Monitoring - gcp_billing_export.total_cost, id: Cloud
              Monitoring - gcp_billing_export.total_cost, name: Cloud Monitoring},
          {axisId: Cloud Natural Language - gcp_billing_export.total_cost, id: Cloud
              Natural Language - gcp_billing_export.total_cost, name: Cloud Natural
              Language}, {axisId: Cloud Pub/Sub - gcp_billing_export.total_cost, id: Cloud
              Pub/Sub - gcp_billing_export.total_cost, name: Cloud Pub/Sub}, {axisId: Cloud
              Run - gcp_billing_export.total_cost, id: Cloud Run - gcp_billing_export.total_cost,
            name: Cloud Run}, {axisId: Cloud Spanner - gcp_billing_export.total_cost,
            id: Cloud Spanner - gcp_billing_export.total_cost, name: Cloud Spanner},
          {axisId: Cloud Speech API - gcp_billing_export.total_cost, id: Cloud Speech
              API - gcp_billing_export.total_cost, name: Cloud Speech API}, {axisId: Cloud
              SQL - gcp_billing_export.total_cost, id: Cloud SQL - gcp_billing_export.total_cost,
            name: Cloud SQL}, {axisId: Cloud Storage - gcp_billing_export.total_cost,
            id: Cloud Storage - gcp_billing_export.total_cost, name: Cloud Storage},
          {axisId: Cloud Vision API - gcp_billing_export.total_cost, id: Cloud Vision
              API - gcp_billing_export.total_cost, name: Cloud Vision API}, {axisId: Cloud
              Workstations - gcp_billing_export.total_cost, id: Cloud Workstations
              - gcp_billing_export.total_cost, name: Cloud Workstations}, {axisId: Compute
              Engine - gcp_billing_export.total_cost, id: Compute Engine - gcp_billing_export.total_cost,
            name: Compute Engine}, {axisId: Contact Center AI Insights - gcp_billing_export.total_cost,
            id: Contact Center AI Insights - gcp_billing_export.total_cost, name: Contact
              Center AI Insights}, {axisId: Container Registry Vulnerability Scanning
              - gcp_billing_export.total_cost, id: Container Registry Vulnerability
              Scanning - gcp_billing_export.total_cost, name: Container Registry Vulnerability
              Scanning}, {axisId: Data Catalog - gcp_billing_export.total_cost, id: Data
              Catalog - gcp_billing_export.total_cost, name: Data Catalog}, {axisId: Dataplex
              - gcp_billing_export.total_cost, id: Dataplex - gcp_billing_export.total_cost,
            name: Dataplex}, {axisId: Dataproc - gcp_billing_export.total_cost, id: Dataproc
              - gcp_billing_export.total_cost, name: Dataproc}, {axisId: Dataproc
              Metastore - gcp_billing_export.total_cost, id: Dataproc Metastore -
              gcp_billing_export.total_cost, name: Dataproc Metastore}, {axisId: Distance
              Matrix API - gcp_billing_export.total_cost, id: Distance Matrix API
              - gcp_billing_export.total_cost, name: Distance Matrix API}, {axisId: Elastic
              Cloud - gcp_billing_export.total_cost, id: Elastic Cloud - gcp_billing_export.total_cost,
            name: Elastic Cloud}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    note_state: expanded
    note_display: hover
    note_text: This graph shows actual spend breakdown by service type. This graph
      is NOT impacted by the anomaly threshold and direction dashboard filters. Impacted
      by "Service Type" dashboard filter
    listen:
      Usage Date: gcp_billing_export.usage_start_date
      Project Name: gcp_billing_export.project__name
    row: 24
    col: 0
    width: 12
    height: 11
  - title: Possible Anomalies
    name: Possible Anomalies
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    type: single_value
    fields: [project_detect_anomalies_net_cost.row_count]
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
    hidden_fields: []
    hidden_pivots: {}
    note_state: collapsed
    note_display: hover
    note_text: Total number of possible project based anomalies filtered by anomaly
      direction. Projects that have total spend within upper and lower bound threshold
      are not counted. (Number of projects that had an actual spend outside of upper
      bound or lower bound threshold) x (number of days within the filtered period)
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
    row: 8
    col: 4
    width: 5
    height: 4
  - title: Anomaly Count
    name: Anomaly Count
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
    note_state: collapsed
    note_display: hover
    note_text: The number of anomalies that have occurred within the filtered settings
      (anomaly probability threshold, total spend and percent difference thresholds,
      anomaly direction)
    y_axes: []
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 0
    width: 4
    height: 4
  - title: Anomaly Rate
    name: Anomaly Rate
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
    note_state: collapsed
    note_display: hover
    note_text: "(Anomaly Count) / (Possible Anomalies)"
    y_axes: []
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 9
    width: 5
    height: 4
  - title: Actual Spend by Date
    name: Actual Spend by Date
    model: ccm_reporting
    explore: project_explain_forecast_net_cost
    type: looker_line
    fields: [project_detect_anomalies_net_cost.usage_start_date, project_detect_anomalies_net_cost.is_anomaly,
      project_detect_anomalies_net_cost.total_net_cost, project_detect_anomalies_net_cost.anomaly_time_series_data,
      project_detect_anomalies_net_cost.max_upper_bound, project_explain_forecast_net_cost.forecast_period_highlight]
    filters:
      project_detect_anomalies_net_cost.usage_start_week: before today
    sorts: [project_detect_anomalies_net_cost.usage_start_date desc]
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
      project_detect_anomalies_net_cost.max_upper_bound: Expected Max Spend
      project_explain_forecast_net_cost.forecast_period_highlight: Forecast Period
      project_detect_anomalies_net_cost.total_net_cost: Actual Spend
    hidden_pivots: {}
    defaults_version: 1
    hidden_fields: [project_detect_anomalies_net_cost.is_anomaly, project_explain_forecast_net_cost.forecast_period_highlight]
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 12
    col: 0
    width: 24
    height: 12
  - name: ''
    type: text
    title_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 0
    col: 0
    width: 5
    height: 8
  - name: "<h1>Project Level Breakdown</h1>"
    type: text
    title_text: "<h1>Project Level Breakdown</h1>"
    body_text: "This dashboard shows anomaly details over the filtered time period\
      \ for a specific project. Use this dashboard to drill into project cost and\
      \ anomalies by service and SKU.  \n\n<b> Dashboard Filters</b>\n<ul>\n<li><b>Usage\
      \ Date</b> - The usage date will default to ‘last 30 days’</li>\n<li><b>Anomaly\
      \ Probability Threshold</b> - Allows you to adjust the confidence level of the\
      \ anomaly. If you want to see spend spikes that the tool is less certain to\
      \ be anomalies you can adjust the value down</li>\n<li><b>Total Spend Difference\
      \ from Threshold</b> - Allows you to adjust how much higher you want the actual\
      \ spend to be than the expected max spend value for that particular day to be\
      \ considered an anomaly. To be considered an anomaly the actual spend has to\
      \ exceed both the dollar and percentage thresholds </li> \n<li><b>Percent Difference\
      \ from Threshold</b> - Allows you to adjust how much higher, in percentage,\
      \ you want the actual cost to be than the expected max spend value for that\
      \ particular day to be considered an anomaly. To be considered an anomaly the\
      \ actual spend has to exceed both the dollar and percentage thresholds</li>\n\
      <li><b>Anomaly Direction</b> - Allows you to select whether you want to see\
      \ overrun anomalies or underrun anomalies</li> \n<li><b>Service Type</b> - Allows\
      \ you to select which service you want to see. This filter will only affect\
      \ Actual Spend by Service by Date, SKU Breakdown by Date visualizations \n</li>\n\
      <li><b>Minimum SKU Spend Threshold</b> - This filter will only show SKUs for\
      \ which daily spend is above $100 on the day of the anomaly. You can adjust\
      \ that number to include more or less SKUs. This filter will only affect SKU\
      \ Breakdown by Date visualization</li>\n</ul>\n"
    row: 0
    col: 5
    width: 19
    height: 5
  - title: GCP Project Details
    name: GCP Project Details
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    type: looker_grid
    fields: [project_detect_anomalies_net_cost.link_to_gcp_console, project_detect_anomalies_net_cost.project_id,
      project_detect_anomalies_net_cost.project_name]
    sorts: [project_detect_anomalies_net_cost.link_to_gcp_console]
    limit: 500
    column_limit: 50
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
    column_order: [project_detect_anomalies_net_cost.project_name, project_detect_anomalies_net_cost.project_id,
      project_detect_anomalies_net_cost.link_to_gcp_console]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      project_detect_anomalies_net_cost.link_to_gcp_console: "​Link to Project in\
        \ GCP"
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
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
    row: 5
    col: 5
    width: 19
    height: 3
  - title: Estimated Anomaly Impact
    name: Estimated Anomaly Impact
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
    note_display: hover
    note_text: "(Anomaly Count) x (Average Anomaly Deviation). A conservative estimate\
      \ because it assumes that anomalies are resolved in 1 day"
    y_axes: []
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 19
    width: 5
    height: 4
  - title: Average Anomaly Deviation Amount
    name: Average Anomaly Deviation Amount
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
    note_state: collapsed
    note_display: hover
    note_text: Out of all the anomalies observed, the average of the spend difference
      between each anomaly and its upper or lower bounds. Average dollar amount that
      anomalies exceeded or fell short of its upper/lower bounds
    y_axes: []
    listen:
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 8
    col: 14
    width: 5
    height: 4
  - title: Actual Spend by SKU by Date
    name: Actual Spend by SKU by Date
    model: ccm_reporting
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.sku__description, gcp_billing_export.total_cost, gcp_billing_export.usage_start_date]
    pivots: [gcp_billing_export.sku__description]
    sorts: [gcp_billing_export.sku__description, gcp_billing_export.usage_start_date]
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - args:
      - gcp_billing_export.total_cost
      calculation_type: percent_change_from_previous_column
      category: table_calculation
      based_on: gcp_billing_export.total_cost
      label: Percent change from previous column of Billing Total Cost
      source_field: gcp_billing_export.total_cost
      table_calculation: percent_change_from_previous_column_of_billing_total_cost
      value_format:
      value_format_name: percent_0
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
    y_axes: [{label: Actual Spend, orientation: left, series: [{axisId: 'Commitment
              v1: N2D AMD Cpu in Americas for 1 Year - gcp_billing_export.total_cost',
            id: 'Commitment v1: N2D AMD Cpu in Americas for 1 Year - gcp_billing_export.total_cost',
            name: 'Commitment v1: N2D AMD Cpu in Americas for 1 Year'}, {axisId: 'Commitment
              v1: N2D AMD Ram in Americas for 1 Year - gcp_billing_export.total_cost',
            id: 'Commitment v1: N2D AMD Ram in Americas for 1 Year - gcp_billing_export.total_cost',
            name: 'Commitment v1: N2D AMD Ram in Americas for 1 Year'}, {axisId: Licensing
              Fee for Windows Server 2022 Datacenter Edition on VM - gcp_billing_export.total_cost,
            id: Licensing Fee for Windows Server 2022 Datacenter Edition on VM - gcp_billing_export.total_cost,
            name: Licensing Fee for Windows Server 2022 Datacenter Edition on VM},
          {axisId: Memory-optimized Instance Core running in Americas - gcp_billing_export.total_cost,
            id: Memory-optimized Instance Core running in Americas - gcp_billing_export.total_cost,
            name: Memory-optimized Instance Core running in Americas}, {axisId: Memory-optimized
              Instance Ram running in Americas - gcp_billing_export.total_cost, id: Memory-optimized
              Instance Ram running in Americas - gcp_billing_export.total_cost, name: Memory-optimized
              Instance Ram running in Americas}, {axisId: N2D AMD Instance Core running
              in Americas - gcp_billing_export.total_cost, id: N2D AMD Instance Core
              running in Americas - gcp_billing_export.total_cost, name: N2D AMD Instance
              Core running in Americas}, {axisId: N2D AMD Instance Ram running in
              Americas - gcp_billing_export.total_cost, id: N2D AMD Instance Ram running
              in Americas - gcp_billing_export.total_cost, name: N2D AMD Instance
              Ram running in Americas}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels:
      percent_change_from_previous_column_of_billing_total_cost: "% Change from Previous\
        \ Day"
    show_row_numbers: true
    transpose: false
    truncate_text: false
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", gcp_billing_export.service__description,
      gcp_billing_export.sku__description, 2023-07-02_gcp_billing_export.total_cost,
      2023-07-02_percent_change_from_previous_column_of_billing_total_cost, 2023-07-03_gcp_billing_export.total_cost,
      2023-07-03_percent_change_from_previous_column_of_billing_total_cost, 2023-07-04_gcp_billing_export.total_cost,
      2023-07-04_percent_change_from_previous_column_of_billing_total_cost, 2023-07-05_gcp_billing_export.total_cost,
      2023-07-05_percent_change_from_previous_column_of_billing_total_cost, 2023-07-06_gcp_billing_export.total_cost,
      2023-07-06_percent_change_from_previous_column_of_billing_total_cost, 2023-07-07_gcp_billing_export.total_cost,
      2023-07-07_percent_change_from_previous_column_of_billing_total_cost, 2023-07-08_gcp_billing_export.total_cost,
      2023-07-08_percent_change_from_previous_column_of_billing_total_cost, 2023-07-09_gcp_billing_export.total_cost,
      2023-07-09_percent_change_from_previous_column_of_billing_total_cost]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#112B4A",
        font_color: !!null '', color_application: {collection_id: cme-group-primary,
          palette_id: cme-group-primary-sequential-0, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: []}]
    hidden_pivots: {}
    defaults_version: 1
    note_state: expanded
    note_display: hover
    note_text: This graph is impacted by the "Service Type" and "Minimum SKU Spend
      Threshold" dashboard filters that the user has set. Dates and SKUs that do not
      have actual spend that meet the minimum SKU spend threshold will not be shown
      on this graph.  This graph is NOT impacted by the anomaly threshold and direction
      dashboard filters
    listen:
      Usage Date: gcp_billing_export.usage_start_date
      Project Name: gcp_billing_export.project__name
      Minimum SKU Spend Threshold: gcp_billing_export.total_cost
    row: 24
    col: 12
    width: 12
    height: 11
  - title: SKU Breakdown by Date
    name: SKU Breakdown by Date
    model: ccm_reporting
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.service__description, gcp_billing_export.sku__description,
      gcp_billing_export.total_cost, gcp_billing_export.usage_start_date]
    pivots: [gcp_billing_export.usage_start_date]
    sorts: [gcp_billing_export.usage_start_date, gcp_billing_export.total_cost desc
        30]
    limit: 1000
    column_limit: 50
    total: true
    row_total: right
    dynamic_fields:
    - category: table_calculation
      description: The percent change from the previous days' total spend
      label: Percent change from previous column of Billing Total Cost
      value_format:
      value_format_name: percent_0
      calculation_type: percent_change_from_previous_column
      table_calculation: percent_change_from_previous_column_of_billing_total_cost
      args:
      - gcp_billing_export.total_cost
      _kind_hint: measure
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
    column_order: ["$$$_row_numbers_$$$", gcp_billing_export.service__description,
      gcp_billing_export.sku__description, "$$$_row_total_$$$_gcp_billing_export.total_cost",
      2023-10-10_gcp_billing_export.total_cost, 2023-10-10_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-11_gcp_billing_export.total_cost, 2023-10-11_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-12_gcp_billing_export.total_cost, 2023-10-12_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-13_gcp_billing_export.total_cost, 2023-10-13_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-14_gcp_billing_export.total_cost, 2023-10-14_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-15_gcp_billing_export.total_cost, 2023-10-15_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-16_gcp_billing_export.total_cost, 2023-10-16_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-17_gcp_billing_export.total_cost, 2023-10-17_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-18_gcp_billing_export.total_cost, 2023-10-18_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-19_gcp_billing_export.total_cost, 2023-10-19_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-20_gcp_billing_export.total_cost, 2023-10-20_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-21_gcp_billing_export.total_cost, 2023-10-21_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-22_gcp_billing_export.total_cost, 2023-10-22_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-23_gcp_billing_export.total_cost, 2023-10-23_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-24_gcp_billing_export.total_cost, 2023-10-24_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-25_gcp_billing_export.total_cost, 2023-10-25_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-26_gcp_billing_export.total_cost, 2023-10-26_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-27_gcp_billing_export.total_cost, 2023-10-27_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-28_gcp_billing_export.total_cost, 2023-10-28_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-29_gcp_billing_export.total_cost, 2023-10-29_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-30_gcp_billing_export.total_cost, 2023-10-30_percent_change_from_previous_column_of_billing_total_cost,
      2023-10-31_gcp_billing_export.total_cost, 2023-10-31_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-01_gcp_billing_export.total_cost, 2023-11-01_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-02_gcp_billing_export.total_cost, 2023-11-02_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-03_gcp_billing_export.total_cost, 2023-11-03_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-04_gcp_billing_export.total_cost, 2023-11-04_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-05_gcp_billing_export.total_cost, 2023-11-05_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-06_gcp_billing_export.total_cost, 2023-11-06_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-07_gcp_billing_export.total_cost, 2023-11-07_percent_change_from_previous_column_of_billing_total_cost,
      2023-11-08_gcp_billing_export.total_cost, 2023-11-08_percent_change_from_previous_column_of_billing_total_cost]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      percent_change_from_previous_column_of_billing_total_cost: "% Change from Previous\
        \ Day"
      gcp_billing_export.total_cost: Actual Spend
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#112B4A",
        font_color: !!null '', color_application: {collection_id: cme-group-primary,
          palette_id: cme-group-primary-sequential-0, options: {steps: 5, constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [percent_change_from_previous_column_of_billing_total_cost]}]
    hidden_pivots: {}
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
    note_state: collapsed
    note_display: hover
    note_text: "Allows users to understand at a service and SKU level what is driving\
      \ the increase in spend. It also shows the change day over day to help you understand\
      \ when exactly the anomalous spend started. \n\n<li><b>Service Type</b> - The\
      \ Google Cloud service the specific SKU is a part of \n<li><b>SKU Description</b>\
      \ - The description of the individual SKU\n<li><b>Actual Spend</b> - The actual\
      \ spend for the SKU\n<li><b>% Change from Previous Day</b> - The percent change\
      \ from the previous days' actual spend\n"
    y_axes: []
    listen:
      Usage Date: gcp_billing_export.usage_start_date
      Project Name: gcp_billing_export.project__name
      Minimum SKU Spend Threshold: gcp_billing_export.total_cost
    row: 35
    col: 0
    width: 24
    height: 8
  - title: Anomaly Details
    name: Anomaly Details
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    type: looker_grid
    fields: [project_detect_anomalies_net_cost.usage_start_date, project_detect_anomalies_net_cost.anomaly_direction,
      project_detect_anomalies_net_cost.upper_bound, project_detect_anomalies_net_cost.is_anomaly,
      project_detect_anomalies_net_cost.absolute_distance_from_threshold, project_detect_anomalies_net_cost.absolute_percent_from_threshold,
      project_detect_anomalies_net_cost.total_cost, project_detect_anomalies_net_cost.generate_anomaly_insights]
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
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", project_detect_anomalies_net_cost.usage_start_date,
      project_detect_anomalies_net_cost.anomaly_direction, project_detect_anomalies_net_cost.absolute_distance_from_threshold,
      project_detect_anomalies_net_cost.absolute_percent_from_threshold, project_detect_anomalies_net_cost.lower_bound,
      project_detect_anomalies_net_cost.upper_bound, 7_day_average, 30_day_average,
      project_detect_anomalies_net_cost.total_cost]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      project_detect_anomalies_net_cost.absolute_distance_from_threshold: Anomalous
        Spend ($)
      project_detect_anomalies_net_cost.absolute_percent_from_threshold: Anomalous
        Spend (%)
      7_day_average: 7 Day Average Cost
      30_day_average: 30 Day Average Cost
      project_detect_anomalies_net_cost.usage_start_date: Anomaly Date
      project_detect_anomalies_net_cost.upper_bound: Expected Max Spend
      project_detect_anomalies_net_cost.total_cost: Actual Spend
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#112B4A",
        font_color: !!null '', color_application: {collection_id: cme-group-primary,
          palette_id: cme-group-primary-sequential-0}, bold: false, italic: false,
        strikethrough: false, fields: [project_detect_anomalies_net_cost.absolute_distance_from_threshold]}]
    series_value_format:
      project_detect_anomalies_net_cost.upper_bound: "$#,##0.00"
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
    hidden_fields: [project_detect_anomalies_net_cost.link_to_anomaly_deep_dive, 7_day_average,
      30_day_average]
    hidden_points_if_no: [project_detect_anomalies_net_cost.is_anomaly]
    note_state: collapsed
    note_display: hover
    note_text: |-
      <li><b>Anomaly Date</b> - The day in which the anomaly occurred</li>
      <li><b>Anomaly Direction</b> - Whether spend exceeded the predicted threshold because it was too high or too low
      <li><b>Anomalous Spend $</b> - Dollar value that actual spend differed from the upper bound spend (a positive value indicates that actual spend > expected spend)
      <li><b>Anomalous Spend % </b>- Percent that actual spend deviated from expected spend (a positive percentage value indicates that actual spend > expected spend)
      <li><b>Expected Max Spend</b> - The highest dollar value for which the solution would not classify spend as an anomaly
      <li><b>Actual Spend</b> - Spend within that project for the day
    y_axes: []
    listen:
      Usage Date: project_detect_anomalies_net_cost.usage_start_date
      Project Name: project_detect_anomalies_net_cost.project_name
      Anomaly Probability Threshold: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      Percent Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      Anomaly Direction: project_detect_anomalies_net_cost.anomaly_direction
      Minimum Spend Difference from Threshold: project_detect_anomalies_net_cost.set_absolute_delta_threshold
    row: 43
    col: 0
    width: 24
    height: 8
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
  - name: Project Name
    title: Project Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: ccm_reporting
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
    default_value: "⬆️ Above Upper Threshold"
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: ccm_reporting
    explore: project_detect_anomalies_net_cost
    listens_to_filters: []
    field: project_detect_anomalies_net_cost.anomaly_direction
  - name: Minimum SKU Spend Threshold
    title: Minimum SKU Spend Threshold
    type: field_filter
    default_value: ">=100"
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: ccm_reporting
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.total_cost
