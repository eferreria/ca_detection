view: cost_anomaly_alert_log {
  sql_table_name: `@{GCP_PROJECT}.@{BQML_DATASET}.cost_anomaly_alert_log` ;;

  dimension: pk {
    hidden: yes
    sql: concat(${project_id},${usage_start_raw},${alert_log_raw}) ;;
    # sql: concat(coalesce(${project_id},'No Project ID'),coalesce(${usage_start_raw::string},'No Usage Date'),coalesce(${alert_log_raw::string},'No Alert Log Timestamp')) ;;
    primary_key: yes #shouldn't actually send two alerts for one anomaly, so alert_log_raw might be overkill.
    # But i suppose it is possible so it is included here
  }
  dimension_group: alert_log {
    type: time
    description: "Timestamp (UTC) of when alert email was sent"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.alert_log_timestamp ;;
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  dimension_group: usage_start {
    type: time
    description: "anomaly date in pacific timezone"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date ;;
  }

  dimension: email_recipient_list {
    type: string
  }
  dimension: slack_recipient_list {
    type: string
  }
  dimension: email_alert_success {
    type: yesno
    sql: ${TABLE}.email_alert_success ;;
  }
  dimension: slack_alert_success {
    type: yesno
    sql: ${TABLE}.slack_alert_success ;;
  }
  dimension: alert_suppressed {
    type: yesno
    sql: ${TABLE}.alert_suppressed ;;
  }

  dimension: expected_spend {
    type: number
    value_format_name: usd
  }

  dimension: actual_cost {
    type: number
    value_format_name: usd
  }

  dimension: absolute_distance_from_threshold {
    type: number
    value_format_name: usd
  }

  dimension: absolute_percent_from_threshold {
    type: number
    value_format_name: percent_2
  }

  dimension: anomaly_handled {
    # considered handled if the anomaly was suppressed because it had already been alerted once in the previous 7 days (or longer, if anomaly is ongoing without a 7+ day gap),
    # or at least the email went out. If slack failed, will still be considered handled.
    type: yesno
    sql: ${alert_suppressed} or ${email_alert_success} ;;
    # Use below sql to only consider it handled if either suppressed or both alerts were successful. Could result in many emails while retrying the slack alert (they are handled in same function).
    # sql: ${alert_suppressed} or (${email_alert_success} and ${slack_alert_success}) ;;
  }
  dimension: anomaly_id {}
  dimension: service_from_anomaly_id {
    #relies on the service being after the second tilde in the anomaly ID string
    #the key is this gets everything after a tilde: SUBSTR(str, INSTR(str, '~') + 1)
    sql: SUBSTR(SUBSTR(${anomaly_id}, INSTR(${anomaly_id}, '~') + 1), INSTR(SUBSTR(${anomaly_id}, INSTR(${anomaly_id}, '~') + 1), '~') + 1);;
  }
  measure: count {
    type: count
    drill_fields: [project_id, count]
  }
}

explore: cost_anomaly_alert_log {hidden: yes
  join: cost_anomaly_alert_log_ranked {
    sql_on: ${cost_anomaly_alert_log.alert_log_raw} = ${cost_anomaly_alert_log_ranked.alert_log_raw}
          and ${cost_anomaly_alert_log.project_id} = ${cost_anomaly_alert_log_ranked.project_id}
          and ${cost_anomaly_alert_log.usage_start_raw} = ${cost_anomaly_alert_log_ranked.usage_start_raw};;
    relationship: one_to_one
  }
}
# This allows using only the most recent alert log record for a given anomaly
view: cost_anomaly_alert_log_ranked {
  derived_table: {
    explore_source: cost_anomaly_alert_log {
      column: alert_log_timestamp {field:cost_anomaly_alert_log.alert_log_raw}
      column: project_id {field:cost_anomaly_alert_log.project_id}
      column: usage_start_date {field:cost_anomaly_alert_log.usage_start_raw}
      derived_column: rank {
        sql: row_number() over (partition by project_id, usage_start_date order by alert_log_timestamp desc)  ;;
      }
    }
  }
  dimension: pk {
    hidden: yes
    sql: concat(${project_id},${usage_start_raw},${alert_log_raw}) ;;
    # sql: concat(coalesce(${project_id},'No Project ID'),coalesce(${usage_start_raw::string},'No Usage Date'),coalesce(${alert_log_raw::string},'No Alert Log Timestamp')) ;;
    primary_key: yes #shouldn't actually send two alerts for one anomaly, so alert_log_raw might be overkill.
    # But i suppose it is possible so it is included here
  }
  dimension_group: alert_log {
    type: time
    description: "Timestamp (UTC) of when alert email was sent"
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.alert_log_timestamp ;;
  }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  dimension_group: usage_start {
    type: time
    description: "anomaly date in pacific timezone"
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.usage_start_date ;;
  }
  dimension: rank {
    type: number
  }
  dimension: is_most_recent_alert_log {
    type: yesno
    sql: ifnull(${rank},1) = 1 ;;
  }

}
