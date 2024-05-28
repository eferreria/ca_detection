# project_name: "cloud_billing_anomaly_detection"

constant: CONNECTION_NAME {
  value: "bigquery-connection"
}

constant: GCP_PROJECT {
  value: "eaf-barong-da-qa"
}

constant: BQML_DATASET {
  value: "bqml_testbed"
}

constant: FORECAST_HORIZON {
  value: "180"
}

constant: BILLING_TABLE {
  value: "eaf-barong-da-qa.billing.gcp_billing_export_v1_0090FE_ED3D81_AF8E3B"
}


# Constants to switch back and forth from UDD and LookML dashboard
constant: ANOMALY_OVERVIEW_BY_PROJECT_DASHBOARD {
  value: "cost_anomaly_detection::anomaly_overview_by_project"
  # value: "19"
}

constant: PROJECT_ANOMALY_DEEP_DIVE_DASHBOARD {
  value: "cost_anomaly_detection::project_anomaly_deep_dive"
}


application: explore_assistant {
  label: "Explore Assistant"
  # url: "https://localhost:8080/bundle.js"
  file: "bundle.js"
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
}
