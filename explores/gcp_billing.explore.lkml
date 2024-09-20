include: "/views/gcp_billing/gcp_billing_export.view"
include: "/views/gcp_billing/gcp_detailed_billing_export.view.lkml"
# include: "/views/02_app_id_cost_anomalies/04_app_id_detect_anomalies_net_cost.view"

# explore: eams {}

explore: gcp_billing_export {
  label: "Billing"
  hidden: yes
  join: gcp_billing_export__labels {
    sql:LEFT JOIN UNNEST(${gcp_billing_export.labels}) as gcp_billing_export__labels ;;
    relationship: one_to_many
  }

  # join: gcp_billing_export__system_labels {
  #   sql:LEFT JOIN UNNEST(${gcp_billing_export.system_labels}) as gcp_billing_export__system_labels ;;
  #   relationship: one_to_many
  # }

  # join: gcp_billing_export__project__labels {
  #   sql:LEFT JOIN UNNEST(${gcp_billing_export.project__labels}) as gcp_billing_export__project__labels ;;
  #   relationship: one_to_many
  # }

  join: gcp_billing_export__credits {
    sql:LEFT JOIN UNNEST(${gcp_billing_export.credits}) as gcp_billing_export__credits ;;
    relationship: one_to_many
  }

}

explore: gcp_detailed_billing_export {

}
