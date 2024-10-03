view: gcp_billing_export {
  view_label: "Billing"
  derived_table: {
    partition_keys: ["partition_date"]
    cluster_keys: ["usage_start_date"]
    datagroup_trigger: daily_datagroup
    increment_key: "partition_date"
    increment_offset: 1
    sql: SELECT
        *
      , generate_uuid() as pk
      , DATE(usage_start_time) as usage_start_date

      FROM `@{BILLING_TABLE}`
      WHERE {% incrementcondition %} partition_date {% endincrementcondition %}
      ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
    label: "App ID"
  }

  dimension: partition_date {
    type: date
    sql: ${TABLE}.partition_date ;;
  }

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.pk ;;
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
    sql:  CASE
        WHEN ${TABLE}.adjustment_info.mode = 'MANUAL_ADJUSTMENT' THEN 'Manual Adjustment'
        WHEN ${TABLE}.adjustment_info.mode = 'COMPLETE_NEGATION' THEN 'Complete Negation'
        WHEN ${TABLE}.adjustment_info.mode = 'COMPLETE_NEGATION_WITH_REMONETIZATION' THEN 'Complete Negation with Remonetization'
        ELSE ${TABLE}.adjustment_info.mode
    END ;;
    group_label: "Adjustment Info"
    group_item_label: "Mode"
  }

  dimension: adjustment_info__type {
    type: string
    sql: CASE
        WHEN ${TABLE}.adjustment_info.type = 'USAGE_CORRECTION' THEN 'Usage Correction'
        WHEN ${TABLE}.adjustment_info.type = 'GENERAL_ADJUSTMENT' THEN 'General Adjustment'
        WHEN ${TABLE}.adjustment_info.type = 'GOODWILL' THEN 'Goodwill'
        ELSE ${TABLE}.adjustment_info.type
    END ;;
    group_label: "Adjustment Info"
    group_item_label: "Type"
  }

  dimension: billing_account_id {
    type: string
    sql: ${TABLE}.billing_account_id ;;
  }

  dimension: cloud {
    type: string
    suggestions: ["GCP", "Somthing Else", "GCPe"]
    sql: 'GCPe' ;;
    link: {
      label: "{{ value }} Cost Management"
      url: "/dashboards/gcp_billing::gcp_summary"
      icon_url: "looker.com/favicon.ico"
    }
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
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
    group_label: "Currency"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_conversion_rate {
    group_label: "Currency"
    type: number
    sql: ${TABLE}.currency_conversion_rate ;;
  }

  dimension_group: export {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    # date,
    sql: ${TABLE}.export_time ;;
  }

  dimension: invoice_month {
    type: string
    hidden: yes
    #Sidney Stefani - Hiding in order to convert to a date field
    sql: ${TABLE}.invoice.month ;;
    # group_label: "Invoice"
    # group_item_label: "Month"
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

  dimension: project__ancestry_numbers {
    type: string
    sql: ${TABLE}.project.ancestry_numbers ;;
    group_label: "Project"
    group_item_label: "Ancestry Numbers"
  }

  dimension: project__id {
    type: string
    sql: COALESCE(IF(${service__description} = 'Support', 'Support', ${TABLE}.project.id),"Unknown") ;;
    group_label: "Project"
    group_item_label: "ID"
    link: {
      label: "Usage Deep Dive"
      #url:
    }
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
    link: {
      label: "{% if project__id._value != 'Support' and project__id._value  != 'Unknown' %} View Project in Console {% endif %}"
      url: "https://console.cloud.google.com/home/dashboard?project={{ project__id._value }}"
      icon_url: "https://i.pinimg.com/originals/92/b2/66/92b266df967b8540c94301eacdec391b.png"
    }
    link: {
      label: "Usage Deep Dive"
      # url:
    }
  }

  # dimension: project__number {
  #   type: string
  #   sql: ${TABLE}.project.number ;;
  #   group_label: "Project"
  #   group_item_label: "Number"
  # }

  dimension: service__description {
    label: "Service Type"
    description: "The Google Cloud service the specific SKU is a part of"
    type: string
    sql: ${TABLE}.service.description ;;
    group_label: "Service"
    group_item_label: "Description"
    link: {
      label: "{% if value contains 'BigQuery' %} BigQuery Deep Dive {% endif %}"
      #url:
    }
    link: {
      label: "{% if value contains 'Compute Engine' %} Compute Engine Deep Dive {% endif %}"
      #url:
    }
    link: {
      label: "{% if value contains 'Cloud Storage' %} Cloud Storage Deep Dive {% endif %}"
      #url:
    }
    link: {
      label: "{% if value contains 'Networking' %} Networking Deep Dive {% endif %}"
      #url:
    }
    link: {
      label: "{% if value contains 'Kubernetes Engine' %} Kubernetes Engine Deep Dive {% endif %}"
      #url:
    }
    link: {
      label: "{% if value contains 'VMware Engine' %} VMware Engine Deep Dive {% endif %}"
      #url:
    }
  }

  dimension: service__id {
    type: string
    sql: ${TABLE}.service.id ;;
    group_label: "Service"
    group_item_label: "ID"
  }

  dimension: sku__description {
    description: "The description of the individual SKU"
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

  dimension: system_labels {
    hidden: yes
    sql: ${TABLE}.system_labels ;;
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

  dimension: usage__calculated_unit {
    type: string
    sql: CASE
              -- VCPU RAM
                WHEN ${usage__pricing_unit} = 'gibibyte hour' THEN 'GB'
              -- VCPU Cores
                WHEN ${usage__pricing_unit} = 'hour' THEN 'Count'
              -- PD Storage
              -- WHEN usage.pricing_unit = 'gibibyte month' THEN ROUND(SUM(usage.amount_in_pricing_units) * 30, 2)
              ELSE ${usage__pricing_unit} END;;
    group_label: "Usage"
    group_item_label: "Calculated Unit"
  }

  dimension_group: usage_end {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    sql: ${TABLE}.usage_end_time ;;
  }

  dimension_group: usage_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year,
      month_name
    ]
    datatype: date
    convert_tz: no
    sql:  ${TABLE}.usage_start_date
      ;;
  }

  dimension: usage_start_date_2 {
    label: "Usage Start Date (PST)"
    type: date
    convert_tz: no
    sql: TIMESTAMP_TRUNC(${TABLE}.usage_start_time, DAY, 'America/Los_Angeles') ;;
  }


  measure: count {
    hidden: no
    type: count
    drill_fields: [project__name]
  }

  measure: usage__amount_in_calculated_units {
    type: sum
    sql: CASE
              -- VCPU RAM
                WHEN usage.pricing_unit = 'gibibyte hour' THEN ${usage__amount_in_pricing_units}/24
              -- VCPU Cores
                WHEN usage.pricing_unit = 'hour' THEN ${usage__amount_in_pricing_units}/24
              -- PD Storage
              -- WHEN usage.pricing_unit = 'gibibyte month' THEN ROUND(SUM(usage.amount_in_pricing_units) * 30, 2)
              ELSE ${usage__amount_in_pricing_units}
            END;;
            #html: <p> {{rendered_value}} {{usage__calculated_unit}} </p> ;;
      group_item_label: "Total Amount in Calculated Units"
      value_format_name: decimal_0
      drill_fields: [project__name,service__description,total_cost, total_usage_amount]
    }

    measure: total_usage_amount {
      type: sum
      sql: ${usage__amount} ;;
      drill_fields: [project__name,service__description,total_cost, total_usage_amount]
    }

    #Sidney Stefani - updating drill fields
    measure: total_cost {
      type: sum
      sql: ${cost} ;;
      value_format: "#,##0.00"
      # html: <a href="#drillmenu" target="_self">{{ currency_symbol._value }}{{ rendered_value }}</a>;;
      drill_fields: [service__description,total_cost]
    }

    #Sidney Stefani - updating drill fields
    measure: total_net_cost {
      type: number
      # sql: ${total_cost} - ${gcp_billing_export__credits.total_amount};;
      sql: ${total_cost} - ${total_credit_amount} ;;
      value_format: "#,##0.00"
      # html: <a href="#drillmenu" target="_self">{{ currency_symbol._value }}{{ rendered_value }}</a>;;
      drill_fields: [total_cost, gcp_billing_export__credits.total_amount]
    }

    measure: total_net_cost_old {
      type: number
      sql: ${total_cost} - ${gcp_billing_export__credits.total_amount};;
      # sql: ${total_cost} - ${total_credit_amount} ;;
      value_format: "#,##0.00"
      # html: <a href="#drillmenu" target="_self">{{ currency_symbol._value }}{{ rendered_value }}</a>;;
      drill_fields: [total_cost, gcp_billing_export__credits.total_amount]
    }

    measure: total_credit_amount {
      type: sum
      sql: ${credit_amount} ;;
      value_format_name: usd
    }

    dimension: credit_amount {
      type: number
      sql: ( SELECT SUM(-gcp_billing_export__credits.amount) FROM UNNEST(gcp_billing_export.credits) as gcp_billing_export__credits  ) ;;
    }

####### PROJECT LABELS ########
    dimension: test_project_label {
      view_label: "Labels"
      hidden: yes
      group_label: "Project"
      type: string
      sql: (SELECT value FROM UNNEST(${project__labels}) WHERE key = 'test_project_label')  ;;
    }


#####RESOURCE LABELS#######
    dimension: test_resource_label {
      view_label: "Labels"
      group_label: "Resource"
      type: string
      sql: (SELECT value FROM UNNEST(${labels}) WHERE key = 'test_resource_label') ;;
    }

#####System LABELS#######

    dimension: cores {
      view_label: "Labels"
      group_label: "System"
      type: string
      sql: (SELECT value FROM UNNEST(${system_labels}) WHERE key = 'compute.googleapis.com/cores') ;;
    }

    dimension: is_unused_reservation {
      view_label: "Labels"
      label: "Is Unused Reservation?"
      group_label: "System"
      type: string
      sql: (SELECT value FROM UNNEST(${system_labels}) WHERE key = 'compute.googleapis.com/is_unused_reservation') ;;
    }

    dimension: machine_spec {
      view_label: "Labels"
      group_label: "System"
      type: string
      sql: (SELECT value FROM UNNEST(${system_labels}) WHERE key = 'compute.googleapis.com/machine_spec') ;;
    }

    dimension: memory {
      view_label: "Labels"
      group_label: "System"
      type: string
      sql: (SELECT value FROM UNNEST(${system_labels}) WHERE key = 'compute.googleapis.com/memory') ;;
    }

####DEVELOPMENT ON EXISTING FIELDS######

    # measure: total_marketplace_cost {
    #   type: sum
    #   value_format_name: usd_0
    #   filters: [pricing_mapping.marketplace_purchase: "Yes"]
    #   sql: ${cost} ;;
    # }


    measure: all_usage {
      type: sum
      group_label: "Usage"
      value_format_name: decimal_0
      sql: ${usage__amount}/86400 ;;
    }

    measure: total_cud_credits {
      label: "Total CUD Credits"
      type: sum
      hidden: yes
      group_label: "CUD"
      value_format_name: decimal_0
      filters: [gcp_billing_export__credits.id: "Committed Usage Discount: CPU"]
      sql: ${usage__amount}/86400 ;;
      #dividing by the number of seconds in a day to conver the value to usage per day
    }

    measure: cud_amount_in_billing_units {
      type: sum
      hidden: yes
      group_label: "CUD"
      label: "CUD Amount in Billing Units"
      filters: [gcp_billing_export__credits.type: "Committed Usage Discount"]
      sql: ${gcp_billing_export__credits.amount} ;;
    }

    dimension: machine_type {
      type: string
      sql: case when ${sku__description} like"%N1%" then "N1"
          when ${sku__description} like "%N2D%" then "N2D"
          when ${sku__description} like "%N2%" then "N2"
          when ${sku__description} like "%E2%" then "E2"
          when ${sku__description} like "%Sole Tenant%" then "Sole Tenant"
          when ${sku__description} like "%C2%" then "C2"
          when ${sku__description} like "%M2%" then "M2"
          when ${sku__description} like "%Commitment v1: Cpu in%" then "N1"
          when ${sku__description} like "%Commitment v1: Ram in%" then "N1"
          else "Other" end;;
    }

    # measure: active_commitment{
    #   type: sum
    #   value_format_name: decimal_0
    #   sql: ${usage__amount}/86400 ;;
    #   filters: [sku__description: "Commitment%",
    #     pricing.pricing_usage_type: "Commitment"]
    # }

    measure: utilizied_commitment{
      type: number
      hidden: yes
      group_label: "CUD"
      value_format_name: decimal_2
      sql: ${usage_costs}*ABS(${cud_amount_in_billing_units}) ;;
    }

    dimension: kubernetes_cluser_name {
      type:  string
      label: "Cluster Name (Kubernetes)"
      view_label: "Labels"
      group_label: "Resource"
      sql: (SELECT value from UNNEST(${labels}) WHERE key = 'goog-k8s-cluster-name') ;;
    }

    dimension: kubernetes_namespace {
      type:  string
      label: "Namespace (Kubernetes)"
      view_label: "Labels"
      group_label: "Resource"
      sql: (SELECT value from UNNEST(${labels}) WHERE key = 'k8s-namespace') ;;
    }

    measure: usage_costs {
      type: number
      hidden: yes
      sql: case when ${total_cost} != 0 then ${all_usage}/${total_cost} else 0 end ;;
    }

    measure: eligible_on_demand_usage {
      type: number
      hidden: yes
      group_label: "CUD"
      value_format_name: decimal_2
      sql: ${all_usage}-NullIF(${utilizied_commitment},0) ;;
    }

    measure: total_cud_cost {
      type: sum
      group_label: "CUD"
      label: "Total CUD Cost"
      sql: case when LOWER(${sku__description}) LIKE "commitment%" then ${cost} else 0 end;;
      value_format_name: usd
    }

    measure: total_non_cud_cost {
      type: number
      group_label: "CUD"
      value_format_name: usd
      sql:${total_cost}-${total_cud_cost};;
      label: "Total Non CUD Cost"
    }

    measure: total_cost_at_on_demand_rates {
      type: sum
      value_format_name: usd
      group_label: "CUD"
      sql: case when LOWER(${sku__description}) LIKE "commitment%" then 0 else ${cost} end  ;;
    }

    measure: commitment_on_demand {
      type: number
      value_format_name: usd
      label: "Commitment at on Demand Rates"
      group_label: "CUD"
      sql: ${total_cost_at_on_demand_rates} - ${total_non_cud_cost} ;;
    }

    measure: cud_coverage {
      type: number
      value_format_name: percent_0
      group_label: "CUD"
      label: "CUD Coverage"
      sql: ${total_cud_cost}/NullIF(${total_cost_at_on_demand_rates},0) ;;
    }

    #Rishi Ghai - String to Date
    dimension_group: invoice_month {
      label: "Invoice"
      type: time
      #sql: ${TABLE}.invoice.month ;;
      datatype: date
      timeframes: [
        month,
        quarter
      ]
      sql: date(CAST(substring(${TABLE}.invoice.month,1,4) AS int),CAST(substring(${TABLE}.invoice.month,5,2) AS int),01);;
    }


    #Rishi Ghai- Org ID
    dimension: gcp_org_id {
      label: "GCP Org ID"
      type: string
      sql: REGEXP_EXTRACT( ${project__ancestry_numbers},"^/([0-9]+)") ;;
    }

  }

  view: gcp_billing_export__labels {
    view_label: "Labels"

    dimension: key {
      group_label: "Billing Export"
      type: string
      sql: ${TABLE}.key ;;
    }

    dimension: value {
      group_label: "Billing Export"
      type: string
      sql: ${TABLE}.value ;;
    }}

  view: gcp_billing_export__credits {
    view_label: "Credits"
    drill_fields: [id]

    dimension: pk {
      primary_key: yes
      hidden: yes
      sql: concat(${name},${gcp_billing_export.pk},${amount}) ;;
    }

    dimension: id {
      type: string
      sql: ${TABLE}.id ;;
    }

    dimension: amount {
      type: number
      sql: ${TABLE}.amount ;;
    }

    dimension: full_name {
      type: string
      sql: ${TABLE}.full_name ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    #Rishi Ghai - Updating for capitalization of values
    dimension: type {
      type: string
      #   sql: case when ${name} like "%Committed Usage%" then "COMMITTED_USAGE_DISCOUNT"
      #             when ${name} like "%Sustained Usage%" then "SUSTAINED_USAGE_DISCOUNT"
      #             else ${TABLE}.type end;;
      sql: case when ${TABLE}.type = 'DISCOUNT' then 'Discount'
              when ${TABLE}.type = 'PROMOTION' then 'Promotion'
              when ${name} like '%Committed Usage%' then 'Committed Usage Discount'
              when ${name} like '%Sustained Usage%' then 'Sustained Usage Discount'
              else ${TABLE}.type end;;
      drill_fields: [name]
    }

    measure: total_amount {
      label: "Total Credit Amount"
      type: sum
      value_format: "#,##0.00"
      html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
      sql: -1*${amount} ;;
      drill_fields: [gcp_billing_export__credits.type,gcp_billing_export__credits.total_amount]
    }

    measure: total_sustained_use_discount {
      view_label: "Credits"
      type: sum
      value_format: "#,##0.00"
      html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
      sql: -1*${amount} ;;
      filters: [gcp_billing_export__credits.type: "Sustained Usage Discount"]
      drill_fields: [gcp_billing_export__credits.id,gcp_billing_export__credits.name,total_amount]
    }

    measure: total_committed_use_discount {
      view_label: "Credits"
      type: sum
      value_format: "#,##0.00"
      html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
      sql: -1*${amount} ;;
      filters: [gcp_billing_export__credits.type: "Committed Usage Discount, COMMITTED_USAGE_DISCOUNT_DOLLAR_BASE"]
      drill_fields: [gcp_billing_export__credits.id,gcp_billing_export__credits.name,total_amount]
    }

    measure: total_promotional_credit {
      view_label: "Credits"
      type: sum
      value_format: "#,##0.00"
      html: <a href="#drillmenu" target="_self">{{ gcp_billing_export.currency_symbol._value }}{{ rendered_value }}</a>;;
      sql: -1*${amount} ;;
      filters: [gcp_billing_export__credits.type: "Promotion"]
      drill_fields: [gcp_billing_export__credits.id,gcp_billing_export__credits.name,total_amount]
    }
  }

  view: gcp_billing_export__system_labels {
    view_label: "Labels"
    dimension: key {
      group_label: "System"
      type: string
      sql: ${TABLE}.key ;;
    }

    dimension: value {
      group_label: "System"
      type: string
      sql: ${TABLE}.value ;;
    }}

  view: gcp_billing_export__project__labels {
    view_label: "Labels"
    dimension: key {
      group_label: "Project"
      type: string
      sql: ${TABLE}.key ;;
    }

    dimension: value {
      group_label: "Project"
      type: string
      sql: ${TABLE}.value ;;
    }}
