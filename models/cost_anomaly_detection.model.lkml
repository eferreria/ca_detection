connection: "bigquery_connection"

include: "/views/**/*.view.lkml"
include: "/config/datagroups.lkml"
# include: "/dashboards/*"

label: "Anomaly Detection"

#### BQML Model Information Explore ####
#(
explore: bqml_model_info {
  hidden: no
  label: "BQML Model Information"
  description: "Use this Explore for an Overview of BQML Models including creation time, duration, and feature details."

  join: bqml_model_info__feature_info {
    view_label: "Feature Information"
    relationship: one_to_many
    sql: LEFT JOIN UNNEST(${bqml_model_info.feature_info}) AS bqml_model_info__feature_info ;;
  }
}
#)


#### GCP Project Anomaly Detection Explores ####
#(
explore: input_data_net_cost {
  label: "BQML Anomaly Detection: Input Data (GCP Project)"
  hidden: yes
}

explore: create_model_net_cost {
  label: "BQML Anomaly Detection: Create Model (GCP Project)"
  hidden: yes
}

explore: arima_evaluate_net_cost {
  label: "BQML Anomaly Detection: ARIMA Evaluate (GCP Project)"
  hidden: yes
}

explore: explain_forecast_net_cost {
  label: "BQML Anomaly Detection: Explain Forecast (GCP Project)"
  hidden: yes
  join: detect_anomalies_net_cost {
    relationship: one_to_one
    type: left_outer
    sql_on: ${explain_forecast_net_cost.project_name} = ${detect_anomalies_net_cost.project_name}
      AND ${explain_forecast_net_cost.time_series_date} = ${detect_anomalies_net_cost.usage_start_date};;
  }
}

explore: detect_anomalies_net_cost {
  label: "BQML Anomaly Detection: Detect Anomalies (GCP Project)"
  hidden: yes
  # Add this filter so that underrun anomalies for the current day aren't flagged.
  # sql_always_where: ${is_underrun_anomaly_today} ;;
}
#)
