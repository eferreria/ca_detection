include: "/02-cost_anomaly_detection/views/03_explain_forecast_net_cost.view.lkml"
include: "/02-cost_anomaly_detection/views/04_detect_anomalies_net_cost.view.lkml"

view: +project_explain_forecast_net_cost {
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

  measure: yearly_budget {
    label: "Total Budget"
    type: sum
    sql: ${TABLE}.yearly_budget ;;
    value_format_name: usd
  }

  measure: total_additional_projected_spend { ## new
    tags: ["Total Additional Spend"]
    type: sum
    description: "The long-term increase or decrease in the time series data."
    sql: ${additional_projected_spend} ;;
    value_format_name: usd
    html:
    {% if value < -1000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < -1000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000 %}
    {{rendered_value}}
    {% elsif value < 1000000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < 1000000000000 %}
    ${{ value | divided_by: 1000000000.0 | round: 2}} B
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

  measure: total_forecast {
    tags: ["Total Forecasted Spend", "Forecasted Spend", "Total Expected Spend", "Forecasting Spend", "Total Forecasting Spend"]
    type: number
    label: "Expected Spend"
    description: "The long-term increase or decrease in the time series data."
    sql: ${total_trend} + ${total_additional_projected_spend};;
    value_format_name: usd
    html:
    {% if value < -1000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < -1000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000 %}
    {{rendered_value}}
    {% elsif value < 1000000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < 1000000000000 %}
    ${{ value | divided_by: 1000000000.0 | round: 2}} B
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
    drill_fields: [project_id, project_detect_anomalies_net_cost.total_net_cost, total_forecast, variance_amount]
  }



measure: total_trend {
  label: "Total Spend"
  html:
  {% if value < -1000000 %}
  ${{ value | divided_by: 1000000.0 | round: 2}} M
  {% elsif value < -1000 %}
  ${{ value | divided_by: 1000.0 | round: 2}} K
  {% elsif value < 1000 %}
  {{rendered_value}}
  {% elsif value < 1000000 %}
  ${{ value | divided_by: 1000.0 | round: 2}} K
  {% elsif value < 1000000000 %}
  ${{ value | divided_by: 1000000.0 | round: 2}} M
  {% elsif value < 1000000000000 %}
  ${{ value | divided_by: 1000000000.0 | round: 2}} B
  {% else %}
  {{rendered_value}}
  {% endif %}
  ;;
}
  ##new
  measure: actual_forecast {
    hidden: yes
    type: sum
    description: "The long-term increase or decrease in the time series data."
    sql: case when FORMAT_DATE('%m-%Y',${time_series_raw}) <= FORMAT_DATE('%m-%Y', CURRENT_DATE())
    then  (${trend}+${additional_projected_spend}) else ${project_detect_anomalies_net_cost.total_cost}
    end ;;
    value_format_name: usd
  }

   measure: variance_amount {
     type: number
    sql: ${project_detect_anomalies_net_cost.total_net_cost} - ${total_forecast} ;;
    value_format_name: usd
    html:
    {% if value < -1000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < -1000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000 %}
    {{rendered_value}}
    {% elsif value < 1000000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < 1000000000000 %}
    ${{ value | divided_by: 1000000000.0 | round: 2}} B
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
   }

  measure: variance_percentage {
    type: number
    sql: (${project_detect_anomalies_net_cost.total_net_cost} - ${total_forecast})/${project_detect_anomalies_net_cost.total_net_cost}   ;;
    value_format_name: percent_1
  }

  # measure: varianct_percentage {}
  measure: cumulative_spend {
    type: running_total
    sql: ${project_detect_anomalies_net_cost.total_net_cost};;
    value_format_name: usd
  }

  measure: cumulative_forecast {
    type: running_total
    sql: ${total_forecast};;
    value_format_name: usd
  }

  measure: cumulative_variance_amount{
    type: number
    sql: (${cumulative_forecast}-${yearly_budget})  ;;
    value_format_name: usd
    html:
    {% if value < -1000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < -1000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000 %}
    {{rendered_value}}
    {% elsif value < 1000000 %}
    ${{ value | divided_by: 1000.0 | round: 2}} K
    {% elsif value < 1000000000 %}
    ${{ value | divided_by: 1000000.0 | round: 2}} M
    {% elsif value < 1000000000000 %}
    ${{ value | divided_by: 1000000000.0 | round: 2}} B
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }

measure: cumulative_variance_percentage {
  type: number
  sql: (${cumulative_forecast}-${yearly_budget})/${yearly_budget}  ;;
  value_format_name: percent_1
}
}
# measure: total_additional_projected_spend { ## new
#   type: sum
#   description: "The long-term increase or decrease in the time series data."
#   sql: ${additional_projected_spend} ;;
#   value_format_name: usd
# }

# measure: total_forecast {
#   type: sum
#   description: "The long-term increase or decrease in the time series data."
#   sql: ${trend} + ${additional_projected_spend};;
#   value_format_name: usd
# }
