view: gcp_contacts_mapping {

  #replace derived table with actual table that has mapping between contacts and projects
  sql_table_name: `@{GCP_PROJECT}.@{BQML_DATASET}.cost_anomaly_contact_mapping` ;;
  #derived_table: {
  #  sql: select 'project_id' as project_id,
  #              'crutchfielda@google.com, swapnakr@google.com' as email_recipient_list,
  #}


  dimension: project_id {}
  #coalesce functions added for testing - all records will be null until project_id records are actually matching real projects.
  dimension: email_recipient_list {
    sql: coalesce(${TABLE}.email_recipient_list) ;;
  }

  dimension: slack_recipient_list {
    sql: coalesce(${TABLE}.slack_recipient_list, '#gcp-cost-alerts') ;;
  }
}
