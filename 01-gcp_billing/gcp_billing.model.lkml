connection: "bigquery_connection"


include: "config/datagroups.lkml"
include: "explores/cloud_pricing_export.explore.lkml"
include: "explores/gcp_billing.explore.lkml"
include: "dashboards/gcp_summary.dashboard"
include: "dashboards/executive_summary.dashboard"
include: "dashboards/updated_dashboards/bigquery.dashboard"
include: "dashboards/updated_dashboards/cloud_storage.dashboard"
include: "dashboards/updated_dashboards/compute_engine.dashboard"
include: "dashboards/updated_dashboards/credit_analysis.dashboard"
# include: "dashboards/updated_dashboards/project_deepdive.dashboard"
include: "dashboards/supplemental_dashboards/big_query_deep_dive.dashboard"


# If Recommendations Export is in Scope, include these files
# include: "explores/recommendations_export.explore"
# include: "dashboards/updated_dashboards/cost_optimization_recommendations.dashboard"

# Refinements




label: "CCM - GCP Billing"
