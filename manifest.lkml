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
  value: "`eaf-barong-da-qa.billing.gcp_billing_export_v1_0090FE_ED3D81_AF8E3B`"
}
