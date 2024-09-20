# #This file includes what is necessary to power Look 3 "Unalerted Anomalies" - the list of anomalies which need to generate alerts

include: "/views/gcp_billing/gcp_billing_export.view.lkml"
include: "/views/cost_anomaly/04_detect_anomalies_net_cost.view.lkml"
include: "00_cost_anomaly_alert_log.view"
include: "00_gcp_contacts_mapping.view"
include: "/models/cost_anomaly_detection.model.lkml"
include: "/config/datagroups.lkml"
include: "/views/cost_anomaly_alert/00_anomaly_threshold_settings.view.lkml"

# # This refinement informs the explore which anomalies have already triggered a successful alert
#.# and adds the custom threshold feature
# # and adds the project owners to the explore
explore: +project_detect_anomalies_net_cost {
  join: cost_anomaly_alert_log_ranked {
    sql_on: ${project_detect_anomalies_net_cost.project_id} = ${cost_anomaly_alert_log_ranked.project_id}
      and ${project_detect_anomalies_net_cost.usage_start_date} = ${cost_anomaly_alert_log_ranked.usage_start_raw} ;;
    sql_where: ${cost_anomaly_alert_log_ranked.is_most_recent_alert_log} ;;
    relationship: one_to_one #would be a one_to_many if not for the sql_where
  }
  join: cost_anomaly_alert_log {
    sql_on: ${cost_anomaly_alert_log_ranked.project_id} = ${cost_anomaly_alert_log.project_id}
      and ${cost_anomaly_alert_log_ranked.usage_start_date} = ${cost_anomaly_alert_log.usage_start_raw} ;;
    relationship: one_to_one
  }
  join: project_period_anomaly_threshold_settings_ranked {
    view_label: "Anomaly Alert Threshold Settings"
    type: left_outer
    sql_on: ${project_detect_anomalies_net_cost.project_id} = ${project_period_anomaly_threshold_settings_ranked.project_id}
      and ${project_detect_anomalies_net_cost.usage_start_date}= ${project_period_anomaly_threshold_settings_ranked.calendar_date};;
    relationship: one_to_one
  }
  join: gcp_contacts_mapping {
    type: left_outer
    sql_on: ${project_detect_anomalies_net_cost.project_id} = ${gcp_contacts_mapping.project_id} ;;
    relationship: many_to_one
  }
}

# Uncomment to troubleshoot the unalerted anomalies view
explore: unalerted_anomalies {
  hidden: yes
}

# # This view powers the scheduled query in bq which triggers the alerting function
view: unalerted_anomalies {
  #https://<<domain>>/explore/applovin-gcp-cost/project_detect_anomalies_net_cost?fields=project_detect_anomalies_net_cost.project_name,project_detect_anomalies_net_cost.usage_start_date,project_detect_anomalies_net_cost.absolute_distance_from_threshold,project_detect_anomalies_net_cost.absolute_percent_from_threshold,project_detect_anomalies_net_cost.upper_bound,project_detect_anomalies_net_cost.total_cost,gcp_contacts_mapping.email_recipient_list,gcp_contacts_mapping.slack_recipient_list&f[project_detect_anomalies_net_cost.is_anomaly]=Yes&f[project_detect_anomalies_net_cost.anomaly_direction]=%E2%AC%86%EF%B8%8F+Above+Upper+Threshold&f[project_detect_anomalies_net_cost.usage_start_date]=30+days&f[project_detect_anomalies_net_cost.set_anomaly_prob_threshold]=0.99&f[project_period_anomaly_threshold_settings_ranked.meets_all_threshold_requirements]=Yes&f[cost_anomaly_alert_log.anomaly_handled]=No&sorts=project_detect_anomalies_net_cost.usage_start_date+desc&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A12%2C%22rows_font_size%22%3A12%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22type%22%3A%22looker_grid%22%2C%22defaults_version%22%3A1%7D&filter_config=%7B%22project_detect_anomalies_net_cost.is_anomaly%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A226%7D%5D%2C%22project_detect_anomalies_net_cost.anomaly_direction%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22%E2%AC%86%EF%B8%8F+Above+Upper+Threshold%22%7D%2C%7B%7D%5D%2C%22id%22%3A227%7D%5D%2C%22project_detect_anomalies_net_cost.usage_start_date%22%3A%5B%7B%22type%22%3A%22past%22%2C%22values%22%3A%5B%7B%22constant%22%3A%2230%22%2C%22unit%22%3A%22day%22%7D%2C%7B%7D%5D%2C%22id%22%3A228%7D%5D%2C%22project_detect_anomalies_net_cost.set_anomaly_prob_threshold%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%220.99%22%7D%2C%7B%7D%5D%2C%22id%22%3A229%7D%5D%2C%22project_period_anomaly_threshold_settings_ranked.meets_all_threshold_requirements%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22Yes%22%7D%2C%7B%7D%5D%2C%22id%22%3A230%7D%5D%2C%22cost_anomaly_alert_log.anomaly_handled%22%3A%5B%7B%22type%22%3A%22is%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22No%22%7D%2C%7B%7D%5D%2C%22id%22%3A231%7D%5D%7D&dynamic_fields=%5B%5D&origin=share-expanded
  derived_table: {
    datagroup_trigger: near_real_time #also triggering right after anomalies are handled
    publish_as_db_view: yes # in bigquery this creates stable view to power scheduled query (which triggers alerting cloud function)
    explore_source: project_detect_anomalies_net_cost {
      column: project_id {field:project_detect_anomalies_net_cost.project_id}
      column: project_name {field:project_detect_anomalies_net_cost.project_name}
      column: usage_start_date {field:project_detect_anomalies_net_cost.usage_start_date}
      column: absolute_distance_from_threshold {field:project_detect_anomalies_net_cost.absolute_distance_from_threshold}
      column: absolute_percent_from_threshold {field:project_detect_anomalies_net_cost.absolute_percent_from_threshold}
      column: upper_bound {field:project_detect_anomalies_net_cost.upper_bound}
      column: total_cost {field:project_detect_anomalies_net_cost.total_cost}
      column: email_recipient_list {field:gcp_contacts_mapping.email_recipient_list}
      column: slack_recipient_list {field:gcp_contacts_mapping.slack_recipient_list}
      filters: [project_detect_anomalies_net_cost.is_anomaly: "Yes"]
      filters: [project_detect_anomalies_net_cost.anomaly_direction: "⬆️ Above Upper Threshold"]
      filters: [project_detect_anomalies_net_cost.usage_start_date: "30 days"] #might only have the past 30 days in detailed billing export, so only alerting on anomalies which can be supported
      filters: [project_detect_anomalies_net_cost.set_anomaly_prob_threshold: "0.99"]
      filters: [cost_anomaly_alert_log.anomaly_handled: "No"] #This is No when false or null
      filters: [project_period_anomaly_threshold_settings_ranked.meets_all_threshold_requirements: "Yes"]
    }
  }
  dimension: project_id {
    label: "Detect Anomalies Project ID"
    description: ""
  }
  dimension: project_name {}
  dimension: absolute_distance_from_threshold {type:number}
  dimension: absolute_percent_from_threshold {type:number}
  dimension: upper_bound {type:number}
  dimension: total_cost {type:number}

  dimension: usage_start_date {
    label: "Detect Anomalies Usage Start Date"
    description: "The day in which the anomaly occurred"
    type: date
  }
  dimension: email_recipient_list {}
  dimension: slack_recipient_list {}
}


