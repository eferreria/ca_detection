
view: project_explain_forecast_net_cost {
  label: "Explain Forecast"
  derived_table: {
    sql:
      SELECT arima_forecast.*, driver_forecast.budget_start_month
      , driver_forecast.additional_projected_spend
      , driver_forecast.yearly_budget
      FROM
       ML.EXPLAIN_FORECAST(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.project_net_cost_forecast`,
    STRUCT(@{FORECAST_HORIZON} AS horizon, {% parameter set_confidence_level %} AS confidence_level)) AS arima_forecast
    LEFT JOIN
    `eaf-barong-da-qa.billing.driver_based_forecast` as driver_forecast
    ON arima_forecast.project_id = driver_forecast.projectid
      AND DATE(arima_forecast.time_series_timestamp) = driver_forecast.budget_start_month

    ;;
  }
  # sql_table_name:  ML.EXPLAIN_FORECAST(MODEL `@{GCP_PROJECT}.@{BQML_DATASET}.project_net_cost_forecast`,
  #   STRUCT(@{FORECAST_HORIZON} AS horizon, {% parameter set_confidence_level %} AS confidence_level)) ;;

  parameter: set_confidence_level {
    label: "Confidence Level (optional)"
    description: "The percentage of the future values that fall in the prediction interval. The default value is 0.99. The valid input range is [0,1)."
    type: number
    default_value: "0.99"
  }

  dimension: additional_projected_spend { ##new
    type: number
    sql: ${TABLE}.additional_projected_spend ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date_raw
    sql: ${time_series_raw} || ${project_id} ;;
  }

  dimension: project_id {
    sql: ${TABLE}.project_id;;
    type: string
  }

  dimension: project_name {
    sql: ${TABLE}.project_name;;
    type: string
  }

  dimension_group: time_series {
    type: time
    timeframes: [raw, date, week, month, year]
    sql: ${TABLE}.time_series_timestamp ;;
    convert_tz: no
  }

  dimension: time_series_type {
    type: string
    description: "A value of either history or forecast. The rows with history in this column are used in training, either directly from the training table, or from interpolation using the training data."
    sql: ${TABLE}.time_series_type ;;
  }

  dimension: time_series_data {
    hidden: yes
    type: number
    sql: ${TABLE}.time_series_data ;;
  }

  dimension: time_series_adjusted_data {
    hidden: yes
    type: number
    sql: ${TABLE}.time_series_adjusted_data ;;
  }

  dimension: standard_error {
    type: number
    description: "The standard error of the residuals during the ARIMA fitting. The values are the same for all history rows. For forecast rows, this value increases with time, as the forecast values become less reliable."
    sql: ${TABLE}.standard_error ;;
  }

  dimension: confidence_level {
    type: number
    description: "The user-specified confidence level or, if unspecified, the default value of 0.95. This value is the same for forecast rows and NULL for history rows."
    sql: ${TABLE}.confidence_level ;;
  }

  dimension: prediction_interval_lower_bound {
    hidden: yes
    type: number
    sql: ${TABLE}.prediction_interval_lower_bound ;;
  }

  dimension: prediction_interval_upper_bound {
    hidden: yes
    type: number
    sql: ${TABLE}.prediction_interval_upper_bound ;;
  }

  dimension: trend {
    hidden: yes
    type: number
    sql: ${TABLE}.trend ;;
  }

  dimension: seasonal_period_yearly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_yearly ;;
  }

  dimension: seasonal_period_quarterly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_quarterly ;;
  }

  dimension: seasonal_period_monthly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_monthly ;;
  }

  dimension: seasonal_period_weekly {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_weekly ;;
  }

  dimension: seasonal_period_daily {
    hidden: yes
    type: number
    sql: ${TABLE}.seasonal_period_daily ;;
  }

  dimension: holiday_effect {
    hidden: yes
    type: number
    sql: ${TABLE}.holiday_effect ;;
  }

  dimension: spikes_and_dips {
    hidden: yes
    type: number
    sql: ${TABLE}.spikes_and_dips ;;
  }

  dimension: step_changes {
    hidden: yes
    type: number
    sql: ${TABLE}.step_changes ;;
  }

  measure: count {
    label: "Row Count"
    type: count
  }

  measure: total_time_series_data {
    type: sum
    description: "The data of the time series. For history rows, time_series_data is either the training data or the interpolated value using the training data. For forecast rows, time_series_data is the forecast value."
    sql: ${time_series_data} ;;
    value_format_name: usd
  }

  measure: total_time_series_adjusted_data {
    type: sum
    description: "The adjusted data of the time series. For history rows, this is the value after cleaning spikes and dips, adjusting the step changes, and removing the residuals. It is the aggregation of all the valid components: holiday effect, seasonal components, and trend. For forecast rows, this is the forecast value, which is the same as the value of time_series_data"
    sql: ${time_series_adjusted_data} ;;
    value_format_name: usd
  }

  measure: total_prediction_interval_lower_bound {
    type: number
    description: "The lower bound of the prediction result. Only forecast rows have values other than NULL in this column."
    sql: SUM(${prediction_interval_lower_bound}) ;;
    value_format_name: usd
  }

  measure: total_prediction_interval_upper_bound {
    type: number
    description: "The upper bound of the prediction result. Only forecast rows have values other than NULL in this column."
    sql: SUM(${prediction_interval_upper_bound}) ;;
    value_format_name: usd
  }

  measure: total_trend {
    type: sum
    description: "The long-term increase or decrease in the time series data."
    sql: ${trend} ;;
    value_format_name: usd
  }

  measure: total_additional_projected_spend { ## new
    type: sum
    description: "The long-term increase or decrease in the time series data."
    sql: ${additional_projected_spend} ;;
    value_format_name: usd
  }

  measure: total_forecast {
    type: number
    description: "The long-term increase or decrease in the time series data."
    sql: ${total_trend} + ${total_additional_projected_spend};;
    value_format_name: usd
  }

  measure: total_seasonal_period_yearly {
    type: sum
    description: "The time series data value affected by the time of the year. This value is NULL if no yearly effect is found."
    sql: ${seasonal_period_yearly} ;;
    value_format_name: usd
  }

  measure: total_seasonal_period_quarterly {
    type: sum
    description: "The time series data value affected by the time of the quarter. This value is NULL if no quarterly effect is found."
    sql: ${seasonal_period_quarterly} ;;
    value_format_name: usd
  }

  measure: total_seasonal_period_monthly {
    type: sum
    description: "The time series data value affected by the time of the month. This value is NULL if no monthly effect is found."
    sql: ${seasonal_period_monthly} ;;
    value_format_name: usd
  }

  measure: total_seasonal_period_weekly {
    type: sum
    description: "The time series data value affected by the time of the week. This value is NULL if no weekly effect is found."
    sql: ${seasonal_period_weekly} ;;
    value_format_name: usd
  }

  measure: total_seasonal_period_daily {
    type: sum
    description: "The time series data value affected by the time of the day. This value is NULL if no daily effect is found."
    sql: ${seasonal_period_daily} ;;
    value_format_name: usd
  }

  measure: total_holiday_effect {
    type: sum
    description: "The time series data value affected by different holidays. This is the aggregation value of all the holiday effects. This value is NULL if no holiday effect is found."
    sql: ${holiday_effect} ;;
    value_format_name: usd
  }

  measure: total_spikes_and_dips {
    type: sum
    description: "The unexpectedly high or low values of the time series. For history rows, the value is NULL if no spike or dip is found. This value is NULL for forecast rows."
    sql: ${spikes_and_dips} ;;
    value_format_name: usd
  }

  measure: total_step_changes {
    type: sum
    description: "The abrupt or structural change in the distributional properties of the time series. For history rows, this value is NULL if no step change is found. This value is NULL for forecast rows."
    sql: ${step_changes} ;;
    value_format_name: usd
  }

  measure: forecast_period_highlight {
    type: max
    description: "Highlights forecast period dates when added to a time series chart (background will appear shaded if set Series to Area Chart and add measure to Right Axis)"
    filters: [time_series_type: "forecast"]
    sql: 1 ;;
  }
}
