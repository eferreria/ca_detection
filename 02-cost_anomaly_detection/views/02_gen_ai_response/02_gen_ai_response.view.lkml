
include: "/02-cost_anomaly_detection/explores/project_anomalies.explore.lkml"
include: "/01-gcp_billing/explores/gcp_billing.explore.lkml"
include: "/01-gcp_billing/views/gcp_billing_export.view.lkml"

# Anomaly Source Table - This is using the Detect Anomalies Explore for the particular Anomaly Model
view: anomaly_data {
  derived_table: {
    # publish_as_db_view: yes
    explore_source: project_detect_anomalies_net_cost {
      column: usage_start_date {}
      column: project_name {}
      column: project_id {}
      column: is_anomaly {}
      column: distance_from_threshold {}
      column: anomaly_direction {}
      bind_filters: {
        from_field: anomaly_data.usage_start_date
        to_field: project_detect_anomalies_net_cost.usage_start_date
      }
      bind_filters: {
        from_field: anomaly_data.project_id
        to_field: project_detect_anomalies_net_cost.project_id
      }
      bind_filters: {
        from_field: anomaly_data.set_absolute_delta_threshold
        to_field: project_detect_anomalies_net_cost.set_absolute_delta_threshold
      }
      bind_filters: {
        from_field: anomaly_data.set_anomaly_prob_threshold
        to_field: project_detect_anomalies_net_cost.set_anomaly_prob_threshold
      }
      bind_filters: {
        from_field: anomaly_data.set_absolute_percent_threshold
        to_field: project_detect_anomalies_net_cost.set_absolute_percent_threshold
      }
      filters: {
        field: project_detect_anomalies_net_cost.is_anomaly
        value: "Yes"
      }
    }
  }

  parameter: set_absolute_delta_threshold {
    label: "Set Minimum Net Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum net cost dollar amount above or below the anomaly threshold for alerting. The default value is 100."
    type: string
    allowed_value: {value: "0" label: "$0"}
    allowed_value: {value: "250" label: "$250"}
    allowed_value: {value: "500" label: "$500"}
    allowed_value: {value: "1000" label: "$1,000"}
    allowed_value: {value: "1500" label: "$1,500"}
    allowed_value: {value: "2500" label: "$2,500"}
    allowed_value: {value: "5000" label: "$5,000"}
    allowed_value: {value: "7500" label: "$7,500"}
    allowed_value: {value: "10000" label: "$10,000"}
    default_value: "1500"
  }
  parameter: set_anomaly_prob_threshold {
    label: "Set Anomaly Probability Threshold"
    description: "Set the anomaly probability threshold [0,1). The default value is 0.99. The net cost value at a specific timestamp
    is identified as anomalous if the anomaly probability exceeds the Anomaly Probability Threshold value."
    type: string
    allowed_value: {value: "0.80" label: "80%"}
    allowed_value: {value: "0.85" label: "85%"}
    allowed_value: {value: "0.90" label: "90%"}
    allowed_value: {value: "0.95" label: "95%"}
    allowed_value: {value: "0.98" label: "98%"}
    allowed_value: {value: "0.99" label: "99%"}
    allowed_value: {value: "0.995" label: "99.5%"}
    default_value: "0.99"
  }
  parameter: set_absolute_percent_threshold {
    label: "Set Minimum % Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum percent change amount above or below the anomaly threshold for alerting. The default value is 15%."
    type: string
    allowed_value: {value: "0.0" label: "0%"}
    allowed_value: {value: "0.10" label: "10%"}
    allowed_value: {value: "0.15" label: "15%"}
    allowed_value: {value: "0.20" label: "20%"}
    allowed_value: {value: "0.25" label: "25%"}
    default_value: "0.15"
  }
  dimension: distance_from_threshold {
    type: number
    value_format_name: usd_0
    sql: round(${TABLE}.distance_from_threshold) ;;
  }
  dimension: usage_start_date {
    label: "Detect Anomalies Usage Start Date"
    description: ""
    type: date
  }
  dimension: anomaly_direction {}
  dimension: project_name {
    label: "Detect Anomalies Project Name"
    description: ""
  }
  dimension: project_id {}
  dimension: is_anomaly {
    label: "Detect Anomalies Is Anomaly (Yes / No)"
    description: "Anomaly for sensitivity"
    type: yesno
  }
}