#This table creates a record for every anomaly over 99% probability, regardless of alerting threshold settings
#explore: gcp_cost_anomalies {}
#https://4e605514-217d-45dc-b025-a98e3a3870c6.looker.app/explore/gcp_cost_anomaly_detection/project_detect_anomalies_net_cost?qid=eY2VkuQekqkpcHQ0NSa0LO
view: gcp_cost_anomalies {
  derived_table: {
    datagroup_trigger: near_real_time
    publish_as_db_view: yes
    explore_source: project_detect_anomalies_net_cost {
      column: usage_start_date {}
      column: project_id {}
      column: project_name {}
      column: total_cost {}
      column: upper_bound {}
      column: absolute_distance_from_threshold {}
      column: absolute_percent_from_threshold {}
      column: anomaly_direction {}
      column: anomaly_probability {}
      filters: {
        field: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
        value: "0.99" #minimum probability to log as any likelihood the spend is anomlous
      }
      filters: {
        field: project_detect_anomalies_net_cost.set_absolute_percent_threshold
        value: "0.0" #threshold settings switched off for this table, only relevant to alerting
      }
      filters: {
        field: project_detect_anomalies_net_cost.set_absolute_delta_threshold
        value: "0" #threshold settings switched off for this table, only relevant to alerting
      }
      filters: {
        field: project_detect_anomalies_net_cost.is_anomaly
        value: "Yes"
      }
      filters: {
        field: project_detect_anomalies_net_cost.anomaly_direction
        value: "⬆️ Above Upper Threshold"
      }
    }
  }
  dimension: usage_start_date {
    label: "Detect Anomalies Usage Start Date"
    description: "The day in which the anomaly occurred"
    type: date
  }
  dimension: project_id {
    label: "Detect Anomalies Project ID"
    description: ""
  }
  dimension: project_name {
    label: "Detect Anomalies Project Name"
    description: ""
  }
  dimension: total_cost {
    label: "Detect Anomalies Total Cost"
    description: "Actual spend includes cost, EDP and CUD credit"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: upper_bound {
    label: "Detect Anomalies Upper Bound"
    description: "The highest dollar value for which the solution would not classify spend as an anomaly"
    value_format: "$#,##0.00"
    type: number
  }
  dimension: absolute_distance_from_threshold {
    label: "Detect Anomalies Absolute Distance From Threshold"
    description: "Dollar value that actual spend differed from the upper bound spend (a positive value indicates that actual spend > expected spend)"
    value_format: "$#.00;($#.00)"
    type: number
  }
  dimension: absolute_percent_from_threshold {
    label: "Detect Anomalies Absolute Percent From Threshold"
    description: "Percent that actual spend deviated from expected spend (a positive percentage value indicates that actual spend > expected spend)"
    value_format: "#.00%;(#.00%)"
    type: number
  }
  dimension: anomaly_direction {
    label: "Detect Anomalies Anomaly Direction"
    description: "Whether spend exceeded the predicted threshold because it was too high or too low"
  }
  dimension: anomaly_probability {
    label: "Detect Anomalies Anomaly Probability"
    description: "Likelihood that the spend occurrence is a true anomaly"
    value_format: "#,##0.00%"
    type: number
  }
}
