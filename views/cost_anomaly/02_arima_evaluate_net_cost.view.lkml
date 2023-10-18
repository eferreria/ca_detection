view: arima_evaluate_net_cost {
  sql_table_name: `@{GCP_PROJECT}.@{BQML_DATASET}.ARIMA_EVALUATE_net_cost_forecast` ;;

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension_group: date_created {
    type: time
    label: "Created"
    timeframes: [raw,time,date,month,year]
    sql: ${TABLE}.date_created ;;
  }

  dimension: date_created_string {
    #add to drill as string so no impact on sort
    hidden: no
    group_label: "Created Date"
    label: "Created Time (as string)"
    type: string
    sql: FORMAT_TIMESTAMP("%F %T", ${TABLE}.date_created, 'America/New_York') ;;
  }

  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date_raw
    sql: ${model_name} || ${date_created_raw} || ${project_name} ;;
  }

  dimension: is_latest_model_version {
    type: yesno
    label: "Current Model"
    description: "Current Model training used for Anomaly Detection and Explain Forecast"
    sql: ${TABLE}.is_latest_model_version;;
  }

  dimension: ar_coefficients {
    type: string
    label: "AR Coefficients"
    description: "The autoregressive coefficients, which corresponds to non-seasonal p."
    sql: ARRAY_TO_STRING(ARRAY(select CAST(coef as STRING) from UNNEST(ar_coefficients) coef),",") ;;
  }

  dimension: ma_coefficients {
    type: string
    label: "MA Coefficients"
    description: "The moving-average coefficients, which corresponds to non-seasonal q."
    sql: ARRAY_TO_STRING(ARRAY(select CAST(coef as STRING) from UNNEST(ma_coefficients) coef),",") ;;
  }

  dimension: intercept_or_drift {
    type: number
    label: "Intercept or Drift"
    description: "The constant term of the ARIMA model"
    sql: ${TABLE}.intercept_or_drift ;;
  }

  dimension: non_seasonal_p {
    type: number
    sql: ${TABLE}.non_seasonal_p ;;
  }

  dimension: non_seasonal_d {
    type: number
    sql: ${TABLE}.non_seasonal_d ;;
  }

  dimension: non_seasonal_q {
    type: number
    sql: ${TABLE}.non_seasonal_q ;;
  }

  dimension: has_drift {
    type: yesno
    sql: ${TABLE}.has_drift ;;
  }

  dimension: log_likelihood {
    type: number
    sql: ${TABLE}.log_likelihood ;;
    value_format_name: decimal_1
  }

  dimension: aic {
    label: "AIC"
    type: number
    sql: ${TABLE}.AIC ;;
    value_format_name: decimal_1
  }

  dimension: variance {
    type: number
    sql: ${TABLE}.variance ;;
    value_format_name: decimal_1
  }

  dimension: seasonal_periods {
    type: string
    sql:  ARRAY_TO_STRING(${TABLE}.seasonal_periods, ", ") ;;
  }

  dimension: has_holiday_effect {
    type: yesno
    sql: ${TABLE}.has_holiday_effect ;;
  }

  dimension: has_spikes_and_dips {
    type: yesno
    sql: ${TABLE}.has_spikes_and_dips ;;
  }

  dimension: has_step_changes {
    type: yesno
    sql: ${TABLE}.has_step_changes ;;
  }

  dimension: error_message {
    type: string
    sql: ${TABLE}.error_message ;;
  }

  measure: average_aic {
    type:average
    group_label: "AIC"
    label: "Average AIC"
    sql: ${aic} ;;
    value_format_name: decimal_1
  }

  measure: min_aic {
    type: min
    group_label: "AIC"
    label: "Min AIC"
    sql: ${aic} ;;
    value_format_name: decimal_1
  }

  measure: max_aic {
    type: max
    group_label: "AIC"
    label: "Max AIC"
    sql: ${aic} ;;
    value_format_name: decimal_1
  }

  measure: median_aic {
    type: median
    group_label: "AIC"
    label: "Median AIC"
    sql: ${aic} ;;
    value_format_name: decimal_1
  }

  measure: ptile25_aic {
    type: percentile
    percentile: 25
    group_label: "AIC"
    label: "25th Percentile AIC"
    sql: ${aic} ;;
    value_format_name: decimal_1
  }

  measure: ptile75_aic {
    type: percentile
    percentile: 75
    group_label: "AIC"
    label: "75th Percentile AIC"
    sql: ${aic} ;;
    value_format_name: decimal_1
  }

  measure: average_log_likelihood {
    type:average
    sql: ${log_likelihood} ;;
    value_format_name: decimal_1
  }

  measure: average_variance {
    type:average
    sql: ${variance} ;;
    value_format_name: decimal_1
  }
}


# view: arima_evaluate_net_cost {
#   sql_table_name: `@{GCP_PROJECT}.@{BQML_DATASET}.ARIMA_EVALUATE_net_cost_forecast` ;;

#   dimension: model_name {
#     type: string
#     sql: ${TABLE}.model_name ;;
#   }

