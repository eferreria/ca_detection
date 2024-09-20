# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58 {
#   hidden: yes
#     join: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__tags {
#       view_label: "Gcp Billing Export Resource V1 0189 Fa E139 Fd 136 A58: Tags"
#       sql: LEFT JOIN UNNEST(${gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58.tags}) as gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__tags ;;
#       relationship: one_to_many
#     }
#     join: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__labels {
#       view_label: "Gcp Billing Export Resource V1 0189 Fa E139 Fd 136 A58: Labels"
#       sql: LEFT JOIN UNNEST(${gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58.labels}) as gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__labels ;;
#       relationship: one_to_many
#     }
#     join: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__credits {
#       view_label: "Gcp Billing Export Resource V1 0189 Fa E139 Fd 136 A58: Credits"
#       sql: LEFT JOIN UNNEST(${gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58.credits}) as gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__credits ;;
#       relationship: one_to_many
#     }
#     join: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__system_labels {
#       view_label: "Gcp Billing Export Resource V1 0189 Fa E139 Fd 136 A58: System Labels"
#       sql: LEFT JOIN UNNEST(${gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58.system_labels}) as gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__system_labels ;;
#       relationship: one_to_many
#     }
#     join: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__project__labels {
#       view_label: "Gcp Billing Export Resource V1 0189 Fa E139 Fd 136 A58: Project Labels"
#       sql: LEFT JOIN UNNEST(${gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58.project__labels}) as gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__project__labels ;;
#       relationship: one_to_many
#     }
#     join: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__project__ancestors {
#       view_label: "Gcp Billing Export Resource V1 0189 Fa E139 Fd 136 A58: Project Ancestors"
#       sql: LEFT JOIN UNNEST(${gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58.project__ancestors}) as gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__project__ancestors ;;
#       relationship: one_to_many
#     }
# }
view: gcp_detailed_billing_export {
  view_label: "Billing"
  derived_table: {
    partition_keys: ["partition_date"]

    cluster_keys: ["usage_start_date"]
    datagroup_trigger: monthly_on_day_2


    # increment_key: "partition_date"
    # increment_offset: 1
    sql: SELECT
      *
    ,
    , generate_uuid() as pk
    , DATE(usage_start_time) as usage_start_date

      FROM `@{DETAILED_BILLING_TABLE}`
      -- WHERE {% incrementcondition %} partition_date {% endincrementcondition %}
      ;;
  }

  dimension: adjustment_info__description {
    type: string
    sql: ${TABLE}.adjustment_info.description ;;
    group_label: "Adjustment Info"
    group_item_label: "Description"
  }
  dimension: adjustment_info__id {
    type: string
    sql: ${TABLE}.adjustment_info.id ;;
    group_label: "Adjustment Info"
    group_item_label: "ID"
  }
  dimension: adjustment_info__mode {
    type: string
    sql: ${TABLE}.adjustment_info.mode ;;
    group_label: "Adjustment Info"
    group_item_label: "Mode"
  }
  dimension: adjustment_info__type {
    type: string
    sql: ${TABLE}.adjustment_info.type ;;
    group_label: "Adjustment Info"
    group_item_label: "Type"
  }
  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }
  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }
  dimension: cost_at_list {
    type: number
    sql: ${TABLE}.cost_at_list ;;
  }
  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }
  dimension: credits {
    hidden: yes
    sql: ${TABLE}.credits ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  dimension: currency_conversion_rate {
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }
  dimension_group: export {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.export_time ;;
  }
  dimension: invoice__month {
    type: string
    sql: ${TABLE}.invoice.month ;;
    group_label: "Invoice"
    group_item_label: "Month"
  }
  dimension: labels {
    hidden: yes
    sql: ${TABLE}.labels ;;
  }
  dimension: location__country {
    type: string
    sql: ${TABLE}.location.country ;;
    group_label: "Location"
    group_item_label: "Country"
  }
  dimension: location__location {
    type: string
    sql: ${TABLE}.location.location ;;
    group_label: "Location"
    group_item_label: "Location"
  }
  dimension: location__region {
    type: string
    sql: ${TABLE}.location.region ;;
    group_label: "Location"
    group_item_label: "Region"
  }
  dimension: location__zone {
    type: string
    sql: ${TABLE}.location.zone ;;
    group_label: "Location"
    group_item_label: "Zone"
  }
  dimension_group: partition {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.partition_date ;;
  }
  dimension: price__effective_price {
    type: number
    sql: ${TABLE}.price.effective_price ;;
    group_label: "Price"
    group_item_label: "Effective Price"
  }
  dimension: price__pricing_unit_quantity {
    type: number
    sql: ${TABLE}.price.pricing_unit_quantity ;;
    group_label: "Price"
    group_item_label: "Pricing Unit Quantity"
  }
  dimension: price__tier_start_amount {
    type: number
    sql: ${TABLE}.price.tier_start_amount ;;
    group_label: "Price"
    group_item_label: "Tier Start Amount"
  }
  dimension: price__unit {
    type: string
    sql: ${TABLE}.price.unit ;;
    group_label: "Price"
    group_item_label: "Unit"
  }
  dimension: project__ancestors {
    hidden: yes
    sql: ${TABLE}.project.ancestors ;;
    group_label: "Project"
    group_item_label: "Ancestors"
  }
  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project.id ;;
    group_label: "Project"
    group_item_label: "ID"
  }
  dimension: project__labels {
    hidden: yes
    sql: ${TABLE}.project.labels ;;
    group_label: "Project"
    group_item_label: "Labels"
  }
  dimension: project__name {
    type: string
    sql: ${TABLE}.project.name ;;
    group_label: "Project"
    group_item_label: "Name"
  }
  dimension: project__number {
    type: string
    sql: ${TABLE}.project.number ;;
    group_label: "Project"
    group_item_label: "Number"
  }
  dimension: resource__global_name {
    type: string
    sql: ${TABLE}.resource.global_name ;;
    group_label: "Resource"
    group_item_label: "Global Name"
  }
  dimension: resource__name {
    type: string
    sql: ${TABLE}.resource.name ;;
    group_label: "Resource"
    group_item_label: "Name"
  }
  dimension: seller_name {
    type: string
    sql: ${TABLE}.seller_name ;;
  }
  dimension: service__description {
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
  }
  dimension: service__id {
    type: string
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }
  dimension: sku__description {
    type: string
    sql: ${TABLE}.sku.description ;;
    group_label: "SKU"
    group_item_label: "Description"
  }
  dimension: sku__id {
    type: string
    sql: ${TABLE}.sku.id ;;
    group_label: "SKU"
    group_item_label: "ID"
  }
  dimension: subscription__instance_id {
    type: string
    sql: ${TABLE}.subscription.instance_id ;;
    group_label: "Subscription"
    group_item_label: "Instance ID"
  }
  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
  }
  dimension: tags {
    hidden: yes
    sql: ${TABLE}.tags ;;
  }
  dimension: test {
    type: string
    sql: ${TABLE}.test ;;
  }
  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }
  dimension: usage__amount {
    type: number
    sql: ${TABLE}.usage.amount ;;
    group_label: "Usage"
    group_item_label: "Amount"
  }
  dimension: usage__amount_in_pricing_units {
    type: number
    sql: ${TABLE}.usage.amount_in_pricing_units ;;
    group_label: "Usage"
    group_item_label: "Amount In Pricing Units"
  }
  dimension: usage__pricing_unit {
    type: string
    sql: ${TABLE}.usage.pricing_unit ;;
    group_label: "Usage"
    group_item_label: "Pricing Unit"
  }
  dimension: usage__unit {
    type: string
    sql: ${TABLE}.usage.unit ;;
    group_label: "Usage"
    group_item_label: "Unit"
  }
  dimension_group: usage_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_end_time ;;
  }
  dimension_group: usage_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.usage_start_time ;;
  }
  measure: count {
    type: count
    drill_fields: [seller_name, project__name, resource__name, resource__global_name]
  }
}

view: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__tags {

  dimension: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__tags {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__tags ;;
  }
  dimension: inherited {
    type: yesno
    sql: inherited ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: namespace {
    type: string
    sql: namespace ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__labels {

  dimension: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__labels {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__labels ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__credits {
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: id ;;
  }
  dimension: amount {
    type: number
    sql: amount ;;
  }
  dimension: full_name {
    type: string
    sql: full_name ;;
  }
  dimension: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__credits {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__credits ;;
  }
  dimension: name {
    type: string
    sql: name ;;
  }
  dimension: type {
    type: string
    sql: type ;;
  }
}

view: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__system_labels {

  dimension: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__system_labels {
    type: string
    hidden: yes
    sql: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__system_labels ;;
  }
  dimension: key {
    type: string
    sql: key ;;
  }
  dimension: value {
    type: string
    sql: value ;;
  }
}

view: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__project__labels {

  dimension: key {
    type: string
    sql: ${TABLE}.key ;;
  }
  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: gcp_billing_export_resource_v1_0189_fa_e139_fd_136_a58__project__ancestors {

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }
  dimension: resource_name {
    type: string
    sql: ${TABLE}.resource_name ;;
  }
}
