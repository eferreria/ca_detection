include: "/views/cost_anomaly/03_explain_forecast_net_cost.view.lkml"

view: +project_explain_forecast_net_cost {
  label: "Explain Forecast"

  measure: yearly_budget {
    label: "Total Budget"
    type: sum
    sql: ${TABLE}.yearly_budget ;;
    value_format_name: usd
  }


measure: total_trend {
  label: "Total Spend"
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
