- dashboard: compute_engine_insights
  title: Compute Engine Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  elements:
  - name: 'Cores: Usage and Cost Insights'
    type: text
    title_text: 'Cores: Usage and Cost Insights'
    body_text: 'The graphs below show your core usage and spend for Compute Engine,
      Dataproc and Google Kubernetes Engine, which are covered by [commitments](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts).
      Workloads that are stable and predictable, in terms of resource need, can greatly
      benefit from commitments. Checkout the [Committed Use Discount recommendations](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts#recommendations)
      to optimize your cost without impacting performance. Checkout [this whitepaper](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)
      for more best practices.  '
    row: 4
    col: 4
    width: 16
    height: 3
  - name: <strong><font color="#000000 " size="6" weight="bold">Compute Engine Cost
      Insights</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">Compute Engine
      Cost Insights</font><strong>
    body_text: ''
    row: 1
    col: 4
    width: 16
    height: 3
  - name: ''
    type: text
    title_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 1
    col: 0
    width: 4
    height: 3
  - name: "​Memory Instance Generation: Usage and Cost Insights"
    type: text
    title_text: "​Memory Instance Generation: Usage and Cost Insights"
    body_text: "​​The graphs below show the instance generation and resource types\
      \ you have been using. Compute Engine offers pre-defined and custom machine\
      \ types to best handle your workloads. Leverage [newer generation](https://cloud.google.com/compute/docs/machine-types#recommendations_for_machine_types)\
      \ instances and [Pre-emptible VMs](https://cloud.google.com/compute/docs/instances/preemptible)\
      \ where possible, as that can result in significant savings. Checkout the [whitepaper\
      \ ](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)for\
      \ more best practices.  "
    row: 34
    col: 4
    width: 16
    height: 3
  - name: 'Memory: Usage and Cost Insights'
    type: text
    title_text: 'Memory: Usage and Cost Insights'
    body_text: "​The graphs below show your memory usage and spend for Compute Engine,\
      \ Dataproc and Google Kubernetes Engine that are covered by [commitments](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts).\
      \ Workloads that are stable and predictable in terms of resource need can greatly\
      \ benefit from commitments. Checkout the [Committed Use Discount](https://cloud.google.com/compute/docs/instances/signing-up-committed-use-discounts#recommendations)\
      \ recommendations to optimize your cost without impacting performance. Checkout\
      \ this [whitepaper](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)\
      \ for more best practices.  "
    row: 24
    col: 4
    width: 16
    height: 3
  - name: 'Cores Instance Generation: Usage and Cost Insights'
    type: text
    title_text: 'Cores Instance Generation: Usage and Cost Insights'
    body_text: "​The graphs below show the instance generation and resource types\
      \ you have been using. Compute Engine offers pre-defined and custom machine\
      \ types to best handle your workloads. Leverage [newer generation](https://cloud.google.com/compute/docs/machine-types#recommendations_for_machine_types)\
      \ instances and [Pre-emptible VMs](https://cloud.google.com/compute/docs/instances/preemptible)\
      \ where possible, as that can result in significant savings. Checkout the [whitepaper\
      \ ](https://cloud.google.com/blog/products/compute/5-best-practices-compute-engine-cost-optimization)for\
      \ more best practices.  "
    row: 14
    col: 4
    width: 16
    height: 3
  - name: "​​Persistent Disk: Usage and Cost Insights"
    type: text
    title_text: "​​Persistent Disk: Usage and Cost Insights"
    body_text: "​[Persistent disks](https://cloud.google.com/compute/docs/disks) are\
      \ durable network storage devices that your instances can access like physical\
      \ disks in a desktop or a server. In the graphs below, you can see cost and\
      \ usage across Standard / Balanced / SSD disks along with snapshot usage. You\
      \ can improve cost-performance by doing the following: Delete/snapshot [Idle\
      \ disks](https://cloud.google.com/recommender/docs/recommenders), leverage appropriate\
      \ [disk type](https://cloud.google.com/compute/docs/disks#disk-types), [snapshot\
      \ retention lifecycle,](https://cloud.google.com/compute/docs/disks/scheduled-snapshots)\
      \ use other options like [Cloud Storage](https://cloud.google.com/compute/docs/disks/gcs-buckets#mount_bucket)\
      \ for Media and logs, etc. "
    row: 44
    col: 4
    width: 16
    height: 3
  - title: Cores Usage Amount by Type
    name: Cores Usage Amount by Type
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_usage_type]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: Cores%
    sorts: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type]
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
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
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
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 7
    col: 0
    width: 12
    height: 7
  - title: Cores Cost by Usage Type
    name: Cores Cost by Usage Type
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: Cores%
    sorts: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type]
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
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
    show_null_points: false
    interpolation: linear
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
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 7
    col: 12
    width: 12
    height: 7
  - title: Core Instance Generation
    name: Core Instance Generation
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [pricing.pricing_type, pricing.pricing_sub_type, pricing.pricing_usage_type,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: Cores%
    sorts: [pricing.pricing_type]
    limit: 500
    column_limit: 50
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 17
    col: 0
    width: 24
    height: 7
  - title: Cores Cost by Usage Type (Copy)
    name: Cores Cost by Usage Type (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: ''
    sorts: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type]
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
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
    show_null_points: false
    interpolation: linear
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
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 27
    col: 12
    width: 12
    height: 7
  - title: Cores Usage Amount by Type (Copy)
    name: Cores Usage Amount by Type (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage__amount_in_calculated_units, gcp_billing_export.usage_start_month,
      pricing.pricing_usage_type]
    pivots: [pricing.pricing_usage_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: RAM%
    sorts: [gcp_billing_export.usage_start_month, pricing.pricing_usage_type]
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
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
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
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 27
    col: 0
    width: 12
    height: 7
  - title: Core Instance Generation (Copy)
    name: Core Instance Generation (Copy)
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [pricing.pricing_type, pricing.pricing_sub_type, pricing.pricing_usage_type,
      gcp_billing_export.total_cost]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: VM
      pricing.pricing_type: RAM%
    sorts: [pricing.pricing_type]
    limit: 500
    column_limit: 50
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 37
    col: 0
    width: 24
    height: 7
  - title: Persisten Disk Usage Last 7 Days
    name: Persisten Disk Usage Last 7 Days
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_date, pricing.pricing_type, gcp_billing_export.usage__calculated_unit,
      gcp_billing_export.usage__amount_in_calculated_units]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Persistent Disk
    sorts: [gcp_billing_export.usage_start_date desc]
    limit: 500
    column_limit: 50
    total: true
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
    series_types: {}
    hidden_fields: []
    y_axes: []
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 47
    col: 0
    width: 12
    height: 8
  - title: Persistent Disk Usage
    name: Persistent Disk Usage
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Persistent Disk
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month]
    limit: 500
    column_limit: 50
    total: true
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
    defaults_version: 1
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
    hidden_fields: []
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 47
    col: 12
    width: 12
    height: 8
  - title: Network Costs
    name: Network Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Network
      pricing.pricing_type: Egress%,Ingress%
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month]
    limit: 500
    column_limit: 50
    total: true
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
    defaults_version: 1
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
    hidden_fields: []
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 59
    col: 12
    width: 12
    height: 8
  - title: Network Calculated Units
    name: Network Calculated Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      pricing.pricing_category: Network
      pricing.pricing_type: Egress%,Ingress%
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month]
    limit: 500
    column_limit: 50
    total: true
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: ordinal
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_types: {}
    x_axis_label_rotation: 330
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
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
    hidden_fields: []
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 59
    col: 0
    width: 12
    height: 8
  - name: 'Network: Usage and Cost Insights'
    type: text
    title_text: 'Network: Usage and Cost Insights'
    body_text: The graphs below show your networking usage and cost on Google Cloud.
      For full details on pricing, follow our [public documentation.](https://cloud.google.com/vpc/network-pricing)
      There are various ways you can optimize - including selecting the right Network
      Service Tier, customizing logs and more. Checkout our [Networking best practices
      blog](https://cloud.google.com/blog/products/networking/networking-cost-optimization-best-practices)
      and this [whitepaper](https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization)
      for more details.
    row: 55
    col: 4
    width: 15
    height: 4
  - name: MoM Compute Engine SKU costs
    type: text
    title_text: MoM Compute Engine SKU costs
    subtitle_text: ''
    body_text: ''
    row: 67
    col: 0
    width: 24
    height: 2
  - name: WoW Compute Engine SKU Costs
    type: text
    title_text: WoW Compute Engine SKU Costs
    subtitle_text: ''
    body_text: ''
    row: 76
    col: 0
    width: 24
    height: 2
  - title: ''
    name: " (2)"
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.sku__description]
    pivots: [gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 4 months ago for 4 months
      gcp_billing_export.service__description: Compute Engine
    sorts: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost desc
        0]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent Change of Previous,
        value_format: !!null '', value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change_of_previous, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number}]
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
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
    series_text_format:
      percent_change_of_previous:
        align: center
      gcp_billing_export.total_cost:
        align: center
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
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 69
    col: 0
    width: 24
    height: 7
  - title: ''
    name: " (3)"
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export.service__description,
      gcp_billing_export.total_cost, gcp_billing_export.sku__description]
    pivots: [gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 4 weeks ago for 4 weeks
      gcp_billing_export.service__description: Compute Engine
    sorts: [gcp_billing_export.usage_start_week, gcp_billing_export.service__description]
    limit: 500
    dynamic_fields: [{category: table_calculation, label: Percent Change of Previous,
        value_format: !!null '', value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change_of_previous, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number}]
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
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
    series_text_format:
      gcp_billing_export.total_cost:
        align: center
      percent_change_of_previous:
        align: center
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
    hidden_fields: [gcp_billing_export.service__description]
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: 'Note: Data is displayed for the past complete week since this week''s
      data is not finalized.'
    title_hidden: true
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 78
    col: 0
    width: 24
    height: 7
  - title: Regional Usage
    name: Regional Usage
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.location__region]
    pivots: [gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Compute Engine
      gcp_billing_export.usage_start_month: 3 months ago for 3 months
      pricing.pricing_type: "-NULL,-%ERROR%"
    sorts: [pricing.pricing_type, gcp_billing_export.usage_start_month]
    limit: 500
    column_limit: 50
    total: true
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
    stacking: normal
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
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 85
    col: 0
    width: 24
    height: 7
  - type: button
    name: button_686
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