# Queries the GCP Cost Management Explore to get the Top Costing SKUs within the Usage date for the project
view: project_sku_top_10_by_net_cost {
  derived_table: {
    explore_source: gcp_billing_export {
      column: project_id { field: gcp_billing_export.project__id}
      column: sku_id { field: gcp_billing_export.sku__id}
      column: sku_description { field: gcp_billing_export.sku__description}
      column: service_id { field: gcp_billing_export.service__id}
      column: service_description { field: gcp_billing_export.service__description}
      column: usage_start_date_2 {field: gcp_billing_export.usage_start_date}
      column: total_cost {}
      bind_filters: {
        from_field: anomaly_data.project_id
        to_field: gcp_billing_export.project__id
      }
      bind_filters: {
        from_field: anomaly_data.usage_start_date
        to_field: gcp_billing_export.usage_start_date_for_gen_ai_prompt
      }
      filters: [gcp_billing_export.partition_date_with_padding_for_top_10: "Yes"]
      sorts: [gcp_billing_export.total_cost: desc]
      limit: 10
    }
  }
  dimension: pk {
    sql: concat(${project_id},${sku_id}) ;;
  }
  dimension: project_id {
    label: "Billing Project ID"
    description: ""
  }
  dimension: service_id {
    label: "Billing Service ID"
    description: ""
  }
  dimension: service_description {
    label: "Billing Service Type"
    description: ""
  }
  dimension: sku_id {
    label: "Billing SKU ID"
    description: ""
  }
  dimension: sku_description {
    label: "Billing SKU Description"
    description: ""
  }
  dimension: total_cost {
    label: "Billing Total Net Cost"
    description: ""
    value_format: "#,##0.00"
    type: number
  }
  dimension: usage_start_date_2 {
    label: "Billing Usage Start Date (PST)"
    description: ""
    type: date
  }
}

# This refinement adds and uses a parameter which allows the anomaly date to be input but not added directly to the where clause.
# Instead, the anomaly date and the previous 4 days are what is sent to the where clause.
view: +gcp_billing_export {
  parameter: usage_start_date_for_gen_ai_prompt {
    hidden: yes
    type: date
  }

  dimension: partition_date_with_padding_for_top_10{
    hidden: yes
    type: yesno
    sql: ${usage_start_date} in (
          DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %}, day))
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -1 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval 1 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval 2 day)
          );;
  }
  dimension: partition_date_with_padding_for_service_cost_history{
    hidden: yes
    type: yesno
    sql: ${usage_start_date} in (
          DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %}, day))
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval 1 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval 2 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -1 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -2 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -3 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -4 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -5 day)
          );;
  }
  dimension: usage_start_date_and_three_prior {
    hidden: yes
    type: yesno
    sql: ${usage_start_date} in (
          DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %}, day))
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -1 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -2 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -3 day)
          , date_add(DATE(TIMESTAMP_TRUNC({% parameter usage_start_date_for_gen_ai_prompt %},day)), interval -4 day)
          );;
  }
}

