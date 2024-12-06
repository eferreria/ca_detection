include: "/02-cost_anomaly_detection/views/01_project_cost_anomalies/*.view.lkml"

#### GCP Anomaly Detection Explores ####
# (
explore:  project_input_data_net_cost {
  label: "1a) @{COST_ANOMALY_MODEL_A_NAME}: Input Data"
  hidden: no
}

explore: project_create_model_net_cost {
  label: "1b) @{COST_ANOMALY_MODEL_A_NAME}: Create Model"
  hidden: no
}

explore: project_arima_evaluate_net_cost {
  label: "1c) @{COST_ANOMALY_MODEL_A_NAME}: ARIMA Evaluate"
  hidden: no
}

explore: project_explain_forecast_net_cost {
  label: "1d) @{COST_ANOMALY_MODEL_A_NAME}: Explain Forecast"
  hidden: no
  join: project_detect_anomalies_net_cost {
    relationship: one_to_one
    type: left_outer
    sql_on: ${project_explain_forecast_net_cost.project_id} = ${project_detect_anomalies_net_cost.project_id}
      AND ${project_explain_forecast_net_cost.time_series_date} = ${project_detect_anomalies_net_cost.usage_start_date};;
  }
}

explore: project_detect_anomalies_net_cost {
  # persist_with: near_real_time
  label: "1e) @{COST_ANOMALY_MODEL_A_NAME}: Detect Anomalies"
  hidden: no
}

#### GCP Input Data Explores ####
# (
explore: project_daily_spend {
  label: "1f) @{COST_ANOMALY_MODEL_A_NAME}: Daily Spend"
}
explore: project_avg_monthly_spend {
  label: "1g) @{COST_ANOMALY_MODEL_A_NAME}: Average Monthly Spend"
}
explore: project_forecast_data_net_cost {
  label: "1h) @{COST_ANOMALY_MODEL_A_NAME}: Forecast Data Net Cost"
}
# )
