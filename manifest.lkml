# project_name: "cloud_billing_anomaly_detection"

constant: CONNECTION_NAME {
  value: "bigquery-connection"
}

constant: GCP_PROJECT {
  value: "eaf-barong-da-qa"
}

constant: BILLING_TABLE {
  # value: "eaf-barong-da-qa.billing.gcp_billing_export_v1_0090FE_ED3D81_AF8E3B"
  value: "eaf-barong-da-qa.billing.consolidated_standard_billing_pdt"
}

constant: DETAILED_BILLING_TABLE {
  value: "eaf-barong-da-qa.billing.consolidated_detailed_billing_pdt"
}

constant: PRICING_TABLE {
  value: "eaf-barong-da-qa.billing.cloud_pricing_export_0090FE_ED3D81_AF8E3B"
  export: override_optional
}

constant: RECOMMENDATION_TABLE {
  value: ""
}

### Cost Anomaly Constants ##
constant: BQML_DATASET {
  value: "bqml_testbed"
}

constant: FORECAST_HORIZON {
  value: "180"
}

constant: TOTAL_COST {
  value: "1"
}

constant: MIN_MONTHS_FOR_PROJECT {
  value: "1"
}

constant: ANOMALY_DEEP_DIVE_STANDARD_FILTERS {
  value: "Minimum+Spend+Difference+from+Threshold={{_filters['set_absolute_delta_threshold'] | url_encode}}&Anomaly+Probability+Threshold={{_filters['set_anomaly_prob_threshold'] | url_encode}}&Percent+Difference+from+Threshold={{_filters['set_absolute_percent_threshold'] | url_encode}}&Anomaly+Direction={{ _filters['anomaly_direction']}}"
}

# MODEL A Constants
constant: COST_ANOMALY_MODEL_A {
  value: "project_wf"
}

constant: COST_ANOMALY_MODEL_A_NAME {
  value: "Yanet's Holiday Task"
}

constant: ANOMALY_OVERVIEW_BY_PROJECT_DASHBOARD {
  value: "cost_anomaly_detection::project_anomaly_deep_dive"  # Use Dashboard ID when Developing, Change to LookML ID when production
}

constant: MODEL_A_ANOMALY_DEEP_DIVE_DASHBOARD {
  value: "cost_anomaly_detection::project_anomaly_deep_dive" # Use Dashboard ID when Developing, Change to LookML ID when production
}

constant: MODEL_A_ANOMALY_DEEP_DIVE_DASHBOARD_FILTERS {
  value: "Usage+Date={{ _filters['usage_start_date'] }}&Project+Name={{ project_name._value | url_encode }}"
}




# Constants to switch back and forth from UDD and LookML dashboard
constant: ANOMALY_OVERVIEW_BY_PROJECT_DASHBOARD {
  value: "cost_anomaly_detection::anomaly_overview_by_project"
  # value: "19"
}

constant: PROJECT_ANOMALY_DEEP_DIVE_DASHBOARD {
  value: "cost_anomaly_detection::project_anomaly_deep_dive"
}




application: cloud_cost_forecasting {
  label: "Cloud Cost Forecasting"
  # url: "https://localhost:8080/bundle.js"
  # file: "explore_assistant_multi_explores.js"

  file: "cloud_cost_forecasting.js"
  entitlements: {
    core_api_methods: ["lookml_model_explore","create_sql_query","run_sql_query","run_query","create_query"]
    navigation: yes
    use_embeds: yes
    use_iframes: yes
    new_window: yes
    new_window_external_urls: ["https://developers.generativeai.google/*"]
    local_storage: yes
    # external_api_urls: ["cloud function url"]
  }
  mount_points: {
    dashboard_vis: yes
    dashboard_tile: yes
    standalone: yes
  }
}
