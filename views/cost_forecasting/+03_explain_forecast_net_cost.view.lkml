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
  label: "Total Actuals"
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
