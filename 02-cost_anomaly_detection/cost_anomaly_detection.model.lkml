connection: "bigquery_connection"

include: "/02-cost_anomaly_detection/explores/*.explore.lkml"

include: "/02-cost_anomaly_detection/config/datagroups.lkml"
include: "/02-cost_anomaly_detection/dashboards/anomalies_by_project.dashboard"
include: "/02-cost_anomaly_detection/dashboards/overview_of_anomalies.dashboard"
include: "/02-cost_anomaly_detection/dashboards/anomaly_deep_dive.dashboard"
include: "/01-gcp_billing/views/*.view.lkml"


label: "Anomaly Detection"

#### BQML Model Information Explore ####
#(
