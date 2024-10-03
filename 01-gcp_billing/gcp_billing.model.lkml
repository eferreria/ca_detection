connection: "bigquery_connection"

include: "views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "explores/gcp_billing.explore.lkml"
include: "config/datagroups.lkml"
include: "dashboards/gcp_summary.dashboard"

label: "CCM - GCP Billing"
