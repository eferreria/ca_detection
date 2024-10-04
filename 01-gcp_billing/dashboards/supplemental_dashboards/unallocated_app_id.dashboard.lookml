# - dashboard: unallocated_label
#   title: Unallocated Label
#   layout: newspaper
#   preferred_viewer: dashboards-next
#   description: ''
#   preferred_slug: Yo10dSeqkeL3tpC81ONvAY
#   elements:
#   - title: Unallocated Label
#     name: Unallocated Label
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     type: looker_grid
#     fields: [gcp_billing_export.project__name, gcp_billing_export.service__description,
#       gcp_billing_export.sku__description, gcp_billing_export.project_id, gcp_billing_export.total_net_cost]
#     filters:
#       pricing_mapping.marketplace_purchase: 'No'
#       eligible_labels.labeling_supported: 'Yes'
#     sorts: [gcp_billing_export.total_net_cost desc 0]
#     limit: 1000
#     column_limit: 50
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     show_sql_query_menu_options: false
#     show_totals: true
#     show_row_totals: true
#     truncate_header: false
#     series_cell_visualizations:
#       gcp_billing_export.total_cost:
#         is_active: true
#     limit_displayed_rows_values:
#       show_hide: hide
#       first_last: first
#       num_rows: 0
#     x_axis_gridlines: false
#     y_axis_gridlines: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: false
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     legend_position: center
#     point_style: none
#     show_value_labels: true
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: true
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     series_colors:
#       total_cost: "#112B4A"
#       gcp_billing_export.total_cost: "#3CC8FF"
#     label_color: []
#     up_color: "#34A853"
#     down_color: false
#     total_color: "#9AA0A6"
#     defaults_version: 1
#     y_axes: []
#     column_order: ["$$$_row_numbers_$$$", gcp_billing_export.project__name, gcp_billing_export.service__description,
#       gcp_billing_export.sku__description, gcp_billing_export.project_id, gcp_billing_export.total_cost]
#     hidden_pivots: {}
#     listen:
#       Usage Start Date: gcp_billing_export.usage_start_date
#       Project ID: gcp_billing_export.project__id
#       Project Name: gcp_billing_export.project__name
#     row: 6
#     col: 0
#     width: 24
#     height: 12
#   - title: Labeled vs Unlabeled Resources (as % of Spend)
#     name: Labeled vs Unlabeled Resources (as % of Spend)
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     type: looker_pie
#     fields: [gcp_billing_export.total_net_cost, gcp_billing_export.kubernetes_cluser_name]
#     filters:
#       pricing_mapping.marketplace_purchase: 'No'
#       gcp_billing_export.kubernetes_cluser_name: "-NULL"
#     sorts: [gcp_billing_export.total_net_cost desc 0]
#     limit: 1000
#     column_limit: 50
#     value_labels: legend
#     label_type: labPer
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     color_application:
#       collection_id: cme-colors
#       palette_id: cme-colors-categorical-0
#       options:
#         steps: 5
#     show_sql_query_menu_options: false
#     show_totals: true
#     show_row_totals: true
#     truncate_header: false
#     series_cell_visualizations:
#       gcp_billing_export.total_cost:
#         is_active: true
#     limit_displayed_rows_values:
#       show_hide: hide
#       first_last: first
#       num_rows: 0
#     x_axis_gridlines: false
#     y_axis_gridlines: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: false
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     legend_position: center
#     point_style: none
#     show_value_labels: true
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: true
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     series_colors:
#       total_cost: "#112B4A"
#       gcp_billing_export.total_cost: "#3CC8FF"
#     label_color: []
#     up_color: "#34A853"
#     down_color: false
#     total_color: "#9AA0A6"
#     defaults_version: 1
#     hidden_fields: []
#     y_axes: []
#     column_order: ["$$$_row_numbers_$$$", gcp_billing_export.project__name, gcp_billing_export.service__description,
#       gcp_billing_export.sku__description, gcp_billing_export.department_name, gcp_billing_export.deployment_type,
#       gcp_billing_export.business_object_id, gcp_billing_export.project_environment,
#       gcp_billing_export.project_id, gcp_billing_export.component_id, gcp_billing_export.total_cost]
#     hidden_pivots: {}
#     note_state: collapsed
#     note_display: above
#     note_text: This represents the resources (or projects with a label) eligible to
#       be labeled at GCP with (and without) an AppID as a percentage of spend.
#     listen:
#       Usage Start Date: gcp_billing_export.usage_start_date
#       Project ID: gcp_billing_export.project__id
#       Project Name: gcp_billing_export.project__name
#     row: 1
#     col: 8
#     width: 7
#     height: 5
#   - title: Labeled Resources
#     name: Labeled Resources
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     type: single_value
#     fields: [gcp_billing_export.total_net_cost]
#     filters:
#       pricing_mapping.marketplace_purchase: 'No'
#     sorts: [gcp_billing_export.total_net_cost desc 0]
#     limit: 1000
#     column_limit: 50
#     custom_color_enabled: true
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     value_labels: legend
#     label_type: labPer
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     color_application:
#       collection_id: cme-colors
#       palette_id: cme-colors-categorical-0
#       options:
#         steps: 5
#     show_sql_query_menu_options: false
#     show_totals: true
#     show_row_totals: true
#     truncate_header: false
#     series_cell_visualizations:
#       gcp_billing_export.total_cost:
#         is_active: true
#     limit_displayed_rows_values:
#       show_hide: hide
#       first_last: first
#       num_rows: 0
#     x_axis_gridlines: false
#     y_axis_gridlines: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: false
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     legend_position: center
#     point_style: none
#     show_value_labels: true
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: true
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     series_colors:
#       total_cost: "#112B4A"
#       gcp_billing_export.total_cost: "#3CC8FF"
#     label_color: []
#     up_color: "#34A853"
#     down_color: false
#     total_color: "#9AA0A6"
#     defaults_version: 1
#     hidden_fields:
#     y_axes: []
#     column_order: ["$$$_row_numbers_$$$", gcp_billing_export.project__name, gcp_billing_export.service__description,
#       gcp_billing_export.sku__description, gcp_billing_export.department_name, gcp_billing_export.deployment_type,
#       gcp_billing_export.business_object_id, gcp_billing_export.project_environment,
#       gcp_billing_export.project_id, gcp_billing_export.component_id, gcp_billing_export.total_cost]
#     hidden_pivots: {}
#     listen:
#       Usage Start Date: gcp_billing_export.usage_start_date
#       Project ID: gcp_billing_export.project__id
#       Project Name: gcp_billing_export.project__name
#     row: 3
#     col: 0
#     width: 8
#     height: 3
#   - name: ''
#     type: text
#     title_text: ''
#     subtitle_text: 'This dashboard shows all labelable GCP resources or projects that
#       are missing a label. '
#     body_text: ''
#     row: 0
#     col: 0
#     width: 24
#     height: 1
#   - title: 'Top Ten Unallocated Projects '
#     name: 'Top Ten Unallocated Projects '
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     type: looker_pie
#     fields: [gcp_billing_export.project__name, gcp_billing_export.total_net_cost]
#     filters:
#       gcp_billing_export.project__name: "-NULL"
#     sorts: [gcp_billing_export.total_net_cost desc 0]
#     limit: 10
#     value_labels: legend
#     label_type: labPer
#     x_axis_gridlines: false
#     y_axis_gridlines: true
#     show_view_names: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: true
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: true
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     limit_displayed_rows: false
#     legend_position: center
#     point_style: none
#     show_value_labels: false
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: false
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     defaults_version: 1
#     series_types: {}
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     enable_conditional_formatting: false
#     header_text_alignment: left
#     header_font_size: 12
#     rows_font_size: 12
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     listen:
#       Usage Start Date: gcp_billing_export.usage_start_date
#       Project ID: gcp_billing_export.project__id
#     row: 1
#     col: 15
#     width: 9
#     height: 5
#   - title: Unlabeled Resources
#     name: Unlabeled Resources
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     type: single_value
#     fields: [gcp_billing_export.total_net_cost]
#     filters:
#       pricing_mapping.marketplace_purchase: 'No'
#     sorts: [gcp_billing_export.total_net_cost desc 0]
#     limit: 1000
#     column_limit: 50
#     custom_color_enabled: true
#     show_single_value_title: true
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     enable_conditional_formatting: false
#     conditional_formatting_include_totals: false
#     conditional_formatting_include_nulls: false
#     value_labels: legend
#     label_type: labPer
#     show_view_names: false
#     show_row_numbers: true
#     transpose: false
#     truncate_text: true
#     hide_totals: false
#     hide_row_totals: false
#     size_to_fit: true
#     table_theme: white
#     limit_displayed_rows: false
#     header_text_alignment: left
#     header_font_size: '12'
#     rows_font_size: '12'
#     color_application:
#       collection_id: cme-colors
#       palette_id: cme-colors-categorical-0
#       options:
#         steps: 5
#     show_sql_query_menu_options: false
#     show_totals: true
#     show_row_totals: true
#     truncate_header: false
#     series_cell_visualizations:
#       gcp_billing_export.total_cost:
#         is_active: true
#     limit_displayed_rows_values:
#       show_hide: hide
#       first_last: first
#       num_rows: 0
#     x_axis_gridlines: false
#     y_axis_gridlines: false
#     show_y_axis_labels: true
#     show_y_axis_ticks: false
#     y_axis_tick_density: default
#     y_axis_tick_density_custom: 5
#     show_x_axis_label: false
#     show_x_axis_ticks: true
#     y_axis_scale_mode: linear
#     x_axis_reversed: false
#     y_axis_reversed: false
#     plot_size_by_field: false
#     trellis: ''
#     stacking: ''
#     legend_position: center
#     point_style: none
#     show_value_labels: true
#     label_density: 25
#     x_axis_scale: auto
#     y_axis_combined: true
#     ordering: none
#     show_null_labels: true
#     show_totals_labels: false
#     show_silhouette: false
#     totals_color: "#808080"
#     series_types: {}
#     series_colors:
#       total_cost: "#112B4A"
#       gcp_billing_export.total_cost: "#3CC8FF"
#     label_color: []
#     up_color: "#34A853"
#     down_color: false
#     total_color: "#9AA0A6"
#     defaults_version: 1
#     hidden_fields:
#     y_axes: []
#     column_order: ["$$$_row_numbers_$$$", gcp_billing_export.project__name, gcp_billing_export.service__description,
#       gcp_billing_export.sku__description, gcp_billing_export.department_name, gcp_billing_export.deployment_type,
#       gcp_billing_export.business_object_id, gcp_billing_export.project_environment,
#       gcp_billing_export.project_id, gcp_billing_export.component_id, gcp_billing_export.total_cost]
#     hidden_pivots: {}
#     listen:
#       Usage Start Date: gcp_billing_export.usage_start_date
#       Project ID: gcp_billing_export.project__id
#       Project Name: gcp_billing_export.project__name
#     row: 1
#     col: 0
#     width: 8
#     height: 2
#   filters:
#   - name: Usage Start Date
#     title: Usage Start Date
#     type: field_filter
#     default_value: 3 months ago for 3 months
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: relative_timeframes
#       display: inline
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     listens_to_filters: []
#     field: gcp_billing_export.usage_start_date
#   - name: Project ID
#     title: Project ID
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     listens_to_filters: []
#     field: gcp_billing_export.project__id
#   - name: Project Name
#     title: Project Name
#     type: field_filter
#     default_value: ''
#     allow_multiple_values: true
#     required: false
#     ui_config:
#       type: tag_list
#       display: popover
#     model: gcp_billing_block
#     explore: gcp_billing_export
#     listens_to_filters: []
#     field: gcp_billing_export.project__name
