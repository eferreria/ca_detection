include: "/02-cost_anomaly_detection/views/00_input_data_net_cost.view.lkml"
include: "/02-cost_anomaly_detection/views/01_create_model_net_cost.view.lkml"
include: "/02-cost_anomaly_detection/views/02_arima_evaluate_net_cost.view.lkml"
include: "/02-cost_anomaly_detection/views/03_explain_forecast_net_cost.view.lkml"
include: "/02-cost_anomaly_detection/views/04_detect_anomalies_net_cost.view.lkml"
include: "/02-cost_anomaly_detection/views/bqml_model_info__feature_info.view.lkml"
include: "/02-cost_anomaly_detection/config/datagroups.lkml"
include: "/02-cost_anomaly_detection/dashboards/*.dashboard"
include: "/01-gcp_billing/views/*.view.lkml"

label: "Anomaly Detection"

#### GCP Project Anomaly Detection Explores ####
#(
explore: project_input_data_net_cost {
  label: "Project Input Data (GCP Project)"
  hidden: no
}

explore: project_create_model_net_cost {
  label: "Project Create Model (GCP Project)"
  hidden: no
}

explore: project_arima_evaluate_net_cost {
  label: "Project ARIMA Evaluate (GCP Project)"
  hidden: no
}

explore: project_explain_forecast_net_cost {
  label: "Project Explain Forecast (GCP Project)"
  hidden: no
  join: project_detect_anomalies_net_cost {
    relationship: one_to_one
    type: left_outer
    sql_on: ${project_explain_forecast_net_cost.project_id} = ${project_detect_anomalies_net_cost.project_id}
      AND ${project_explain_forecast_net_cost.time_series_date} = ${project_detect_anomalies_net_cost.usage_start_date};;
  }
}

explore: project_detect_anomalies_net_cost {
  label: "Project Detect Anomalies (GCP Project)"
  hidden: no
  # Add this filter so that underrun anomalies for the current day aren't flagged.
  # sql_always_where: ${is_underrun_anomaly_today} ;;]

}
#)
