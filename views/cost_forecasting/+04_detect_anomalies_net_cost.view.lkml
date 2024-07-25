include: "/views/cost_anomaly/04_detect_anomalies_net_cost.view"

view: +project_detect_anomalies_net_cost {
  label: "AI Forecasting"

  measure: total_actual_vs_forecasted {
    type: number
    sql:${project_explain_forecast_net_cost.total_forecast} - ${total_net_cost}  ;;
    value_format_name: usd
  }
}