# Adds the lagging days and summarizes by day, sku, service and project
view: project_sku_detail {
  derived_table: {
    explore_source: gcp_billing_export {
      column: project_id { field: gcp_billing_export.project__id}
      column: sku_id { field: gcp_billing_export.sku__id}
      column: sku_description { field: gcp_billing_export.sku__description}
      column: service_id { field: gcp_billing_export.service__id}
      column: service_description { field: gcp_billing_export.service__description}
      column: total_cost {}
      column: usage_start_date_2 { field: gcp_billing_export.usage_start_date}
      derived_column: net_cost_yesterday {
        sql: LAG(total_cost,1) OVER (PARTITION BY project_id, sku_id ORDER BY usage_start_date_2 ASC) ;;
      }
      derived_column: net_cost_two_days_ago {
        sql: LAG(total_cost,2) OVER (PARTITION BY project_id, sku_id ORDER BY usage_start_date_2 ASC) ;;
      }
      derived_column: net_cost_three_days_ago {
        sql: LAG(total_cost,3) OVER (PARTITION BY project_id, sku_id ORDER BY usage_start_date_2 ASC) ;;
      }
      bind_filters: {
        from_field: anomaly_data.project_id
        to_field: gcp_billing_export.project__id
      }
      bind_filters: {
        from_field: anomaly_data.usage_start_date
        to_field: gcp_billing_export.usage_start_date_for_gen_ai_prompt
      }
      filters: [gcp_billing_export.usage_start_date_and_three_prior: "Yes"]
      filters: [gcp_billing_export.partition_date_with_padding_for_service_cost_history: "Yes"]
    }
  }
  dimension: pk {
    primary_key: yes
    type: string
    sql: concat(${project_id},${sku_id},${usage_start_date_2}) ;;
  }
  dimension: project_id {
    label: "Billing Project ID"
  }
  dimension: sku_id {
    label: "Billing SKU ID"
  }
  dimension: sku_description {
    label: "Billing SKU Description"
  }
  dimension: service_id {
    label: "Billing Service ID"
  }
  dimension: service_description {
    label: "Billing Service Type"
  }
  dimension: total_cost {
    label: "Billing Total Net Cost"
    value_format: "#,##0.00"
    type: number
    sql: round(${TABLE}.total_cost) ;;
  }
  dimension: net_cost_yesterday {
    value_format: "#,##0.00"
    type: number
    sql: round(${TABLE}.net_cost_yesterday) ;;
  }
  dimension: net_cost_two_days_ago {
    value_format: "#,##0.00"
    type: number
    sql: round(${TABLE}.net_cost_two_days_ago) ;;
  }
  dimension: net_cost_three_days_ago {
    value_format: "#,##0.00"
    type: number
    sql: round(${TABLE}.net_cost_three_days_ago) ;;
  }
  dimension: usage_start_date_2 {
    label: "Billing Usage Start Date (PST)"
    type: date
  }
  dimension: service_sku_netcost {
    sql: concat(${service_description},': ',${sku_description}, ' had a net cost on ',${usage_start_date_2},' of $',${total_cost}
          ,ifnull(concat(', a net cost the day before of $',${net_cost_yesterday}),'')
          ,ifnull(concat(', a net cost two days before of $',${net_cost_two_days_ago}),'')
          ,ifnull(concat(', and a net cost three days before of $',${net_cost_three_days_ago}),'')
          ) ;;
  }
  measure: service_sku_netcost_list {
    type: string
    sql: string_agg(${service_sku_netcost},', ') ;;
  }
}

# combines anomaly data and GCP cost management data
explore: anomaly_data {
  hidden: yes
  join: project_sku_top_10_by_net_cost {
    type: left_outer
    sql_on: ${anomaly_data.project_id} = ${project_sku_top_10_by_net_cost.project_id}
      and ${anomaly_data.usage_start_date} = ${project_sku_top_10_by_net_cost.usage_start_date_2};;
    relationship: one_to_one
    #actually many to many, but in the use case of filtering on one anomaly at a time there will be no need for symmaggs
  }
  join: project_sku_detail {
    type: left_outer
    sql_on: ${anomaly_data.project_id} = ${project_sku_detail.project_id}
      and ${project_sku_top_10_by_net_cost.sku_id} = ${project_sku_detail.sku_id};;
    relationship: one_to_one
    #actually many to many, but in the use case of filtering on one anomaly at a time there will be no need for symmaggs
  }
}

