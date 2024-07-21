connection: "bigquery_connection"

include: "/views/**/*.view.lkml"
include: "/config/datagroups.lkml"
# include: "/explores/gcp_billing.explore"
include: "/dashboards/*.dashboard"
include: "/views/cost_forecasting/+03_explain_forecast_net_cost.view.lkml"

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
explore: project_input_data_net_cost {
  label: "Project Input Data (GCP Project)"
  hidden: yes
}

explore: project_create_model_net_cost {
  label: "Project Create Model (GCP Project)"
  hidden: yes
}

explore: project_arima_evaluate_net_cost {
  label: "Project ARIMA Evaluate (GCP Project)"
  hidden: yes
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

view: +project_explain_forecast_net_cost{
  dimension: project_name { hidden:yes }
}
view: +project_detect_anomalies_net_cost {
  dimension: project_name {
    label: "Application Name"
    # sql:
    # REPLACE(
    # ;;
    # }
    }
}
