- dashboard: cloud_storage_insights
  title: Cloud Storage Insights
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 3T9DjQsGC6HoO6RzZamsSo
  elements:
  - name: <strong><font color="#000000 " size="6" weight="bold">Cloud Storage Cost
      Insights</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">Cloud Storage
      Cost Insights</font><strong>
    body_text: ''
    row: 1
    col: 4
    width: 15
    height: 3
  - name: 'Data Retrieval: Usage and Cost Insights'
    type: text
    title_text: 'Data Retrieval: Usage and Cost Insights'
    subtitle_text: ''
    body_text: 'Because Nearline, Coldline, and Archive Storage are intended for storing
      infrequently accessed data, there are additional costs associated with retrieving
      data or metadata stored in these classes. Make sure to keep <a href="https://cloud.google.com/storage/pricing#archival-pricing"
      target="_blank"> retrieval costs </a> in check and leverage appropriate storage
      classes as per your use-case. Checkout our <a href="https://cloud.google.com/blog/products/storage-data-transfer/best-practices-for-cloud-storage-cost-optimization"
      target="_blank"> Cloud Storage best practice blog </a> for more details. '
    row: 14
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
  - name: 'Data Operations: Usage and Cost Insights'
    type: text
    title_text: 'Data Operations: Usage and Cost Insights'
    subtitle_text: ''
    body_text: <a href="https://cloud.google.com/storage/pricing#operations-pricing"
      target="_blank"> Operation charges</a> apply when you perform operations within
      Cloud Storage. An operation is an action that makes changes to or retrieves
      information about buckets and objects in Cloud Storage. It is good practice
      to be aware of your operations cost and find areas for efficiency where you
      can.
    row: 34
    col: 4
    width: 16
    height: 3
  - name: 'Cloud Storage: Usage and Cost Insights'
    type: text
    title_text: 'Cloud Storage: Usage and Cost Insights'
    subtitle_text: ''
    body_text: "\nSave costs without sacrificing performance by storing data across\
      \ different storage classes <a href=\"https://cloud.google.com/storage/docs/storage-classes#standard\"\
      \ target=\"_blank\"> Standard </a>, \n<a href=\"https://cloud.google.com/storage/docs/storage-classes#nearline\"\
      \ target=\"_blank\"> Nearline </a>, \n<a href=\"https://cloud.google.com/storage/docs/storage-classes#coldline\"\
      \ target=\"_blank\"> Coldline </a> and\n<a href=\"https://cloud.google.com/storage/docs/storage-classes#archive\"\
      \ target=\"_blank\"> Archive </a>. You can start with a class that matches your\
      \ current use, then reconfigure for cost savings. You can use various features\
      \ like Object Lifecycle Management, Versioning, Retention policies, bucket hold\
      \ and several <a href=\"https://cloud.google.com/storage#all-features\" target=\"\
      _blank\"> more </a> feature to optimize your storage for cost and performance.\
      \ Checkout our <a href=\"https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization\"\
      \ target=\"_blank\"> whitepaper </a> for more details. "
    row: 4
    col: 4
    width: 16
    height: 3
  - name: 'Early Deletes: Usage and C​ost Insights'
    type: text
    title_text: 'Early Deletes: Usage and C​ost Insights'
    subtitle_text: ''
    body_text: 'Because Nearline, Coldline, and Archive Storage are intended for storing
      infrequently accessed data, there are additional costs associated with the minimum
      storage durations that you are charged for. You can delete the file before it
      has been stored for this duration, but at the time of deletion you are charged
      as if the file was stored for the minimum duration. These are billed as <a href="https://cloud.google.com/storage/pricing#archival-pricing"
      target="_blank"> early delete </a>, make sure to keep these in check. Checkout
      our <a href="https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization"
      target="_blank"> whitepaper </a> for more details.  '
    row: 24
    col: 4
    width: 16
    height: 3
  - name: 'Network: Usage and Cost Insights'
    type: text
    title_text: 'Network: Usage and Cost Insights'
    subtitle_text: ''
    body_text: '​<a href="https://cloud.google.com/storage/pricing#network-pricing"
      target="_blank"> Network usage </a> charges apply when object data or object
      metadata is read from your Cloud Storage buckets. Network usage is divided into
      Network egress, general network usage and other speciality network services
      that you are using. Understanding where you costs are concentrated can help
      you optimize network costs and performance. For more on networking, checkout
      our <a href="https://cloud.google.com/blog/topics/cost-management/principles-of-cloud-cost-optimization"
      target="_blank"> whitepaper </a> for more details. '
    row: 44
    col: 4
    width: 16
    height: 3
  - title: Data Storage Units
    name: Data Storage Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Storage
      pricing.pricing_type: -"_PARSE_ERROR"
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
    stacking: ''
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
    row: 7
    col: 0
    width: 12
    height: 7
  - title: Data Retrieval Units
    name: Data Retrieval Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      pricing.pricing_type]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Retrieval
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
    stacking: ''
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
    row: 17
    col: 0
    width: 12
    height: 7
  - title: Early Deletes Units
    name: Early Deletes Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Early Deletes
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
    stacking: ''
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
    row: 27
    col: 0
    width: 12
    height: 7
  - title: Operations Units
    name: Operations Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Operations
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
    stacking: ''
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
    row: 37
    col: 0
    width: 12
    height: 7
  - title: Network Units
    name: Network Units
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Network
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
    stacking: ''
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
    row: 47
    col: 0
    width: 12
    height: 8
  - title: Data Retrieval Cost
    name: Data Retrieval Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Retrieval
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
    show_null_points: true
    interpolation: linear
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
    row: 17
    col: 12
    width: 12
    height: 7
  - title: Data Storage Cost
    name: Data Storage Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Data Storage
      pricing.pricing_type: -"_PARSE_ERROR"
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
    show_null_points: true
    interpolation: linear
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
    row: 7
    col: 12
    width: 12
    height: 7
  - title: Early Deletes Cost
    name: Early Deletes Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.total_cost]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Early Deletes
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
    show_null_points: true
    interpolation: linear
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
    row: 27
    col: 12
    width: 12
    height: 7
  - title: Network Cost
    name: Network Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Network
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
    show_null_points: true
    interpolation: linear
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
  - title: Operations Cost
    name: Operations Cost
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [pricing.pricing_type, gcp_billing_export.usage_start_month, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [pricing.pricing_type]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Cloud Storage
      pricing.pricing_category: Operations
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
    show_null_points: true
    interpolation: linear
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
    row: 37
    col: 12
    width: 12
    height: 7
  - name: WoW Cloud Storage SKU Costs
    type: text
    title_text: WoW Cloud Storage SKU Costs
    subtitle_text: ''
    body_text: ''
    row: 62
    col: 0
    width: 24
    height: 2
  - name: MoM Cloud Storage SKU Costs
    type: text
    title_text: MoM Cloud Storage SKU Costs
    subtitle_text: ''
    body_text: ''
    row: 55
    col: 0
    width: 24
    height: 2
  - title: ''
    name: " (2)"
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.sku__description,
      gcp_billing_export.total_cost]
    pivots: [gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.usage_start_month: 4 months ago for 4 months
      gcp_billing_export.service__description: Cloud Storage
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
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 57
    col: 0
    width: 24
    height: 5
  - title: ''
    name: " (3)"
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export.sku__description,
      gcp_billing_export.total_cost]
    pivots: [gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.usage_start_week: 4 weeks ago for 4 weeks
      gcp_billing_export.service__description: Cloud Storage
    sorts: [gcp_billing_export.usage_start_week, gcp_billing_export.total_cost desc
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
    note_state: collapsed
    note_display: below
    note_text: 'Note: Data is displayed for the past complete week since this week''s
      data is not finalized.'
    listen:
      GCP Project ID: gcp_billing_export.project__id
    row: 64
    col: 0
    width: 24
    height: 6
  - type: button
    name: button_685
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
