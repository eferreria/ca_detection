connection: "bigquery_connection"

# include: "views/gcp_billing_export.view.lkml"
include: "explores/cloud_pricing_export.explore.lkml"
include: "explores/gcp_billing.explore.lkml"
include: "config/datagroups.lkml"
include: "dashboards/gcp_summary.dashboard"
include: "dashboards/executive_summary.dashboard"

label: "CCM - GCP Billing"