#View name is set up so that the bind filters will work like they do in gen_ai explore
# explore: gen_ai_input {
#   from: gen_ai_input
#   view_name: gen_ai
# }
# Used in order to bind the parameters back to anomaly data to get a dynamic result based on user input
view: gen_ai_input {
  derived_table: {
    explore_source: anomaly_data {
      column: project_name {}
      column: project_id {}
      column: usage_start_date {}
      column: anomaly_direction {}
      column: distance_from_threshold {}
      column: service_sku_netcost_list { field: project_sku_detail.service_sku_netcost_list }
      derived_column: prompt {
        # Expect to modify/improve this regularly to hone the gen ai response
        sql: concat('On ', extract(date from usage_start_date),' there was a cost anomaly of $',distance_from_threshold
                ,' that went ', anomaly_direction
                ,' in the Google Cloud Platform project named ',project_name,'.'
                ,'  This is a list of the top 5 skus by net cost on that day, along with their net costs from the 3 previous days: ',service_sku_netcost_list
                ,'. Start with an explanation of which service: sku likely caused it and why it is most likely.'
                ,' Given the services running on that project, provide a concise explanation of the anomaly,'
                ,' along with a bulleted list of up to three tips on what could be done to prevent further unwanted overspending.'
                ,' Do not suggest budget alerts as a possible solution to the cost anomaly.'
                ,' Do not suggest purchasing a committed use discount as a possible solution to the cost anomaly.'
                ,' Do not suggest purchasing BigQuery Slots as a possible solution to the cost anomaly as a possible solution to the cost anomaly.'
                ,' Do not suggest looking at cloud costs in the google cloud console as a possible solution to the cost anomaly.'
                ,' Do not suggest creating an Object Lifecycle Management policy as a possible solution to the cost anomaly.'
                ,' Always include the distance_from_threshold and project_name.'
                ,' Keep the response under 150 words.'
                ,' Follow this template:'
                ,' A description of the anomaly.'
                ,' The likely causes of the anomaly.'
                ,' Reason why that is the likely cause.'
                ,' Introduce the list of potential corrective actions: '
                ,'<br>• Corrective action 1'
                ,'<br>• Corrective action 2'
                ,'<br>• Corrective action 3'
          )  ;;
      }
      bind_filters: {
        from_field: gen_ai.project_id
        to_field: anomaly_data.project_id
      }
      bind_filters: {
        from_field: gen_ai.usage_start_date
        to_field: anomaly_data.usage_start_date
      }
      bind_filters: {
        from_field:  gen_ai.usage_start_date
        to_field: project_sku_detail.usage_start_date_2
      }
      bind_filters: {
        from_field: gen_ai.set_absolute_delta_threshold
        to_field: anomaly_data.set_absolute_delta_threshold
      }
      bind_filters: {
        from_field: gen_ai.set_anomaly_prob_threshold
        to_field: anomaly_data.set_anomaly_prob_threshold
      }
      bind_filters: {
        from_field: gen_ai.set_absolute_percent_threshold
        to_field: anomaly_data.set_absolute_percent_threshold
      }
    }
  }

  parameter: set_absolute_delta_threshold {
    label: "Set Minimum Net Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum net cost dollar amount above or below the anomaly threshold for alerting. The default value is 100."
    type: string
    allowed_value: {value: "0" label: "$0"}
    allowed_value: {value: "250" label: "$250"}
    allowed_value: {value: "500" label: "$500"}
    allowed_value: {value: "1000" label: "$1,000"}
    allowed_value: {value: "1500" label: "$1,500"}
    allowed_value: {value: "2500" label: "$2,500"}
    allowed_value: {value: "5000" label: "$5,000"}
    allowed_value: {value: "7500" label: "$7,500"}
    allowed_value: {value: "10000" label: "$10,000"}
    default_value: "1500"
  }
  parameter: set_anomaly_prob_threshold {
    label: "Set Anomaly Probability Threshold"
    description: "Set the anomaly probability threshold [0,1). The default value is 0.99. The net cost value at a specific timestamp
    is identified as anomalous if the anomaly probability exceeds the Anomaly Probability Threshold value."
    type: string
    allowed_value: {value: "0.80" label: "80%"}
    allowed_value: {value: "0.85" label: "85%"}
    allowed_value: {value: "0.90" label: "90%"}
    allowed_value: {value: "0.95" label: "95%"}
    allowed_value: {value: "0.98" label: "98%"}
    allowed_value: {value: "0.99" label: "99%"}
    allowed_value: {value: "0.995" label: "99.5%"}
    default_value: "0.99"
  }
  parameter: set_absolute_percent_threshold {
    label: "Set Minimum % Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum percent change amount above or below the anomaly threshold for alerting. The default value is 15%."
    type: string
    allowed_value: {value: "0.0" label: "0%"}
    allowed_value: {value: "0.10" label: "10%"}
    allowed_value: {value: "0.15" label: "15%"}
    allowed_value: {value: "0.20" label: "20%"}
    allowed_value: {value: "0.25" label: "25%"}
    default_value: "0.15"
  }

  dimension: project_name {}
  dimension: project_id {}
  dimension: usage_start_date {
    type: date
  }
  dimension: distance_from_threshold {
    value_format: "$#,##0"
    type: number
  }
  dimension: service_sku_netcost_list {}
  dimension: prompt {}
}

