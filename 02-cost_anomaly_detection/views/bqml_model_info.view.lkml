view: bqml_model_info {

  label: "BQML Model Info"

  sql_table_name: `@{GCP_PROJECT}.@{BQML_DATASET}.ANOMALY_DETECTION_BQML_MODEL_INFO` ;;

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date_raw
    sql: ${model_name}||${date_created_raw} ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: model_type {
    type: string
    sql: ${TABLE}.model_type ;;
  }

  dimension_group: date_created {
    type: time
    label: "Created"
    timeframes: [raw,time,date,month,hour_of_day]
    sql: ${TABLE}.date_created ;;
  }

  dimension: is_latest_model_version {
    type: yesno
    label: "Current Model"
    description: "Current Model training used for Anomaly Detection and Explain Forecast"
    sql: ${TABLE}.is_latest_model_version;;
  }

  dimension: horizon {
    type: number
    sql: ${TABLE}.horizon ;;
  }

  dimension: holiday_region {
    type: string
    sql: ${TABLE}.holiday_region ;;
  }

  dimension: looker_connection {
    type: string
    sql: ${TABLE}.looker_connection ;;
  }

  dimension: bigquery_dataset {
    type: string
    sql: ${TABLE}.bigquery_dataset ;;
  }

  dimension: min_business_date {
    label: "Min Business Date in Training Data"
    type: date
    sql: ${TABLE}.min_usage_start_date ;;
    convert_tz: no
  }

  dimension: max_business_date {
    label: "Max Business Date in Training Data"
    type: date
    sql: ${TABLE}.max_usage_start_date ;;
    convert_tz: no
  }

  dimension: duration_ms {
    type: number
    hidden: yes
    sql: ${TABLE}.duration_ms ;;
  }

  dimension: duration_in_min {
    label: "Duration in Minutes"
    description: "For times series models, duration is the total time cost for the entire process."
    type: number
    sql: ${duration_ms} / (1000 * 60) ;;
    value_format_name: decimal_1
  }

  ##array of structs that is unnested in view bqml_model_info__feature_info
  dimension: feature_info {
    hidden: yes
    sql: ${TABLE}.feature_info ;;
  }

# todo: fix dimensions
  # dimension: site_count {
  #   type: number
  #   sql: (select max(category_count) from unnest(${TABLE}.feature_info) f where f.input = 'site_num') ;;
  # }

  # dimension: min_net_sales {
  #   type: number
  #   sql: (select min(min) from unnest(${TABLE}.feature_info) f where f.input = 'net_sales') ;;
  #   value_format_name: usd
  # }

  # dimension: max_net_sales {
  #   type: number
  #   sql: (select max(max) from unnest(${TABLE}.feature_info) f where f.input = 'net_sales') ;;
  #   value_format_name: usd
  # }

  # dimension: median_net_sales {
  #   type: number
  #   sql: (select max(median) from unnest(${TABLE}.feature_info) f where f.input = 'net_sales') ;;
  #   value_format_name: usd
  # }

  measure: model_count {
    type: count
    drill_fields: [detail*]
  }

  measure: avg_duration_in_min {
    label: "Duration in Minutes"
    description: "For times series models, duration is the total time cost for the entire process."
    type: average
    sql: ${duration_in_min} ;;
    value_format_name: decimal_1
  }

  set: detail {
    fields: [
      model_name,
      model_type,
      date_created_time,
      horizon,
      holiday_region,
      looker_connection,
      bigquery_dataset
    ]
  }
}
