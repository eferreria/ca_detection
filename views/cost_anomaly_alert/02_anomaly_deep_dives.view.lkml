include: "/models/cost_anomaly_detection.model.lkml"
include: "/explores/gcp_billing.explore.lkml"
include: "/views/gcp_billing/gcp_billing_export.view.lkml"
include: "/views/gcp_billing/gcp_detailed_billing_export.view.lkml"

explore: gcp_detailed_billing_export_for_deep_dive {
  extends: [gcp_detailed_billing_export]
  from: gcp_detailed_billing_export_for_deep_dive
  view_name: gcp_detailed_billing_export
  join: service_region_label_deep_dive {
    view_label: "Label Deep Dive"
    type: left_outer
    sql_on: ${gcp_detailed_billing_export.project_id} = ${service_region_label_deep_dive.project_id}
          and ${gcp_detailed_billing_export.service_description} = ${service_region_label_deep_dive.service_description}
          and ${gcp_detailed_billing_export.location_region} = ${service_region_label_deep_dive.location_region}
          and ${gcp_detailed_billing_export.all_labels} = ${service_region_label_deep_dive.all_labels}
          and ${gcp_detailed_billing_export.usage_start_date} = ${service_region_label_deep_dive.usage_start_date};;
    relationship: many_to_one
  }
  join: label_for_label_deep_dive {
    view_label: "Label Deep Dive"
    from: label
    sql: LEFT JOIN UNNEST(SPLIT(${service_region_label_deep_dive.all_labels})) as label_for_label_deep_dive ;;
    relationship: one_to_many
  }
  join: service_region_label_resource_deep_dive {
    view_label: "Resource Deep Dive"
    type: left_outer
    sql_on: ${gcp_detailed_billing_export.project_id} = ${service_region_label_deep_dive.project_id}
          and ${gcp_detailed_billing_export.service_description} = ${service_region_label_deep_dive.service_description}
          and ${gcp_detailed_billing_export.location_region} = ${service_region_label_deep_dive.location_region}
          and ${gcp_detailed_billing_export.all_labels} = ${service_region_label_deep_dive.all_labels}
          and ${gcp_detailed_billing_export.usage_start_date} = ${service_region_label_deep_dive.usage_start_date}
          and ${gcp_detailed_billing_export.resource_name}=${service_region_label_resource_deep_dive.resource_name};;
    relationship: many_to_one
  }
  join: label_for_resource_deep_dive {
    view_label: "Resource Deep Dive"
    from: label
    sql: LEFT JOIN UNNEST(SPLIT(${service_region_label_resource_deep_dive.all_labels})) as label_for_resource_deep_dive ;;
    relationship: one_to_many
  }
  join: service_region_label_custom_compare_deep_dive {
    view_label: "Label Deep Dive (Custom Date Comparison)"
    type: left_outer
    sql_on: ${gcp_detailed_billing_export.project_id} = ${service_region_label_custom_compare_deep_dive.project_id}
          and ${gcp_detailed_billing_export.service_description} = ${service_region_label_custom_compare_deep_dive.service_description}
          and ${gcp_detailed_billing_export.location_region} = ${service_region_label_custom_compare_deep_dive.location_region}
          and ${gcp_detailed_billing_export.all_labels} = ${service_region_label_custom_compare_deep_dive.all_labels}
          and ${gcp_detailed_billing_export.usage_start_date} = ${service_region_label_custom_compare_deep_dive.usage_start_date};;
    relationship: many_to_one
  }
  join: project_deep_dive {
    type: left_outer
    sql_on: ${gcp_detailed_billing_export.project_id} = ${project_deep_dive.project_id}
      and ${gcp_detailed_billing_export.usage_start_date} = ${project_deep_dive.usage_start_date};;
    relationship: many_to_one
  }
  join: project_deep_dive_custom_compare {
    type: left_outer
    sql_on: ${gcp_detailed_billing_export.project_id} = ${project_deep_dive_custom_compare.project_id}
      and ${gcp_detailed_billing_export.usage_start_date} = ${project_deep_dive_custom_compare.usage_start_date};;
    relationship: many_to_one
  }
}