#   dimension_group: date_created {
#     type: time
#     label: "Created"
#     timeframes: [raw,time,date,month,year]
#     sql: ${TABLE}.date_created ;;
#   }

#   dimension: date_created_string {
#     #add to drill as string so no impact on sort
#     hidden: no
#     group_label: "Created Date"
#     label: "Created Time (as string)"
#     type: string
#     sql: FORMAT_TIMESTAMP("%F %T", ${TABLE}.date_created, 'America/New_York') ;;
#   }

#   dimension: project_name {
#     type: string
#     sql: ${TABLE}.project_name ;;
#   }

#   dimension: pk {
#     primary_key: yes
#     hidden: yes
#     type: date_raw
#     sql: ${model_name} || ${date_created_raw} || ${project_name} ;;
#   }

#   dimension: is_latest_model_version {
#     type: yesno
#     label: "Current Model"
#     description: "Current Model training used for Anomaly Detection and Explain Forecast"
#     sql: ${TABLE}.is_latest_model_version;;
#   }

#   dimension: ar_coefficients {
#     type: string
#     label: "AR Coefficients"
#     description: "The autoregressive coefficients, which corresponds to non-seasonal p."
#     sql: ARRAY_TO_STRING(ARRAY(select CAST(coef as STRING) from UNNEST(ar_coefficients) coef),",") ;;
#   }

#   dimension: ma_coefficients {
#     type: string
#     label: "MA Coefficients"
#     description: "The moving-average coefficients, which corresponds to non-seasonal q."
#     sql: ARRAY_TO_STRING(ARRAY(select CAST(coef as STRING) from UNNEST(ma_coefficients) coef),",") ;;
#   }

#   dimension: intercept_or_drift {
#     type: number
#     label: "Intercept or Drift"
#     description: "The constant term of the ARIMA model"
#     sql: ${TABLE}.intercept_or_drift ;;
#   }

#   dimension: non_seasonal_p {
#     type: number
#     sql: ${TABLE}.non_seasonal_p ;;
#   }

#   dimension: non_seasonal_d {
#     type: number
#     sql: ${TABLE}.non_seasonal_d ;;
#   }

#   dimension: non_seasonal_q {
#     type: number
#     sql: ${TABLE}.non_seasonal_q ;;
#   }

#   dimension: has_drift {
#     type: yesno
#     sql: ${TABLE}.has_drift ;;
#   }

#   dimension: log_likelihood {
#     type: number
#     sql: ${TABLE}.log_likelihood ;;
#     value_format_name: decimal_1
#   }

#   dimension: aic {
#     label: "AIC"
#     type: number
#     sql: ${TABLE}.AIC ;;
#     value_format_name: decimal_1
#   }

#   dimension: variance {
#     type: number
#     sql: ${TABLE}.variance ;;
#     value_format_name: decimal_1
#   }

#   dimension: seasonal_periods {
#     type: string
#     sql:  ARRAY_TO_STRING(${TABLE}.seasonal_periods, ", ") ;;
#   }

#   dimension: has_holiday_effect {
#     type: yesno
#     sql: ${TABLE}.has_holiday_effect ;;
#   }

#   dimension: has_spikes_and_dips {
#     type: yesno
#     sql: ${TABLE}.has_spikes_and_dips ;;
#   }

#   dimension: has_step_changes {
#     type: yesno
#     sql: ${TABLE}.has_step_changes ;;
#   }

#   dimension: error_message {
#     type: string
#     sql: ${TABLE}.error_message ;;
#   }

#   measure: average_aic {
#     type:average
#     group_label: "AIC"
#     label: "Average AIC"
#     sql: ${aic} ;;
#     value_format_name: decimal_1
#   }

#   measure: min_aic {
#     type: min
#     group_label: "AIC"
#     label: "Min AIC"
#     sql: ${aic} ;;
#     value_format_name: decimal_1
#   }

#   measure: max_aic {
#     type: max
#     group_label: "AIC"
#     label: "Max AIC"
#     sql: ${aic} ;;
#     value_format_name: decimal_1
#   }

#   measure: median_aic {
#     type: median
#     group_label: "AIC"
#     label: "Median AIC"
#     sql: ${aic} ;;
#     value_format_name: decimal_1
#   }

#   measure: ptile25_aic {
#     type: percentile
#     percentile: 25
#     group_label: "AIC"
#     label: "25th Percentile AIC"
#     sql: ${aic} ;;
#     value_format_name: decimal_1
#   }

#   measure: ptile75_aic {
#     type: percentile
#     percentile: 75
#     group_label: "AIC"
#     label: "75th Percentile AIC"
#     sql: ${aic} ;;
#     value_format_name: decimal_1
#   }

#   measure: average_log_likelihood {
#     type:average
#     sql: ${log_likelihood} ;;
#     value_format_name: decimal_1
#   }

#   measure: average_variance {
#     type:average
#     sql: ${variance} ;;
#     value_format_name: decimal_1
#   }

# }
