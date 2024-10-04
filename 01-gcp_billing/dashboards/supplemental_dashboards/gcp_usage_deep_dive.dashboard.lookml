- dashboard: gcp_usage_deep_dive
  title: GCP Usage Deep Dive
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - title: YTD Costs
    name: YTD Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.usage_start_year, gcp_billing_export.total_net_cost]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.usage_start_date: 2 years
    sorts: [gcp_billing_export.usage_start_year desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${gcp_billing_export.total_net_cost}-offset(${gcp_billing_export.total_net_cost},1))\n\
          /if(${gcp_billing_export.total_net_cost}=0,null,${gcp_billing_export.total_net_cost})",
        label: Change, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#006db6"
    value_format: "$#,##0"
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: All costs for this year up until today's date compared with last year's
      costs, from the beginning of last year until the same day last year
    y_axes: []
    hidden_pivots: {}
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 3
    col: 0
    width: 8
    height: 3
  - title: QTD Costs
    name: QTD Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_quarter]
    fill_fields: [gcp_billing_export.usage_start_quarter]
    filters:
      gcp_billing_export.usage_start_date: 2 quarters
    sorts: [gcp_billing_export.usage_start_quarter desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${gcp_billing_export.total_net_cost}-offset(${gcp_billing_export.total_net_cost},1))\n\
          /if(${gcp_billing_export.total_net_cost}=0,null,${gcp_billing_export.total_net_cost})",
        label: Change, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#006db6"
    value_format: "$#,##0"
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: All costs for this quarter up until today's date compared with last
      quarter's costs, from the beginning of last quarter until the same day last
      quarter
    y_axes: []
    hidden_pivots: {}
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 3
    col: 8
    width: 8
    height: 3
  - title: MTD Costs
    name: MTD Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: single_value
    fields: [gcp_billing_export.total_net_cost, gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_date: 2 months
    sorts: [gcp_billing_export.usage_start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "(${gcp_billing_export.total_net_cost}-offset(${gcp_billing_export.total_net_cost},1))\n\
          /if(${gcp_billing_export.total_net_cost}=0,null,${gcp_billing_export.total_net_cost})",
        label: Change, value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        table_calculation: change, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#006db6"
    value_format: "$#,##0"
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    note_state: collapsed
    note_display: hover
    note_text: All costs for this month up until today's date compared with last month's
      costs, from the beginning of last month until the same day month year
    y_axes: []
    hidden_pivots: {}
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 3
    col: 16
    width: 8
    height: 3
  - title: YTD Cost Trends
    name: YTD Cost Trends
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.usage_start_month_name,
      gcp_billing_export.usage_start_year, gcp_billing_export.currency]
    pivots: [gcp_billing_export.usage_start_year]
    fill_fields: [gcp_billing_export.usage_start_year]
    filters:
      gcp_billing_export.usage_start_year: 3 years
    sorts: [gcp_billing_export.usage_start_year 0, gcp_billing_export.usage_start_month_name]
    limit: 500
    dynamic_fields: [{table_calculation: mom_change, label: MoM Change $, expression: "${gcp_billing_export.total_cost}-offset(${gcp_billing_export.total_cost},-1)",
        value_format: !!null '', value_format_name: usd, _kind_hint: measure, _type_hint: number}]
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
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: 2021 - gcp_billing_export.total_cost, name: 2021 - Billing Total Cost},
          {axisId: mom_change, id: 2021 - mom_change, name: 2021 - MoM Change $},
          {axisId: gcp_billing_export.total_cost, id: 2022 - gcp_billing_export.total_cost,
            name: 2022 - Billing Total Cost}, {axisId: mom_change, id: 2022 - mom_change,
            name: 2022 - MoM Change $}, {axisId: gcp_billing_export.total_cost, id: 2023
              - gcp_billing_export.total_cost, name: 2023 - Billing Total Cost}, {
            axisId: mom_change, id: 2023 - mom_change, name: 2023 - MoM Change $}],
        showLabels: false, showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: [2019 - gcp_billing_export.total_cost, 2019 - mom_change]
    series_types:
      2019 - gcp_billing_export.total_cost: column
      2020 - gcp_billing_export.total_cost: column
      2021 - gcp_billing_export.total_cost: column
    series_colors:
      2021 - mom_change: "#EA4335"
      2019 - gcp_billing_export.total_cost: "#E57947"
      2019 - mom_change: "#BDC1C6"
      2021 - gcp_billing_export.total_cost: "#4285F4"
    series_labels: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
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
    hidden_fields: [gcp_billing_export.currency]
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 6
    col: 8
    width: 16
    height: 8
  - title: YTD Cost by Service
    name: YTD Cost by Service
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_pie
    fields: [gcp_billing_export.total_cost, gcp_billing_export.service__description]
    filters:
      gcp_billing_export.period: Year
      gcp_billing_export.period_selected: This Year to Date
      gcp_billing_export.total_cost: ">25"
    sorts: [gcp_billing_export.total_cost desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${gcp_billing_export.total_cost}-offset(${gcp_billing_export.total_cost},1))\n\
          /if(${gcp_billing_export.total_cost}=0,null,${gcp_billing_export.total_cost})",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: []
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 6
    col: 0
    width: 8
    height: 8
  - name: ''
    type: text
    title_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 1
    col: 0
    width: 3
    height: 2
  - name: <strong><font color="#000000 " size="6" weight="bold">GCP Usage Deep Dive</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">GCP Usage Deep
      Dive</font><strong>
    subtitle_text: "<i>Costs by Billing & Services for Specified Project</i>"
    body_text: ''
    row: 1
    col: 3
    width: 18
    height: 2
  - title: Credit Breakdown
    name: Credit Breakdown
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_area
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export__credits.total_amount]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 12 months
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: cme-colors
      palette_id: cme-colors-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export__credits.total_amount,
            id: gcp_billing_export__credits.total_amount, name: Credits}], showLabels: true,
        showValues: true, valueFormat: '[>=1000000]$0.00,,"M";$0,"K"', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_label: Total Credit Amount
    hide_legend: false
    series_types: {}
    series_colors:
      gcp_billing_export__credits.total_amount: "#3CC8FF"
    series_labels:
      gcp_billing_export__credits.total_amount: Credits
      gcp_billing_export.total_cost: Gross Cost
      gcp_billing_export.total_net_cost: Net Cost
    ordering: none
    show_null_labels: false
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
    hidden_fields: []
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 14
    col: 0
    width: 24
    height: 6
  - type: button
    name: button_687
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 0
    width: 24
    height: 1
  - title: Monthly Cost by Service
    name: Monthly Cost by Service
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, gcp_billing_export.service__description,
      gcp_billing_export.usage_start_month]
    pivots: [gcp_billing_export.service__description]
    filters:
      gcp_billing_export.total_cost: ">25"
      gcp_billing_export.usage_start_month: 12 months ago for 12 months
    sorts: [gcp_billing_export.service__description, gcp_billing_export.total_cost
        desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: change, label: Change, expression: "(${gcp_billing_export.total_cost}-offset(${gcp_billing_export.total_cost},1))\n\
          /if(${gcp_billing_export.total_cost}=0,null,${gcp_billing_export.total_cost})",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: measure,
        _type_hint: number, is_disabled: true}]
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
    legend_position: left
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: gcp_billing_export.total_cost,
            id: AlloyDB - gcp_billing_export.total_cost, name: AlloyDB}, {axisId: gcp_billing_export.total_cost,
            id: Anthos - gcp_billing_export.total_cost, name: Anthos}, {axisId: gcp_billing_export.total_cost,
            id: Anthos / GDC-V - gcp_billing_export.total_cost, name: Anthos / GDC-V},
          {axisId: gcp_billing_export.total_cost, id: Anthos Config Management - gcp_billing_export.total_cost,
            name: Anthos Config Management}, {axisId: gcp_billing_export.total_cost,
            id: Artifact Registry - gcp_billing_export.total_cost, name: Artifact
              Registry}, {axisId: gcp_billing_export.total_cost, id: BigQuery - gcp_billing_export.total_cost,
            name: BigQuery}, {axisId: gcp_billing_export.total_cost, id: BigQuery
              Reservation API - gcp_billing_export.total_cost, name: BigQuery Reservation
              API}, {axisId: gcp_billing_export.total_cost, id: BigQuery Storage API
              - gcp_billing_export.total_cost, name: BigQuery Storage API}, {axisId: gcp_billing_export.total_cost,
            id: Certificate Authority Service - gcp_billing_export.total_cost, name: Certificate
              Authority Service}, {axisId: gcp_billing_export.total_cost, id: Citrix
              Virtual Apps and Desktops Service for Google Cloud - gcp_billing_export.total_cost,
            name: Citrix Virtual Apps and Desktops Service for Google Cloud}, {axisId: gcp_billing_export.total_cost,
            id: Cloud Bigtable - gcp_billing_export.total_cost, name: Cloud Bigtable},
          {axisId: gcp_billing_export.total_cost, id: Cloud Build - gcp_billing_export.total_cost,
            name: Cloud Build}, {axisId: gcp_billing_export.total_cost, id: Cloud
              Data Loss Prevention - gcp_billing_export.total_cost, name: Cloud Data
              Loss Prevention}, {axisId: gcp_billing_export.total_cost, id: Cloud
              Dataflow - gcp_billing_export.total_cost, name: Cloud Dataflow}, {axisId: gcp_billing_export.total_cost,
            id: Cloud Filestore - gcp_billing_export.total_cost, name: Cloud Filestore},
          {axisId: gcp_billing_export.total_cost, id: Cloud Key Management Service
              (KMS) - gcp_billing_export.total_cost, name: Cloud Key Management Service
              (KMS)}, {axisId: gcp_billing_export.total_cost, id: Cloud Logging -
              gcp_billing_export.total_cost, name: Cloud Logging}, {axisId: gcp_billing_export.total_cost,
            id: Cloud Machine Learning Engine - gcp_billing_export.total_cost, name: Cloud
              Machine Learning Engine}, {axisId: gcp_billing_export.total_cost, id: Cloud
              Memorystore for Redis - gcp_billing_export.total_cost, name: Cloud Memorystore
              for Redis}, {axisId: gcp_billing_export.total_cost, id: Cloud Pub/Sub
              - gcp_billing_export.total_cost, name: Cloud Pub/Sub}, {axisId: gcp_billing_export.total_cost,
            id: Cloud Scheduler - gcp_billing_export.total_cost, name: Cloud Scheduler},
          {axisId: gcp_billing_export.total_cost, id: Cloud Spanner - gcp_billing_export.total_cost,
            name: Cloud Spanner}, {axisId: gcp_billing_export.total_cost, id: Cloud
              SQL - gcp_billing_export.total_cost, name: Cloud SQL}, {axisId: gcp_billing_export.total_cost,
            id: Cloud Storage - gcp_billing_export.total_cost, name: Cloud Storage},
          {axisId: gcp_billing_export.total_cost, id: Compute Engine - gcp_billing_export.total_cost,
            name: Compute Engine}, {axisId: gcp_billing_export.total_cost, id: Container
              Registry Vulnerability Scanning - gcp_billing_export.total_cost, name: Container
              Registry Vulnerability Scanning}, {axisId: gcp_billing_export.total_cost,
            id: Invoice - gcp_billing_export.total_cost, name: Invoice}, {axisId: gcp_billing_export.total_cost,
            id: Kubernetes Engine - gcp_billing_export.total_cost, name: Kubernetes
              Engine}, {axisId: gcp_billing_export.total_cost, id: Looker - gcp_billing_export.total_cost,
            name: Looker}, {axisId: gcp_billing_export.total_cost, id: Managed Service
              for Microsoft Active Directory - gcp_billing_export.total_cost, name: Managed
              Service for Microsoft Active Directory}, {axisId: gcp_billing_export.total_cost,
            id: Networking - gcp_billing_export.total_cost, name: Networking}, {axisId: gcp_billing_export.total_cost,
            id: Notebooks - gcp_billing_export.total_cost, name: Notebooks}, {axisId: gcp_billing_export.total_cost,
            id: On-Demand Scanning - gcp_billing_export.total_cost, name: On-Demand
              Scanning}, {axisId: gcp_billing_export.total_cost, id: 'Palo Alto Networks,
              Inc. Strata - gcp_billing_export.total_cost', name: 'Palo Alto Networks,
              Inc. Strata'}, {axisId: gcp_billing_export.total_cost, id: Pub/Sub Lite
              - gcp_billing_export.total_cost, name: Pub/Sub Lite}, {axisId: gcp_billing_export.total_cost,
            id: Security Command Center - gcp_billing_export.total_cost, name: Security
              Command Center}, {axisId: gcp_billing_export.total_cost, id: Stackdriver
              Monitoring - gcp_billing_export.total_cost, name: Stackdriver Monitoring},
          {axisId: gcp_billing_export.total_cost, id: Support - gcp_billing_export.total_cost,
            name: Support}, {axisId: gcp_billing_export.total_cost, id: Vertex AI
              - gcp_billing_export.total_cost, name: Vertex AI}, {axisId: gcp_billing_export.total_cost,
            id: VMware Engine - gcp_billing_export.total_cost, name: VMware Engine}],
        showLabels: true, showValues: true, valueFormat: '[>=1000000]$0,,"M";$0,"K"',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    listen:
      Project ID: gcp_billing_export.project__id
      Service Type: gcp_billing_export.service__description
      Is Marketplace Purchase? (Yes / No): pricing_mapping.marketplace_purchase
    row: 20
    col: 0
    width: 24
    height: 7
  filters:
  - name: Project ID
    title: Project ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.project__id
  - name: Service Type
    title: Service Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
      options: []
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: gcp_billing_export.service__description
  - name: Is Marketplace Purchase? (Yes / No)
    title: Is Marketplace Purchase? (Yes / No)
    type: field_filter
    default_value: Yes,No
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: gcp_billing_block
    explore: gcp_billing_export
    listens_to_filters: []
    field: pricing_mapping.marketplace_purchase