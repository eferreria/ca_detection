include: "/01-gcp_billing/views/gcp_billing_export.view"
include: "/01-gcp_billing/views/cloud_pricing_export.view"
include: "/01-gcp_billing/views/pricing_mapping.view"

explore: gcp_billing_export {
  label: "Billing"
  hidden: no
  join: gcp_billing_export__labels {
    sql:LEFT JOIN UNNEST(${gcp_billing_export.labels}) as gcp_billing_export__labels ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__system_labels {
    sql:LEFT JOIN UNNEST(${gcp_billing_export.system_labels}) as gcp_billing_export__system_labels ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__project__labels {
    sql:LEFT JOIN UNNEST(${gcp_billing_export.project__labels}) as gcp_billing_export__project__labels ;;
    relationship: one_to_many
  }

  join: gcp_billing_export__credits {
    sql:LEFT JOIN UNNEST(${gcp_billing_export.credits}) as gcp_billing_export__credits ;;
    relationship: one_to_many
  }

  join: pricing {
    relationship: one_to_one
    sql_on: ${pricing.sku__id} = ${gcp_billing_export.sku__id} ;;
  }

  # join: eligible_labels {
  #   type:  left_outer
  #   view_label: "Billing"
  #   fields: [eligible_labels.labeling_supported]
  #   relationship:  one_to_one
  #   sql_on:  ${gcp_billing_export.service__id} = ${eligible_labels.service_id} ;;
  # }

  join: pricing_mapping {
    type: left_outer
    view_label: "Pricing Taxonomy"
    relationship: one_to_one
    fields: [pricing_mapping.marketplace_purchase]
    sql_on: ${pricing_mapping.sku__id} = ${gcp_billing_export.sku__id} ;;
  }

  # join: spend {
  #   type: full_outer
  #   relationship: one_to_one
  #   sql_on: ${spend.month_month} = ${gcp_billing_export.invoice_month_month} ;;
  # }
}
