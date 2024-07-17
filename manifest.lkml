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
  # file: "explore_assistant_multi_explores.js"

  file: "explore_assistant.js"
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
}


application: fhir_with_explore_assistant {
  label: "FHIR with Explore Assistant"
  # url: "https://localhost:8080/bundle.js"
  # file: "explore_assistant_multi_explores.js"

  file: "fhir_flattened.js"
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


application: kitchensink {
  label: "Kitchen sink"
  # url: "https://localhost:8080/bundle.js"
  file: "kitchensink.js"
  entitlements: {
    local_storage: yes
    navigation: yes
    new_window: yes
    use_form_submit: yes
    use_embeds: yes
    core_api_methods: ["all_connections","search_folders", "run_inline_query", "me", "all_looks", "run_look"]
    external_api_urls: ["http://127.0.0.1:3000", "http://localhost:3000", "https://*.googleapis.com", "https://*.github.com", "https://REPLACE_ME.auth0.com"]
    oauth2_urls: ["https://accounts.google.com/o/oauth2/v2/auth", "https://github.com/login/oauth/authorize", "https://dev-5eqts7im.auth0.com/authorize", "https://dev-5eqts7im.auth0.com/login/oauth/token", "https://github.com/login/oauth/access_token"]
    scoped_user_attributes: ["user_value"]
    global_user_attributes: ["locale"]
  }
}

application: helloworld-ts {
  label: "Helloworld (TypeScript)"
  # url: "https://localhost:8080/bundle.js"
  file: "hello_world.js"
  entitlements: {
    core_api_methods: ["me"]
  }
}

application: dashboard-summarization {
  label: "Dashboard Insights Powered by Vertex AI"
  file: "dashboard_summarization.js"
  # url: "http://localhost:8080/bundle.js"
  mount_points: {
    dashboard_vis: yes
    dashboard_tile: yes
    standalone: yes
  }
  entitlements: {
    local_storage: yes
    use_form_submit: yes
    core_api_methods: ["run_inline_query","all_lookml_models","dashboard","dashboard_dashboard_elements"]
    external_api_urls: [
      "https://eaf-dashboard-summarization-b32qynntlq-uc.a.run.app", "https://*.googleapis.com","https://slack.com/api/*","https://slack.com/*"
    ]
    #
    oauth2_urls: [
      "https://accounts.google.com/o/oauth2/v2/auth",
      "https://www.googleapis.com/auth/chat.spaces",
      "https://www.googleapis.com/auth/drive.metadata.readonly",
      "https://www.googleapis.com/auth/spreadsheets.readonly",
      "https://www.googleapis.com/auth/userinfo.profile",
      "https://www.googleapis.com/auth/chat.spaces.readonly",
      "https://www.googleapis.com/auth/chat.bot",
      "https://www.googleapis.com/auth/chat.messages",
      "https://www.googleapis.com/auth/chat.messages.create",
      "https://slack.com/oauth/v2/authorize"
    ]
    scoped_user_attributes: []
    global_user_attributes: []
  }
}
