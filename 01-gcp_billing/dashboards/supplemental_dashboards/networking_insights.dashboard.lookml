- dashboard: networking_insights_
  title: 'Networking Insights '
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: WkUeYODlHl12M437SjTVUg
  elements:
  - name: <strong><font color="#000000 " size="6" weight="bold">Networking Insights</font><strong>
    type: text
    title_text: <strong><font color="#000000 " size="6" weight="bold">Networking Insights</font><strong>
    subtitle_text: ''
    body_text: ''
    row: 1
    col: 4
    width: 16
    height: 2
  - name: ''
    type: text
    title_text: ''
    body_text: "<img src='https://cloud.google.com/images/social-icon-google-cloud-1200-630.png'\
      \ width = '100%' >"
    row: 1
    col: 0
    width: 4
    height: 2
  - name: Networking SKUs
    type: text
    title_text: Networking SKUs
    subtitle_text: ''
    body_text: ''
    row: 17
    col: 0
    width: 24
    height: 2
  - title: MoM Networking SKU Costs
    name: MoM Networking SKU Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost,
      gcp_billing_export.sku__description, gcp_billing_export.usage__unit]
    pivots: [gcp_billing_export.usage_start_month]
    fill_fields: [gcp_billing_export.usage_start_month]
    filters:
      gcp_billing_export.service__description: Networking%
      gcp_billing_export.usage_start_month: 4 months ago for 4 months
    sorts: [gcp_billing_export.usage_start_month, gcp_billing_export.total_cost desc
        0]
    limit: 500
    column_limit: 50
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
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    column_order: []
    hidden_fields: []
    y_axes: []
    listen:
      Project ID: gcp_billing_export.project__id
    row: 19
    col: 0
    width: 24
    height: 8
  - title: WoW Networking SKU Costs
    name: WoW Networking SKU Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [gcp_billing_export.usage_start_week, gcp_billing_export.sku__description,
      gcp_billing_export.total_cost, gcp_billing_export.usage__unit]
    pivots: [gcp_billing_export.usage_start_week]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.service__description: Networking
      gcp_billing_export.usage_start_week: 4 weeks ago for 4 weeks
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
      Project ID: gcp_billing_export.project__id
    row: 27
    col: 0
    width: 24
    height: 8
  - title: 'Trending Networking Group Usage '
    name: 'Trending Networking Group Usage '
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_column
    fields: [networking_group, gcp_billing_export.usage_start_week, gcp_billing_export.usage__amount_in_calculated_units]
    pivots: [networking_group]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.service__description: Networking%
    sorts: [networking_group, gcp_billing_export.usage_start_week]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: Percent Change of Previous,
        value_format: !!null '', value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change_of_previous, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {category: dimension,
        description: '', label: Networking Group, value_format: !!null '', value_format_name: !!null '',
        calculation_type: group_by, dimension: networking_group, args: [gcp_billing_export.sku__description,
          [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: Networking
                Cloud Amor, filter: 'Networking Cloud Armor Policy,Networking Cloud
                Armor Requests,Networking Cloud Armor Rule'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Private, filter: 'Networking Private Service Connect
                Consumer Data Processing,Networking Private Service Connect Consumer
                End Point,Networking Private Service Connect Partner Select End Point,Networking
                Private Service Connect Producer Data Processing'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Firewall, filter: 'Firewall Insights evaluation charge
                per rule after initial run,Firewall Insights initial evaluation charge
                per rule'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 'Networking Load Balancer ', filter: "%Networking Cloud Load\
                \ Balancing HTTPS External Regional Forwarding Rule Minimum Uscentral1%,%Networking\
                \ Cloud Load Balancing%"}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Intelligence Center, filter: "%Intelligence%"}], Other],
        _kind_hint: dimension, _type_hint: string}]
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
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    column_order: []
    hidden_fields: []
    listen:
      Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 4
    col: 12
    width: 12
    height: 7
  - title: Trending Networking Group Costs
    name: Trending Networking Group Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_line
    fields: [gcp_billing_export.total_cost, networking_group, gcp_billing_export.usage_start_week]
    pivots: [networking_group]
    fill_fields: [gcp_billing_export.usage_start_week]
    filters:
      gcp_billing_export.service__description: Networking%
    sorts: [networking_group, gcp_billing_export.usage_start_week]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: Percent Change of Previous,
        value_format: !!null '', value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change_of_previous, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {category: dimension,
        description: '', label: Networking Group, value_format: !!null '', value_format_name: !!null '',
        calculation_type: group_by, dimension: networking_group, args: [gcp_billing_export.sku__description,
          [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: Networking
                Cloud Amor, filter: 'Networking Cloud Armor Policy,Networking Cloud
                Armor Requests,Networking Cloud Armor Rule'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Private, filter: 'Networking Private Service Connect
                Consumer Data Processing,Networking Private Service Connect Consumer
                End Point,Networking Private Service Connect Partner Select End Point,Networking
                Private Service Connect Producer Data Processing'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Firewall, filter: 'Firewall Insights evaluation charge
                per rule after initial run,Firewall Insights initial evaluation charge
                per rule'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 'Networking Load Balancer ', filter: "%Networking Cloud Load\
                \ Balancing HTTPS External Regional Forwarding Rule Minimum Uscentral1%,%Networking\
                \ Cloud Load Balancing%"}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Intelligence Center, filter: "%Intelligence%"}], Other],
        _kind_hint: dimension, _type_hint: string}]
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
    defaults_version: 1
    column_order: []
    hidden_fields: []
    listen:
      Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 4
    col: 0
    width: 12
    height: 7
  - name: Trending Networking Groups
    type: text
    title_text: Trending Networking Groups
    subtitle_text: ''
    body_text: ''
    row: 3
    col: 1
    width: 23
    height: 1
  - title: Trending Networking Group Project Costs
    name: Trending Networking Group Project Costs
    model: gcp_billing_block
    explore: gcp_billing_export
    type: looker_grid
    fields: [networking_group, gcp_billing_export.project__name, gcp_billing_export.total_cost,
      gcp_billing_export.total_net_cost]
    filters:
      gcp_billing_export.service__description: Networking%
      gcp_billing_export.usage_start_month: 4 months ago for 4 months
    sorts: [networking_group, gcp_billing_export.total_cost desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, label: Percent Change of Previous,
        value_format: !!null '', value_format_name: percent_0, calculation_type: percent_change_from_previous_column,
        table_calculation: percent_change_of_previous, args: [gcp_billing_export.total_cost],
        _kind_hint: measure, _type_hint: number, is_disabled: true}, {category: dimension,
        description: '', label: Networking Group, value_format: !!null '', value_format_name: !!null '',
        calculation_type: group_by, dimension: networking_group, args: [gcp_billing_export.sku__description,
          [!ruby/hash:ActiveSupport::HashWithIndifferentAccess {label: Networking
                Cloud Amor, filter: 'Networking Cloud Armor Policy,Networking Cloud
                Armor Requests,Networking Cloud Armor Rule'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Private, filter: 'Networking Private Service Connect
                Consumer Data Processing,Networking Private Service Connect Consumer
                End Point,Networking Private Service Connect Partner Select End Point,Networking
                Private Service Connect Producer Data Processing'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: Networking Firewall, filter: 'Firewall Insights evaluation charge
                per rule after initial run,Firewall Insights initial evaluation charge
                per rule'}, !ruby/hash:ActiveSupport::HashWithIndifferentAccess {
              label: 'Networking Load Balancer ', filter: "%Networking Cloud Load\
                \ Balancing HTTPS External Regional Forwarding Rule Minimum Uscentral1%,%Networking\
                \ Cloud Load Balancing%"}], Other], _kind_hint: dimension, _type_hint: string}]
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
    column_order: []
    show_totals: true
    show_row_totals: true
    truncate_header: false
    series_cell_visualizations:
      gcp_billing_export.total_cost:
        is_active: false
      gcp_billing_export.total_net_cost:
        is_active: false
    series_text_format:
      gcp_billing_export.total_net_cost:
        align: center
      gcp_billing_export.total_cost:
        align: center
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
    show_null_points: false
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    defaults_version: 1
    hidden_fields: []
    y_axes: []
    listen:
      Project ID: gcp_billing_export.project__id
      Usage Start Date: gcp_billing_export.usage_start_date
    row: 11
    col: 0
    width: 24
    height: 6
  - type: button
    name: button_691
    rich_content_json: '{"text":"User Guide","description":"User Guide","newTab":true,"alignment":"right","size":"small","style":"FILLED","color":"#5A6874","href":"https://docs.google.com/document/d/1LqB3XHoCSCkIqIm4qyMLmCMetl3bSzTHZZTJC3Nuv1Y/edit?usp=share_link"}'
    row: 0
    col: 0
    width: 24
    height: 1
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
  - name: Usage Start Date
    title: Usage Start Date
    type: field_filter
    default_value: 6 month ago for 6 month
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