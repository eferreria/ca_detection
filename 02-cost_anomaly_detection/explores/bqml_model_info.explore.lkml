include: "/02-cost_anomaly_detection/views/bqml_model_info.view.lkml"
include: "/02-cost_anomaly_detection/views/bqml_model_info__feature_info.view.lkml"

label: "Anomaly Detection"

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