explore: gen_ai {
  hidden: yes
  label: "Gen AI"
  always_filter: {
    filters: [gen_ai.project_id: ""]
    filters: [gen_ai.usage_start_date: ""]
  }
}

#This actually generates the anomaly remediation suggestions response
view: gen_ai {
  label: "Gen AI"
  sql_table_name: ML.GENERATE_TEXT(
                  MODEL `eaf-barong-da-qa.bqml_testbed.llm_model`,
                  (
                  SELECT * from  ${gen_ai_input.SQL_TABLE_NAME}
                  ),
                  STRUCT(512 AS max_output_tokens
                        , 0.3 AS temperature
                        , 20 AS top_k
                        , 0.8 AS top_p
                        , TRUE as flatten_json_output)
                  )
    ;;

  dimension: ml_generate_text_llm_result {
    label: "ML Generate Text LLM Result"
    html:
    <div style="width:100%">
      <table style="table-layout:fixed;text-align:center; font-size:14px; width:80%; color:black">
        <tr>
        <td style="word-wrap:break-word; white-space:normal; text-align:center; display:inline-block; overflow:auto">{{ value }}</td>
        </tr>
        </table>
        </div>
    ;;
  }
  parameter: set_absolute_delta_threshold {
    label: "Set Minimum Net Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum net cost dollar amount above or below the anomaly threshold for alerting. The default value is 100."
    type: string
    allowed_value: {value: "0" label: "$0"}
    allowed_value: {value: "250" label: "$250"}
    allowed_value: {value: "500" label: "$500"}
    allowed_value: {value: "1000" label: "$1,000"}
    allowed_value: {value: "1500" label: "$1,500"}
    allowed_value: {value: "2500" label: "$2,500"}
    allowed_value: {value: "5000" label: "$5,000"}
    allowed_value: {value: "7500" label: "$7,500"}
    allowed_value: {value: "10000" label: "$10,000"}
    default_value: "1500"
  }
  parameter: set_anomaly_prob_threshold {
    label: "Set Anomaly Probability Threshold"
    description: "Set the anomaly probability threshold [0,1). The default value is 0.99. The net cost value at a specific timestamp
    is identified as anomalous if the anomaly probability exceeds the Anomaly Probability Threshold value."
    type: string
    allowed_value: {value: "0.80" label: "80%"}
    allowed_value: {value: "0.85" label: "85%"}
    allowed_value: {value: "0.90" label: "90%"}
    allowed_value: {value: "0.95" label: "95%"}
    allowed_value: {value: "0.98" label: "98%"}
    allowed_value: {value: "0.99" label: "99%"}
    allowed_value: {value: "0.995" label: "99.5%"}
    default_value: "0.99"
  }
  parameter: set_absolute_percent_threshold {
    label: "Set Minimum % Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum percent change amount above or below the anomaly threshold for alerting. The default value is 15%."
    type: string
    allowed_value: {value: "0.0" label: "0%"}
    allowed_value: {value: "0.10" label: "10%"}
    allowed_value: {value: "0.15" label: "15%"}
    allowed_value: {value: "0.20" label: "20%"}
    allowed_value: {value: "0.25" label: "25%"}
    default_value: "0.15"
  }

  dimension: ml_generate_text_status {}
  dimension: ml_generate_text_rai_result {
    sql: to_json_string(${TABLE}.ml_generate_text_rai_result) ;;
  }
  dimension: prompt {}
  dimension: project_name {}
  dimension: project_id {}

  dimension: is_anomaly {
    description: "Anomaly for sensitivity"
    type: yesno
  }
  dimension: usage_start_date {
    type: date
  }
  dimension: distance_from_threshold {
    value_format: "$#,##0"
    type: number
  }
  dimension: service_sku_netcost_list {}
}
