view: project_period_anomaly_threshold_settings {
  sql_table_name: `@{GCP_PROJECT}.@{BQML_DATASET}.anomaly_threshold_settings` ;;

  dimension: absolute_delta_threshold {
    type: number
    sql: ${TABLE}.absolute_delta_threshold ;;
  }
  dimension: absolute_percent_threshold {
    type: number
    sql: ${TABLE}.absolute_percent_threshold ;;
  }
  # Cannot use this feature since the results must be run before the other threshold settings are checked.
  # A different prob thereshold will change the upper bound, which will then change the delta compared to the actual (anomalous) spend
  # ...which changes the delta amount.
  # dimension: anomaly_prob_threshold {
  #   type: number
  #   sql: ${TABLE}.anomaly_prob_threshold;;
  # }
  dimension: project_id {
    type: string
    sql: ${TABLE}.project_id ;;
  }
  dimension_group: setting_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: coalesce(${TABLE}.setting_end_date,DATE(2199,01,01)) ;;
  }
  dimension_group: setting_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.setting_start_date ;;
  }
  dimension_group: setting_creation {
    type: time
    sql: ${TABLE}.setting_creation_timestamp ;;
    datatype: timestamp
    timeframes: [time]
  }
  dimension: max_cost_threshold {
    type: number
    sql: ${TABLE}.max_cost_threshold ;;
  }
  measure: count {
    type: count
  }
}

view: calendar {
  derived_table: {
    sql: SELECT
          d as calendar_date
        FROM
          UNNEST(GENERATE_DATE_ARRAY('2023-01-01', '2050-01-10', INTERVAL 1 DAY)) AS d  ;;
  }
  dimension_group: calendar {
    type: time
    datatype: datetime
    convert_tz: no
    timeframes: [date]
    sql: ${TABLE}.calendar_date ;;
  }
}

explore: project_period_anomaly_threshold_settings {
  from: calendar
  view_name: calendar
  sql_always_where: ${project_period_anomaly_threshold_settings.setting_start_date} is not null ;;
  join: project_period_anomaly_threshold_settings {
    sql_on: ${calendar.calendar_date}>=${project_period_anomaly_threshold_settings.setting_start_date}
      and ${calendar.calendar_date}<=${project_period_anomaly_threshold_settings.setting_end_date} ;;
    relationship: many_to_one
  }
}

# This allows detecting the most recently set settings for a given calendar date, in case multiple settings were made for the same project covering the same potentially anomalous day
view: project_period_anomaly_threshold_settings_ranked {
  derived_table: {
    explore_source: project_period_anomaly_threshold_settings {
      column: project_id {field:project_period_anomaly_threshold_settings.project_id}
      column: setting_start_date {field:project_period_anomaly_threshold_settings.setting_start_date}
      column: setting_end_date {field:project_period_anomaly_threshold_settings.setting_end_date}
      # column: anomaly_prob_threshold {field:project_period_anomaly_threshold_settings.anomaly_prob_threshold}
      column: absolute_percent_threshold {field:project_period_anomaly_threshold_settings.absolute_percent_threshold}
      column: absolute_delta_threshold {field:project_period_anomaly_threshold_settings.absolute_delta_threshold}
      column: calendar_date { field: calendar.calendar_date }
      column: setting_creation_time {field:project_period_anomaly_threshold_settings.setting_creation_time}
      column: max_cost_threshold {field:project_period_anomaly_threshold_settings.max_cost_threshold}
      derived_column: rank {
        sql: row_number() over (partition by project_id, calendar_date order by setting_creation_time desc)  ;;
      }
      bind_filters: {
        from_field: project_detect_anomalies_net_cost.project_id
        to_field: project_period_anomaly_threshold_settings.project_id
      }
    }
  }
  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: concatenate(${project_id},${calendar_date}) ;;
  }
  dimension: very_high_sensitivity_absolute_delta_threshold {
    type: number
    sql: 0 ;;
  }
  dimension: very_high_sensitivity_percent_delta_threshold {
    type: number
    sql: 0;;
  }
  # dimension: very_high_sensitivity_anomaly_probability_threshold {
  #   type: number
  #   sql: 0.80 ;;
  # }
  dimension: high_sensitivity_absolute_delta_threshold {
    type: number
    sql: 500 ;;
  }
  dimension: high_sensitivity_percent_delta_threshold {
    type: number
    sql: 0.05 ;;
  }
  # dimension: high_sensitivity_anomaly_probability_threshold {
  #   type: number
  #   sql: 0.95 ;;
  # }
  dimension: medium_sensitivity_absolute_delta_threshold {
    description: "Default Sensitivity"
    type: number
    sql: 1500 ;;
  }
  dimension: medium_sensitivity_percent_delta_threshold {
    description: "Default Sensitivity"
    type: number
    sql: 0.15 ;;
  }
  # dimension: medium_sensitivity_anomaly_probability_threshold {
  #   type: number
  #   sql: 0.99 ;;
  # }
  dimension: low_sensitivity_absolute_delta_threshold {
    type: number
    sql: 2500 ;;
  }
  dimension: low_sensitivity_percent_delta_threshold {
    type: number
    sql: 0.25 ;;
  }
  # dimension: low_sensitivity_anomaly_probability_threshold {
  #   type: number
  #   sql: 0.995 ;;
  # }

  dimension: project_id {
    description: ""
  }
  dimension: setting_start_date {
    description: ""
    convert_tz: no
    type: date
  }
  dimension: setting_end_date {
    description: ""
    convert_tz: no
    type: date
  }
  # dimension: anomaly_prob_threshold {
  #   description: ""
  #   type: number
  #   sql: coalesce(${TABLE}.anomaly_prob_threshold,${medium_sensitivity_anomaly_probability_threshold}) ;;
  # }
  dimension: absolute_percent_threshold {
    description: ""
    type: number
    sql: coalesce(${TABLE}.absolute_percent_threshold,${medium_sensitivity_percent_delta_threshold}) ;;
  }
  dimension: absolute_delta_threshold {
    description: ""
    type: number
    sql: coalesce(${TABLE}.absolute_delta_threshold,${medium_sensitivity_absolute_delta_threshold}) ;;

  }
  dimension: calendar_date {
    description: ""
    convert_tz: no
    type: date
  }
  dimension: setting_creation_time {
    description: ""
    type: date_time
  }
  dimension: rank {
    type: number
  }
  dimension: max_cost_threshold { #this feature is functioning 2024-03-13
    type: number
  }
  dimension: exceeds_max_cost_threshold {
    hidden: yes
    type: yesno
    sql: ${max_cost_threshold} is null
      OR ${project_detect_anomalies_net_cost.total_cost}>${max_cost_threshold} ;;
  }

  dimension: meets_all_threshold_requirements {
    type: yesno
    sql: ${project_detect_anomalies_net_cost.absolute_distance_from_threshold}>=${absolute_delta_threshold}
          AND ${project_detect_anomalies_net_cost.absolute_percent_from_threshold}>=${absolute_percent_threshold}

      AND ${exceeds_max_cost_threshold};;
  }#AND ${project_detect_anomalies_net_cost.anomaly_probability}>=${anomaly_prob_threshold}
  dimension: is_most_recent_record_for_this_day {
    type: yesno
    sql: ${project_id} is null
      or ${rank}=1 ;;
  }
}