explore: service_region_label_deep_dive {
  view_name: gcp_detailed_billing_export
  from: service_region_label_deep_dive
  join: label_for_label_deep_dive {
    view_label: "Label for Label Deep Dive"
    from: label
    sql: LEFT JOIN UNNEST(SPLIT(${gcp_detailed_billing_export.all_labels})) as label_for_label_deep_dive ;;
    relationship: one_to_many
  }
}

view: service_region_label_deep_dive {
  extends: [deep_dive]
  derived_table: {
    # datagroup_trigger: near_real_time
    # increment_key: "partition_date"
    # increment_offset: 0
    explore_source: gcp_detailed_billing_export_for_deep_dive {
      column: project_id {}
      column: service_description {}
      column: location_region {}
      column: all_labels {}
      column: total_net_cost {}
      column: usage_start_date {} #need to enhance by joining to a calendar table so that any day+ long spending gaps don't affect the lag functions - probably ought to do so wt the same time as the enhancement of making into a PDT
      derived_column: net_cost_yesterday {
        sql: LAG(total_net_cost,1) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_two_days_ago {
        sql: LAG(total_net_cost,2) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_three_days_ago {
        sql: LAG(total_net_cost,3) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_four_days_ago {
        sql: LAG(total_net_cost,4) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_seven_days_ago {
        sql: LAG(total_net_cost,5) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_twenty_days_ago {
        sql: LAG(total_net_cost,6) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      filters: [gcp_detailed_billing_export.usage_start_date_and_useful_prior: "Yes"] ##useful days are today, yesterday, 2,3,4,7,20 days ago - the gaps in that list explain the lags being sequential despite the field names skipping days
#partition_experiment      filters: [gcp_detailed_billing_export.partition_date_with_padding_for_service_cost_history: "Yes"]

      bind_filters: {
        from_field: gcp_detailed_billing_export.usage_start_date
        to_field: gcp_detailed_billing_export.date_filter
      }
      bind_filters: {
        to_field: gcp_detailed_billing_export.project_id
        from_field: gcp_detailed_billing_export.project_id
      }
    }
  }
  dimension: pk {
    primary_key: yes #https://appexec.cloud.looker.com/explore/applovin-gcp-cost/service_region_label_deep_dive?fields=gcp_detailed_billing_export.pk,gcp_detailed_billing_export.count&f[gcp_detailed_billing_export.project_id]=prj-al-p-axon-max-314e&f[gcp_detailed_billing_export.usage_start_date]=2024%2F05%2F13&sorts=gcp_detailed_billing_export.count+desc+0&limit=500&column_limit=50&vis=%7B%7D&filter_config=%7B%22gcp_detailed_billing_export.project_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22prj-al-p-axon-max-314e%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%7D%5D%2C%22gcp_detailed_billing_export.usage_start_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-05-13T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A6%7D%5D%7D&origin=share-expanded
    sql: concat(${project_id},${service_description},${location_region},${all_labels}) ;; #should add ,${usage_start_date}
  }
  dimension: project_id {}
  dimension: service_description {}
  dimension: location_region {}
  dimension: all_labels {}

}

# explore: service_region_label_resource_deep_dive {
#   from: service_region_label_resource_deep_dive
#   view_name: gcp_detailed_billing_export
# }
view: service_region_label_resource_deep_dive {
  extends: [deep_dive]
  derived_table: {
    explore_source: gcp_detailed_billing_export_for_deep_dive {
      column: project_id {}
      column: service_description {}
      column: location_region {}
      column: all_labels {}
      column: resource_name {}
      column: total_net_cost {}
      column: usage_start_date {} #need to enhance by joining to a calendar table so that any day+ long spending gaps don't affect the lag functions - probably ought to do so wt the same time as the enhancement of making into a PDT
      derived_column: net_cost_yesterday {
        sql: LAG(total_net_cost,1) OVER (PARTITION BY project_id, service_description, location_region, all_labels, resource_name ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_two_days_ago {
        sql: LAG(total_net_cost,2) OVER (PARTITION BY project_id, service_description, location_region, all_labels, resource_name ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_three_days_ago {
        sql: LAG(total_net_cost,3) OVER (PARTITION BY project_id, service_description, location_region, all_labels, resource_name ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_four_days_ago {
        sql: LAG(total_net_cost,4) OVER (PARTITION BY project_id, service_description, location_region, all_labels, resource_name ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_seven_days_ago {
        sql: LAG(total_net_cost,5) OVER (PARTITION BY project_id, service_description, location_region, all_labels, resource_name ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_twenty_days_ago {
        sql: LAG(total_net_cost,6) OVER (PARTITION BY project_id, service_description, location_region, all_labels, resource_name ORDER BY usage_start_date ASC) ;;
      }
      filters: [gcp_detailed_billing_export.usage_start_date_and_useful_prior: "Yes"] ##useful days are today, yesterday, 2,3,4,7,20 days ago - the gaps in that list explain the lags being sequential despite the field names skipping days
#partition_experiment      filters: [gcp_detailed_billing_export.partition_date_with_padding_for_service_cost_history: "Yes"]
      bind_filters: {
        to_field: gcp_detailed_billing_export.project_id
        from_field: gcp_detailed_billing_export.project_id
      }
      bind_filters: {
        from_field: gcp_detailed_billing_export.usage_start_date
        to_field: gcp_detailed_billing_export.date_filter
      }
      # bind_filters: {
      #   from_field: label.label
      #   to_field: label_for_resource_deep_dive.label
      # }
    }
  }
  dimension: pk {
    primary_key: yes #https://appexec.cloud.looker.com/explore/applovin-gcp-cost/service_region_label_resource_deep_dive?fields=gcp_detailed_billing_export.pk,gcp_detailed_billing_export.count&f[gcp_detailed_billing_export.project_id]=prj-al-p-axon-max-314e&f[gcp_detailed_billing_export.usage_start_date]=2024%2F05%2F13&sorts=gcp_detailed_billing_export.count+desc&limit=500&column_limit=50&vis=%7B%7D&filter_config=%7B%22gcp_detailed_billing_export.project_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22prj-al-p-axon-max-314e%22%7D%2C%7B%7D%5D%2C%22id%22%3A6%7D%5D%2C%22gcp_detailed_billing_export.usage_start_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-05-13T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A7%7D%5D%7D&origin=share-expanded
    sql: concat(${project_id},${service_description},${location_region},${all_labels},${resource_name}) ;; #should add ,${usage_start_date}
  }
  dimension: project_id {}
  dimension: service_description {}
  dimension: location_region {}
  dimension: all_labels {}
  dimension: resource_name {}
}

view: project_deep_dive {
  extends: [deep_dive]
  derived_table: {
    # datagroup_trigger: near_real_time
    # increment_key: "partition_date"
    # increment_offset: 0
    explore_source: gcp_detailed_billing_export_for_deep_dive {
      column: project_id {}
      column: total_net_cost {}
      column: usage_start_date {} #need to enhance by joining to a calendar table so that any day+ long spending gaps don't affect the lag functions - probably ought to do so wt the same time as the enhancement of making into a PDT
      derived_column: net_cost_yesterday {
        sql: LAG(total_net_cost,1) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_two_days_ago {
        sql: LAG(total_net_cost,2) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_three_days_ago {
        sql: LAG(total_net_cost,3) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_four_days_ago {
        sql: LAG(total_net_cost,4) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_seven_days_ago {
        sql: LAG(total_net_cost,5) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      derived_column: net_cost_twenty_days_ago {
        sql: LAG(total_net_cost,6) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      filters: [gcp_detailed_billing_export.usage_start_date_and_useful_prior: "Yes"] ##useful days are today, yesterday, 2,3,4,7,20 days ago - the gaps in that list explain the lags being sequential despite the field names skipping days
#partition_experiment      filters: [gcp_detailed_billing_export.partition_date_with_padding_for_service_cost_history: "Yes"]
      bind_filters: {
        to_field: gcp_detailed_billing_export.project_id
        from_field: gcp_detailed_billing_export.project_id
      }
      bind_filters: {
        from_field: gcp_detailed_billing_export.usage_start_date
        to_field: gcp_detailed_billing_export.date_filter
      }
    }
  }
  dimension: pk {
    primary_key: yes
    sql: concat(${project_id},${usage_start_date}) ;;
  }
  dimension: project_id {}
}

view: deep_dive {
  extension: required
  measure: total_net_cost {
    description: ""
    value_format: "$#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.total_net_cost,0) ;;
  }
  # dimension: total_net_cost {
  #   description: ""
  #   value_format: "$#,##0.00"
  #   type: number
  #   sql: coalesce(${TABLE}.total_net_cost,0) ;;
  # }
  dimension: usage_start_date {
    type: date
  }
  measure: net_cost_yesterday {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_yesterday,0) ;;
  }
  measure: net_cost_two_days_ago {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_two_days_ago,0) ;;
  }
  measure: net_cost_three_days_ago {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_three_days_ago,0) ;;
  }
  measure: net_cost_four_days_ago {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_four_days_ago,0) ;;
  }
  measure: net_cost_seven_days_ago {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_seven_days_ago,0) ;;
  }
  measure: net_cost_twenty_days_ago {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_twenty_days_ago,0) ;;
  }
  measure: absolute_increase_since_yesterday {
    type: number
    value_format_name: usd
    sql: ${total_net_cost}-${net_cost_yesterday} ;;
    #(tn1+tn2)-(cy1+cy2) = (tn1-cy1)+(tn2-cy2)
  }
  measure: percent_increase_since_yesterday {
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_yesterday}/nullif(${net_cost_yesterday},0) ;;
  }
#this is working https://4e605514-217d-45dc-b025-a98e3a3870c6.looker.app/explore/gcp_cost_anomaly_detection/project_anomaly_analysis?fields=project_detect_anomalies_net_cost.usage_start_date,project_detect_anomalies_net_cost.project_id,project_detect_anomalies_net_cost.is_anomaly,project_sku_top_10_by_net_cost.service_description,project_sku_top_10_by_net_cost.sku_description,project_sku_top_10_by_net_cost.total_net_cost,project_sku_detail.total_net_cost,project_sku_detail.net_cost_yesterday,project_sku_detail.net_cost_two_days_ago,project_sku_detail.net_cost_three_days_ago,project_sku_detail.net_cost_four_days_ago,project_sku_detail.net_cost_seven_days_ago,project_sku_detail.net_cost_twenty_days_ago,project_sku_detail.percent_increase_since_yesterday&f[project_detect_anomalies_net_cost.usage_start_date]=2024%2F03%2F21&f[project_detect_anomalies_net_cost.project_id]=xdr-zeus&f[project_sku_detail.usage_start_date]=2024%2F03%2F21&sorts=project_sku_top_10_by_net_cost.total_net_cost+desc&limit=500&column_limit=50&vis=%7B%22hidden_pivots%22%3A%7B%7D%7D&filter_config=%7B%22project_detect_anomalies_net_cost.usage_start_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-03-21T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A12%7D%5D%2C%22project_detect_anomalies_net_cost.project_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22xdr-zeus%22%7D%2C%7B%7D%5D%2C%22id%22%3A13%7D%5D%2C%22project_sku_detail.usage_start_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-03-21T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A14%7D%5D%7D&origin=share-expanded
  measure: absolute_increase_since_two_days_ago {
    type: number
    value_format_name: usd
    sql: ${total_net_cost}-${net_cost_two_days_ago} ;;
  }
  measure: percent_increase_since_two_days_ago{
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_two_days_ago}/nullif(${net_cost_two_days_ago},0) ;;
  }
  measure: absolute_increase_since_three_days_ago {
    type: number
    value_format_name: usd
    sql: ${total_net_cost}-${net_cost_three_days_ago} ;;
  }
  measure: percent_increase_since_three_days_ago{
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_three_days_ago}/nullif(${net_cost_three_days_ago},0) ;;
  }
  measure: absolute_increase_since_four_days_ago {
    type: number
    value_format_name: usd
    sql: ${total_net_cost}-${net_cost_four_days_ago} ;;
  }
  measure: percent_increase_since_four_days_ago{
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_four_days_ago}/nullif(${net_cost_four_days_ago},0) ;;
  }
  measure: absolute_increase_since_seven_days_ago {
    type: number
    value_format_name: usd
    sql: ${total_net_cost}-${net_cost_seven_days_ago} ;;
  }
  measure: percent_increase_since_seven_days_ago{
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_seven_days_ago}/nullif(${net_cost_seven_days_ago},0) ;;
  }
  measure: absolute_increase_since_twenty_days_ago {
    type: number
    value_format_name: usd
    sql: ${total_net_cost}-${net_cost_twenty_days_ago} ;;
  }
  measure: percent_increase_since_twenty_days_ago{
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_twenty_days_ago}/nullif(${net_cost_twenty_days_ago},0) ;;
  }
  measure: greatest_percent_increase {
    type: number
    value_format_name: percent_2
    sql: greatest(${percent_increase_since_yesterday}
          ,${percent_increase_since_two_days_ago}
          ,${percent_increase_since_three_days_ago}
          ,${percent_increase_since_four_days_ago}
          ,${percent_increase_since_seven_days_ago}
          ,${percent_increase_since_twenty_days_ago});;
  }

  measure: greatest_absolute_increase {
    type: number
    value_format_name: usd
    sql: greatest(${absolute_increase_since_yesterday}
          ,${absolute_increase_since_two_days_ago}
          ,${absolute_increase_since_three_days_ago}
          ,${absolute_increase_since_four_days_ago}
          ,${absolute_increase_since_seven_days_ago}
          ,${absolute_increase_since_twenty_days_ago});;
  }



  measure: count {
    type: count
  }
}
view: gcp_detailed_billing_export_for_deep_dive {
  extends: [gcp_detailed_billing_export]
  sql_table_name: ${gcp_detailed_billing_export.SQL_TABLE_NAME} ;;
  filter: comparison_date_filter {
    description: "Date to compare with the interest date"
    type: date
  }
  dimension: comparison_date {
    description: "Must use with comparison date filter"
    sql: {% date_start comparison_date_filter %} ;;
    type: date
  }
  dimension: is_comparison_date {
    type: yesno
    sql: ${usage_start_date} = date({% date_start comparison_date_filter %}) ;;
  }
  dimension: is_interest_date_or_comparison_date {
    type: yesno
    description: "Must use with both interest date filter and comparison date filter"
    sql: ${is_comparison_date} or ${is_date_filter};;
  }
  dimension: partition_date_with_padding_for_comparison {
    # hidden: yes
    type: yesno
    sql: ${partition_date} in (
          date({% date_start date_filter %})
          , date_add(date({% date_start date_filter %}), interval 1 day)
          , date_add(date({% date_start date_filter %}), interval 2 day)
          , DATE({% date_start comparison_date_filter %})
          , date_add(DATE({% date_start comparison_date_filter %}), interval 1 day)
          , date_add(DATE({% date_start comparison_date_filter %}), interval 2 day)
          )
          ;;
  }
  dimension: usage_start_date_and_useful_prior {
    hidden: yes
    type: yesno
    sql: ${usage_start_date} in (
          date({% date_start date_filter %})
          , date_add(date({% date_start date_filter %}), interval -1 day)
          , date_add(date({% date_start date_filter %}), interval -2 day)
          , date_add(date({% date_start date_filter %}), interval -3 day)
          , date_add(date({% date_start date_filter %}), interval -4 day)
          , date_add(date({% date_start date_filter %}), interval -7 day)
          , date_add(date({% date_start date_filter %}), interval -20 day)
          );;
  }
  # dimension: partition_date_with_padding_for_resource_deep_dive { #get the data which arrived (partition) on the day of the anomaly and one day after
  #   # hidden: yes
  #   type: yesno
  #   sql: ${partition_date} in (
  #         DATE(TIMESTAMP_TRUNC({% date_start usage_start_date %}, day))
  #         , date_add(DATE(TIMESTAMP_TRUNC({% date_start usage_start_date %},day)), interval 1 day)
  #         , date_add(DATE(TIMESTAMP_TRUNC({% date_start usage_start_date %},day)), interval -1 day)
  #         );;
  # }
  # dimension: partition_date_with_padding_for_service_cost_history{
  #   hidden: yes
  #   type: yesno
  #   sql: ${partition_date} in (
  #         date({% date_start date_filter %})
  #         , date_add(date({% date_start date_filter %}), interval 1 day)
  #         , date_add(date({% date_start date_filter %}), interval 2 day)
  #         , date_add(date({% date_start date_filter %}), interval -1 day)
  #         , date_add(date({% date_start date_filter %}), interval -2 day)
  #         , date_add(date({% date_start date_filter %}), interval -3 day)
  #         , date_add(date({% date_start date_filter %}), interval -4 day)
  #         , date_add(date({% date_start date_filter %}), interval -5 day)
  #         , date_add(date({% date_start date_filter %}), interval -6 day)
  #         , date_add(date({% date_start date_filter %}), interval -7 day)
  #         , date_add(date({% date_start date_filter %}), interval -8 day)
  #         , date_add(date({% date_start date_filter %}), interval -19 day)
  #         , date_add(date({% date_start date_filter %}), interval -20 day)
  #         , date_add(date({% date_start date_filter %}), interval -21 day)
  #         );;
  # }

}

view: project_deep_dive_custom_compare {
  #https://appexec.cloud.looker.com/explore/applovin-gcp-cost/gcp_detailed_billing_export?fields=gcp_detailed_billing_export.total_net_cost,gcp_detailed_billing_export.usage_start_date,gcp_detailed_billing_export.project_id&f[gcp_detailed_billing_export.comparison_date_filter]=2024%2F07%2F11&f[gcp_detailed_billing_export.is_interest_date_or_comparison_date]=Yes&f[gcp_detailed_billing_export.project_id]=prj-al-p-axon-adserver-96d9&f[gcp_detailed_billing_export.partition_date_with_padding_for_comparison]=Yes&f[gcp_detailed_billing_export.date_filter]=2024%2F07%2F15&sorts=gcp_detailed_billing_export.usage_start_date+desc&limit=500&column_limit=50&vis=%7B%7D&filter_config=%7B%22gcp_detailed_billing_export.comparison_date_filter%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-07-11T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A12%7D%5D%2C%22gcp_detailed_billing_export.is_interest_date_or_comparison_date%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A13%7D%5D%2C%22gcp_detailed_billing_export.project_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22prj-al-p-axon-adserver-96d9%22%7D%2C%7B%7D%5D%2C%22id%22%3A14%7D%5D%2C%22gcp_detailed_billing_export.partition_date_with_padding_for_comparison%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A15%7D%5D%2C%22gcp_detailed_billing_export.date_filter%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-07-15T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A16%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded
  derived_table: {
    explore_source: gcp_detailed_billing_export_for_deep_dive {
      column: project_id {}
      column: total_net_cost {}
      column: usage_start_date {} #need to enhance by joining to a calendar table so that any day+ long spending gaps don't affect the lag functions - probably ought to do so wt the same time as the enhancement of making into a PDT
      derived_column: net_cost_comparison_day {
        sql: LAG(total_net_cost,1) OVER (PARTITION BY project_id ORDER BY usage_start_date ASC) ;;
      }
      filters: [gcp_detailed_billing_export.is_interest_date_or_comparison_date: "Yes"] ##useful days are today, yesterday, 2,3,4,7,20 days ago - the gaps in that list explain the lags being sequential despite the field names skipping days
#partition_experiment      filters: [gcp_detailed_billing_export.partition_date_with_padding_for_comparison: "Yes"]
      bind_filters: {
        to_field: gcp_detailed_billing_export.project_id
        from_field: gcp_detailed_billing_export.project_id
      }
      bind_filters: {
        from_field: gcp_detailed_billing_export.date_filter
        to_field: gcp_detailed_billing_export.date_filter
      }
      bind_filters: {
        from_field: gcp_detailed_billing_export.comparison_date_filter
        to_field: gcp_detailed_billing_export.comparison_date_filter
      }
    }
  }
  dimension: pk {
    primary_key: yes
    sql: concat(${project_id},${usage_start_date}) ;;
  }
  dimension: project_id {}
  dimension: usage_start_date {
    type: date
  }
  dimension: is_date_filter {
    type: yesno
    sql: /*xxx*/ ${usage_start_date} = date({% date_start gcp_detailed_billing_export.date_filter %}) ;;
  }
  dimension: total_net_cost_raw {
    description: ""
    value_format: "$#,##0.00"
    type: number
    sql: ${TABLE}.total_net_cost ;;
  }
  measure: total_net_cost_date_filter {
    type: sum
    value_format_name: usd
    filters: [is_date_filter: "Yes"]
    sql: ${total_net_cost_raw} ;;

  }
  measure: net_cost_comparison_day {
    value_format: "#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_comparison_day,0) ;;
  }
  measure: absolute_increase_since_comparison_day {
    type: number
    value_format_name: usd
    sql: ${total_net_cost_date_filter}-${net_cost_comparison_day} ;;
    #(tn1+tn2)-(cy1+cy2) = (tn1-cy1)+(tn2-cy2)
  }
  measure: percent_increase_since_comparison_day {
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_comparison_day}/nullif(${net_cost_comparison_day},0) ;;
  }
}

view: service_region_label_custom_compare_deep_dive {
  derived_table: {
    # datagroup_trigger: near_real_time
    # increment_key: "partition_date"
    # increment_offset: 0
    explore_source: gcp_detailed_billing_export_for_deep_dive {
      column: project_id {}
      column: service_description {}
      column: location_region {}
      column: all_labels {}
      column: total_net_cost {}
      column: usage_start_date {} #need to enhance by joining to a calendar table so that any day+ long spending gaps don't affect the lag functions - probably ought to do so wt the same time as the enhancement of making into a PDT
      derived_column: net_cost_comparison_day {
        sql: LAG(total_net_cost,1) OVER (PARTITION BY project_id, service_description, location_region, all_labels ORDER BY usage_start_date ASC) ;;
      }
      filters: [gcp_detailed_billing_export.is_interest_date_or_comparison_date: "Yes"] ##useful days are today, yesterday, 2,3,4,7,20 days ago - the gaps in that list explain the lags being sequential despite the field names skipping days
#partition_experiment      filters: [gcp_detailed_billing_export.partition_date_with_padding_for_comparison: "Yes"]
      bind_filters: {
        to_field: gcp_detailed_billing_export.project_id
        from_field: gcp_detailed_billing_export.project_id
      }
      bind_filters: {
        from_field: gcp_detailed_billing_export.date_filter
        to_field: gcp_detailed_billing_export.date_filter
      }
      bind_filters: {
        from_field: gcp_detailed_billing_export.comparison_date_filter
        to_field: gcp_detailed_billing_export.comparison_date_filter
      }
    }
  }
  dimension: pk {
    primary_key: yes #https://appexec.cloud.looker.com/explore/applovin-gcp-cost/service_region_label_deep_dive?fields=gcp_detailed_billing_export.pk,gcp_detailed_billing_export.count&f[gcp_detailed_billing_export.project_id]=prj-al-p-axon-max-314e&f[gcp_detailed_billing_export.usage_start_date]=2024%2F05%2F13&sorts=gcp_detailed_billing_export.count+desc+0&limit=500&column_limit=50&vis=%7B%7D&filter_config=%7B%22gcp_detailed_billing_export.project_id%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22prj-al-p-axon-max-314e%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%7D%5D%2C%22gcp_detailed_billing_export.usage_start_date%22%3A%5B%7B%22type%22%3A%22on%22%2C%22values%22%3A%5B%7B%22date%22%3A%222024-05-13T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%7D%5D%2C%22id%22%3A6%7D%5D%7D&origin=share-expanded
    sql: concat(${project_id},${service_description},${location_region},${all_labels}) ;; #should add ,${usage_start_date}
  }
  dimension: project_id {}
  dimension: service_description {}
  dimension: location_region {}
  dimension: all_labels {}
  dimension: usage_start_date {
    type: date
  }
  dimension: is_date_filter {
    type: yesno
    sql: /*xxx*/ ${usage_start_date} = date({% date_start gcp_detailed_billing_export.date_filter %}) ;;
  }
  dimension: total_net_cost_raw {
    description: ""
    value_format: "$#,##0.00"
    type: number
    sql: ${TABLE}.total_net_cost ;;
  }
  measure: total_net_cost_date_filter {
    type: sum
    value_format_name: usd
    filters: [is_date_filter: "Yes"]
    sql: ${total_net_cost_raw} ;;

  }
  measure: net_cost_comparison_day {
    value_format: "$#,##0.00"
    type: sum
    sql: coalesce(${TABLE}.net_cost_comparison_day,0) ;;
  }
  measure: absolute_increase_since_comparison_day {
    type: number
    value_format_name: usd
    sql: ${total_net_cost_date_filter}-${net_cost_comparison_day} ;;
    #(tn1+tn2)-(cy1+cy2) = (tn1-cy1)+(tn2-cy2)
  }
  measure: percent_increase_since_comparison_day {
    type: number
    value_format_name: percent_2
    sql: ${absolute_increase_since_comparison_day}/nullif(${net_cost_comparison_day},0) ;;
  }
}
