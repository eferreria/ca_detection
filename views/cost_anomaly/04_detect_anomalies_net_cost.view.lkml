view: project_detect_anomalies_net_cost {

  label: "Detect Anomalies"

  derived_table: {
    sql:
      SELECT
        c.usage_start_date
        ,c.project_name
        ,c.project_id
        ,c.total_net_cost
        ,coalesce(c.is_anomaly,h.is_anomaly) as is_anomaly
        ,coalesce(c.lower_bound,h.lower_bound) as lower_bound
        ,coalesce(c.upper_bound,h.upper_bound) as upper_bound
        ,coalesce(c.anomaly_probability,h.anomaly_probability) as anomaly_probability
      FROM
        (
          --forecasted input_data (returns all rows but only anomaly details for forecasting period)
          SELECT
            *
          FROM ML.DETECT_ANOMALIES(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.project_net_cost_forecast`
                                    , STRUCT({% parameter set_anomaly_prob_threshold %} AS anomaly_prob_threshold)
                                    , (SELECT
                                         *
                                      -- FROM ${project_input_data_net_cost.SQL_TABLE_NAME}
                                      FROM ${project_forecast_data_net_cost.SQL_TABLE_NAME}
                                      )
                                  )
        ) c
        LEFT JOIN
        (
         --modeled input_data (returns only rows and anomaly details for historical data used to create model)
         SELECT
           *
         FROM ML.DETECT_ANOMALIES(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.project_net_cost_forecast`
                                   , STRUCT({% parameter set_anomaly_prob_threshold %} AS anomaly_prob_threshold)
                                  )
        ) h
         ON c.project_id = h.project_id
         AND c.usage_start_date = h.usage_start_date
      ;;
  }

  #PARAMETERS
  parameter: set_anomaly_prob_threshold {
    label: "Set Anomaly Probability Threshold"
    description: "Set the anomaly probability threshold [0,1). The default value is 0.99. The net cost value at a specific timestamp
    is identified as anomalous if the anomaly probability exceeds the Anomaly Probability Threshold value."
    type: number
    allowed_value: {value: "0.80" label: "80%"}
    allowed_value: {value: "0.85" label: "85%"}
    allowed_value: {value: "0.90" label: "90%"}
    allowed_value: {value: "0.95" label: "95%"}
    allowed_value: {value: "0.98" label: "98%"}
    allowed_value: {value: "0.99" label: "99%"}
    allowed_value: {value: "0.995" label: "99.5%"}
    default_value: "0.99"
  }

  parameter: set_absolute_delta_threshold {
    label: "Set Minimum Net Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum net cost dollar amount above or below the anomaly threshold for alerting. The default value is 100."
    type: number
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

  parameter: set_absolute_percent_threshold {
    label: "Set Minimum % Cost Difference from Upper/Lower Thresholds"
    description: "Set the minimum percent change amount above or below the anomaly threshold for alerting. The default value is 15%."
    type: number
    allowed_value: {value: "0.0" label: "0%"}
    allowed_value: {value: "0.10" label: "10%"}
    allowed_value: {value: "0.15" label: "15%"}
    allowed_value: {value: "0.20" label: "20%"}
    allowed_value: {value: "0.25" label: "25%"}
    default_value: "0.15"
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date_raw
    sql: ${usage_start_date} || ${project_id};;
  }

  #Project dimensions
  #{
  dimension: project_name {
    type: string
    sql: ${TABLE}.project_name ;;
    link: {
      label: "Anomaly Overview by Project"
      url: "https://bcodev.cloud.looker.com/dashboards/@{ANOMALY_OVERVIEW_BY_PROJECT_DASHBOARD}?Total+Cost+Difference+from+Threshold={{_filters['set_absolute_delta_threshold'] | url_encode}}&Usage+Date={{ _filters['project_detect_anomalies_net_cost.usage_start_date'] | url_encode }}&Anomaly+Probability+Threshold={{_filters['project_detect_anomalies_net_cost.set_anomaly_prob_threshold']| url_encode}}&Project+ID={{ project_id._value | url_encode }}&Project+Name={{ project_name._value | url_encode }}&Percent+Difference+from+Threshold={{_filters['set_absolute_percent_threshold'] | url_encode}}"
    }
  }

  dimension: project_id {
    hidden: no
    type: string
    sql: ${TABLE}.project_id ;;
    link: {
      label: "Anomaly Overview by Project"
      url: "https://bcodev.cloud.looker.com/dashboards/@{ANOMALY_OVERVIEW_BY_PROJECT_DASHBOARD}?Total+Cost+Difference+from+Threshold={{_filters['set_absolute_delta_threshold'] | url_encode}}&Usage+Date={{ _filters['project_detect_anomalies_net_cost.usage_start_date'] | url_encode }}&Anomaly+Probability+Threshold={{_filters['project_detect_anomalies_net_cost.set_anomaly_prob_threshold']| url_encode}}&Project+ID={{ project_id._value | url_encode }}&Project+Name={{ project_name._value | url_encode }}&Percent+Difference+from+Threshold={{_filters['set_absolute_percent_threshold'] | url_encode}}"
    }
  }

  dimension: link_to_gcp_console {
    label: "Link to Project in GCP Console"
    hidden: yes
    type: string
    sql: "link" ;;
    html: <a href="https://console.cloud.google.com/home/dashboard?project={{ project_id._value }}" target="_blank"><b><h4> Click to view project "{{ project_id._value }}" in Console </b></h4></a>;;
  }

  # dimension: link_to_anomaly_deep_dive {
  #   # link to anomaly deep dive dashboard, to be used from anomaly details by project
  #   hidden: yes
  #   sql: "link" ;;
  #   # Usage date filtered on last 5 days leading up to the anomaly usage date and a 3 days after
  #   html:  <a href="{% assign filter_date = project_detect_anomalies_net_cost.usage_start_date._rendered_value %}{% assign filter_date_minus = filter_date | date: '%s' | minus: 432000 | date: '%Y-%m-%d' | uri_encode %}{% assign filter_date_plus = filter_date | date: '%s' | plus: 259200 | date: '%Y-%m-%d' | uri_encode %}/dashboards/@{PROJECT_ANOMALY_DEEP_DIVE_DASHBOARD}?Total+Cost+Difference+from+Threshold={{_filters['set_absolute_delta_threshold'] | url_encode}}&Usage+Date={{ filter_date_minus }}+to+{{ filter_date_plus }}&Anomaly+Probability+Threshold={{_filters['set_anomaly_prob_threshold'] | url_encode}}&Project+ID={{ project_id._value | url_encode }}&Project+Name={{ project_name._value | url_encode }}&Percent+Difference+from+Threshold={{_filters['set_absolute_percent_threshold'] | url_encode}}" target="_blank" >
  #         <img border="0" alt="altText" src="https://cdn-icons-png.flaticon.com/512/7079/7079548.png"
  #           height="14" width="14">
  #         </a> ;;
  # }

  #} project dimensions

  dimension_group: usage_start {
    description: "The day in which the anomaly occurred"
    type: time
    timeframes: [raw,date,week,month,year]
    sql: ${TABLE}.usage_start_date ;;
    convert_tz: no
  }

  dimension: usage_start_date_string {
    #add to drill as string so no impact on sort
    hidden: yes
    label: "Usage Start Date"
    type: string
    sql: FORMAT_DATE("%F", ${TABLE}.usage_start_date) ;;
  }

  dimension: usage_start_date_sub_1_week {
    hidden: yes
    type: date
    sql: DATE_SUB(DATE(${TABLE}.usage_start_date, INTERVAL 1 week) ;;
  }

  # hide net cost dimension - will display as measaure
  dimension: total_cost {
    hidden: no
    type: number
    sql: ${TABLE}.total_net_cost ;;
    value_format_name: usd
  }

  #Anomaly dimensions
  #{

  dimension: is_anomaly {
    description: "Anomaly for sensitivity"
    type: yesno
    sql: CASE WHEN ${TABLE}.is_anomaly
                    AND ${absolute_distance_from_threshold} >= {% parameter set_absolute_delta_threshold %}
                    AND ${absolute_percent_from_threshold} >= {% parameter set_absolute_percent_threshold %}
                THEN ${TABLE}.is_anomaly
                ELSE FALSE END ;;
  }

  dimension: is_underrun_anomaly_today {
    description: "Used to filter out underrun anomalies for the current day."
    type: yesno
    hidden: yes
    sql: CASE WHEN ${is_anomaly}
                    AND ${usage_start_date} = CURRENT_DATE()
                    AND ${total_cost} < ${lower_bound}
                THEN FALSE
                ELSE ${is_anomaly} END;;
  }

  dimension: lower_bound {
    description: "The lowest dollar value for which the solution would not classify spend as an anomaly"
    type: number
    # Add 15% buffer on lower bounds to avoid double reporting on overruns.
    sql: (${TABLE}.lower_bound) - (0.15 * ${TABLE}.lower_bound) ;;
    value_format_name: usd
  }

  dimension: upper_bound {
    description: "The highest dollar value for which the solution would not classify spend as an anomaly"
    type: number
    sql: ${TABLE}.upper_bound ;;
    value_format_name: usd
  }

  dimension: delta_above_upper_bound {
    hidden: yes
    type: number
    sql:  case when ${total_cost}>${upper_bound} then ${total_cost}-${upper_bound}
            else null end
            ;;
  }

  dimension: percent_above_upper_bound {
    hidden: yes
    type: number
    sql:  case when ${total_cost}>${upper_bound} then (SAFE_DIVIDE(${total_cost}-${upper_bound},${upper_bound}))
            else null end
            ;;
    value_format_name: percent_2
  }

  dimension: delta_below_lower_bound {
    hidden: yes
    type: number
    sql:  case when ${total_cost} < ${lower_bound} then ${total_cost}-${lower_bound}
          else null end
          ;;
  }

  dimension: percent_below_lower_bound {
    hidden: yes
    type: number
    sql:  case when ${total_cost} < ${lower_bound} then (SAFE_DIVIDE(${total_cost}-${lower_bound},${lower_bound}))
          else null end
          ;;
    value_format_name: percent_2
  }

  dimension: anomaly_direction {
    type: string
    description: "Whether spend exceeded the predicted threshold because it was too high or too low"
    sql: case when ${total_cost} > ${upper_bound} then "⬆️ Above Upper Threshold"
                when ${total_cost} < ${lower_bound} then "⬇️ Below Lower Threshold"
                else null end;;
  }

  dimension: anomaly_type {
    type: string
    hidden: yes
    sql: case when ${is_anomaly} then
                case when ${total_cost}<=0 then "Net Cost <= 0"
                     when ${total_cost} > ${upper_bound} then "⬆️ Above Upper Threshold"
                     when ${total_cost} < ${lower_bound} then "⬇️ Below Lower Threshold"
                    else null
                end
                else null
            end ;;
    order_by_field: anomaly_type_nbr
  }

  dimension: anomaly_type_nbr {
    type: number
    hidden: yes
    sql: case when ${is_anomaly} then
                case when ${total_cost}<=0 then 3
                     when ${total_cost} > ${upper_bound} then 2
                     when ${total_cost} < ${lower_bound} then 1
                    else null
                end
                else null
            end ;;
  }

  dimension: distance_from_threshold {
    hidden: yes
    type: number
    value_format: "$#.00;($#.00)"
    sql:  case when ${TABLE}.is_anomaly then
              coalesce(${delta_above_upper_bound},${delta_below_lower_bound})
            end;;
  }

  dimension: percent_from_threshold {
    hidden: yes
    type: number
    value_format: "#.00%;(#.00%)"
    sql:  case when ${TABLE}.is_anomaly then
                coalesce(${percent_above_upper_bound},${percent_below_lower_bound})
              end;;
  }


  dimension: absolute_distance_from_threshold {
    description: "Dollar value that actual spend differed from the upper bound spend (a positive value indicates that actual spend > expected spend)"
    type: number
    value_format: "$#.00;($#.00)"
    sql:  abs(${distance_from_threshold}) ;;
  }

  dimension: absolute_percent_from_threshold {
    description: "Percent that actual spend deviated from expected spend (a positive percentage value indicates that actual spend > expected spend)"
    type: number
    value_format: "#.00%;(#.00%)"
    sql: abs(${percent_from_threshold}) ;;
  }

  dimension: anomaly_probability {
    description: "Likelihood that the spend occurrence is a true anomaly"
    type: number
    sql: ${TABLE}.anomaly_probability ;;
    value_format_name: percent_2
  }

  #} anomaly dimensions

  ###############################################################################
  ## MEASURES
  ###############################################################################

  measure: row_count {
    #   label: "Count of Date/Project"
    hidden: yes
    type: count
    drill_fields: [anomaly_drill*]
  }

  measure: total_net_cost {
    description: "Total Net Cost"
    type: sum
    sql: ${total_cost} ;;
    value_format_name: decimal_2
  }

  measure: avg_time_series_data {
    label: "Average Total Cost"
    description: "Average daily cost over the filtered time period that user has set"
    type: average
    sql: ${total_cost} ;;
    value_format_name: decimal_2
  }

  measure: project_count {
    type: count_distinct
    sql: ${project_id} ;;
  }

  #Anomaly measures
  #{
  measure: anomaly_time_series_data {
    description: "Show time series data where is_anomaly = 'Yes' else leave null. Can add this to a time series line chart to plot/overlay the anomaly values (e.g., change series chart type to scatter)"
    type: number
    hidden: no
    label: "Anomaly"
    sql: sum(case when ${is_anomaly} then ${total_cost} end) ;;
    value_format_name: decimal_2
    drill_fields: [anomaly_drill*]
  }

  measure: max_anomaly_probability {
    type: max
    description: "Indicates the probability that a time-series data point is an anomaly. For example, an anomaly_probability value of 0.95 means that, among all possible values at the given timestamp, there is a 95% chance that the value is closer to the predicted value than it is to the given time series data value. This indicates a 95% probability that the given time series data value is an anomaly."
    sql: ${anomaly_probability} ;;
  }

  measure: min_anomaly_probability {
    type: min
    description: "Indicates the probability that a time-series data point is an anomaly. For example, an anomaly_probability value of 0.95 means that, among all possible values at the given timestamp, there is a 95% chance that the value is closer to the predicted value than it is to the given time series data value. This indicates a 95% probability that the given time series data value is an anomaly."
    sql: ${anomaly_probability} ;;
  }

  measure: min_lower_bound {
    type: min
    sql: ${lower_bound} ;;
    value_format_name: decimal_2
  }

  measure: max_upper_bound {
    type: max
    sql: ${upper_bound} ;;
    value_format_name: decimal_2
  }

  measure: project_anomaly_count {
    label: "Projects with Anomaly Count"
    type: count_distinct
    description: "Number of Distinct Projects with Anomalies Found"
    sql: ${project_id} ;;
    filters: [is_anomaly: "Yes"]
    drill_fields: [anomaly_drill*]
  }

  measure: anomaly_count {
    type: count_distinct
    sql: ${pk} ;;
    description: "Total number of anomalies in the given project over the specified time period"
    filters: [is_anomaly: "Yes"]
    drill_fields: [anomaly_drill*]
  }

  # Misc anomaly measures which can be hidden until needed
  measure: anomaly_pct {
    hidden: yes
    label: "Percent Anomalies"
    type: number
    description: "Percent of Date/Projects flagged as Anomalies"
    sql: ${anomaly_count}/NULLIF(${row_count},0) ;;
    value_format_name: percent_2
    drill_fields: [anomaly_drill*]
  }

  measure: anomaly_positive_count {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
    label: "Count of Anomalies Above Confidence Threshold"
    description: "Number of Anomalies Above Confidence Interval"
    filters: [anomaly_type_nbr: "2"]
    drill_fields: [anomaly_drill*]
  }

  measure: anomaly_negative_count {
    hidden: yes
    type: count_distinct
    sql: ${pk} ;;
    label: "Count of Anomalies Below Confidence Threshold"
    description: "Number of Anomalies Below Confidence Interval"
    filters: [anomaly_type_nbr: "1"]
    drill_fields: [anomaly_drill*]
  }

  measure: anomaly_positive_pct {
    hidden: yes
    type: number
    sql: safe_divide(${anomaly_positive_count},${anomaly_count}) ;;
    value_format_name: percent_2
  }

  measure: anomaly_negative_pct {
    hidden: yes
    type: number
    sql: safe_divide(${anomaly_negative_count},${anomaly_count}) ;;
    value_format_name: percent_2
  }

  measure: avg_anomaly_above {
    hidden: yes
    type: average
    sql: ${delta_above_upper_bound} ;;
    filters: [is_anomaly: "Yes",delta_above_upper_bound: ">0"]
    value_format_name: usd
  }

  measure: avg_anomaly_below {
    hidden: yes
    type: average
    sql: ${delta_below_lower_bound} ;;
    filters: [is_anomaly: "Yes",delta_below_lower_bound: "<0"]
    value_format_name: usd
  }

  measure: avg_absolute_delta {
    hidden: no
    label: "Average Delta from Expected"
    description: "Average dollar amount that anomalies exceeded or fell short of its upper/lower bounds. Average absolute difference between observed value and upper/lower bounds"
    type: average
    sql: ${absolute_distance_from_threshold} ;;
    value_format_name: decimal_2
    filters: [is_anomaly: "yes"]
  }

  measure: ratio_delta_to_avg_cost {
    hidden: yes
    type: number
    sql: safe_divide(${avg_absolute_delta},${avg_time_series_data})  ;;
    value_format_name: percent_2
  }


  #} end anomaly measures

  ###############################################################################
  ## SETs
  ###############################################################################
  # will sort by first field in list or by date if a date field is included
  set: anomaly_drill {
    fields: [usage_start_date_string, project_name, project_id, lower_bound, upper_bound, total_cost, absolute_distance_from_threshold]
  }

}
