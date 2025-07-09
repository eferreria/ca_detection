# TODO: Update all of the following view names
# If necessary, uncomment the line below to include explore_source.
include: "/01-gcp_billing/explores/gcp_billing.explore.lkml"
include: "/01-gcp_billing/explores/cloud_pricing_export.explore.lkml"

view: project_daily_spend {
  # Incremental update, source for all project tables
  derived_table: {
    datagroup_trigger: billing_datagroup
    partition_keys: ["usage_start_date"]
    increment_key: "usage_start_date"
    increment_offset: 30
    explore_source: gcp_billing_export {
      column: total_cost { field: gcp_billing_export.total_cost }
      column: project_id { field: gcp_billing_export.project__id }
      column: project_name { field: gcp_billing_export.project__name }
      column: usage_start_date { field: gcp_billing_export.usage_start_date }
    }
  }

  measure: total_net_cost {
    type: sum
    sql: ${total_cost} ;;
  }
  dimension: total_cost {
    label: "GCP Billing Resource Total Cost"
    description: "Cost including credits"
    value_format: "$#,##0"
    type: number
  }
  dimension: project_id {
    label: "GCP Billing Resource Project ID"
    description: "The ID of the Google Cloud project that generated the Cloud Billing data"
  }
  dimension: project_name {
    label: "GCP Billing Resource Project Name"
    description: "The name of the Google Cloud project that generated the Cloud Billing data"
  }
  dimension: usage_start_date {
    label: "GCP Billing Resource Usage Date"
    description: "Date of usage window within which the given cost was calculated"
    type: date
  }
}
view: project_avg_monthly_spend {
  # Calculate monthly avg spend, 57 week window
  derived_table: {
    datagroup_trigger: monthly_on_day_2
    sql:
      WITH monthly_project_spend AS (
        SELECT
          COALESCE(project_id, 'Null Project ID') as project_id,
          project_name as project_name,
          (FORMAT_TIMESTAMP('%Y-%m', project_daily_spend.usage_start_date , 'America/Los_Angeles')) AS usage_start_month,
          SUM(total_cost) as total_net_cost
        FROM
          ${project_daily_spend.SQL_TABLE_NAME} AS project_daily_spend
        WHERE
        -- Filter out Marketplace purchases
        -- project__name IS NOT NULL
        -- Use last 57 weeks (~13 months) of billing data to train model
         DATE(project_daily_spend.usage_start_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
        GROUP BY
          1, 2, 3
      )
        -- Get a list of all projects with more than $1,000 monthly average spend
      SELECT
        project_id,
        project_name,
        AVG(total_net_cost) total_cost,
        COUNT(1) as num_months
      FROM
        monthly_project_spend
      GROUP BY
        1, 2

      -- Exclude Records with avg total cost < 1000
      HAVING total_cost > (@{TOTAL_COST})

      -- Exclude Records with less than 3 months of history
      AND num_months > @{MIN_MONTHS_FOR_PROJECT}
      ;;
  }

  dimension: project_id {}
  dimension: project_name {}
  dimension: total_cost {}
  measure: count {
    type: count
  }
  measure: total_costs {
    type: sum
    sql: ${total_cost} ;;
  }
}
view: project_input_data_net_cost {
  ## Select data to be used in the ARIMA model
  ## Level of detail: usage start date, project
  ## Timeframe: past 57 weeks (~1 year)
  ## Filter criteria: GCP projects which have at least $1000 average monthly spend (increase threshold if retraining cadence is short (<2 weeks))
  ## Metric: sum(cost) for ARIMA model

  derived_table: {
    # datagroup_trigger: monthly_on_day_2
    # partition_keys: ["usage_start_date"]
    # cluster_keys: ["project_name","project_id"]

    sql:
      WITH
        avg_monthly_spend_by_project AS ( SELECT * FROM ${project_avg_monthly_spend.SQL_TABLE_NAME})

      SELECT
      (DATE(gcp_billing_export.usage_start_date)) AS usage_start_date,
      COALESCE(gcp_billing_export.project_id, "Null Project ID") AS project_id,
      gcp_billing_export.project_name AS project_name,
      SUM(gcp_billing_export.total_cost) AS total_net_cost
      FROM
      ${project_daily_spend.SQL_TABLE_NAME} AS gcp_billing_export

      -- Filter out records based on Avg Monthly Spend Table
      INNER JOIN
      avg_monthly_spend_by_project
      ON  COALESCE(gcp_billing_export.project_id, "Null Project ID")  = avg_monthly_spend_by_project.project_id

      -- Use last 57 weeks (~13 months) of billing data to train model
      WHERE
      DATE(gcp_billing_export.usage_start_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)

      GROUP BY
      1, 2, 3
      ;;
  }

# TODO: Fields based on BQML Parameters
#  ------ START Customized Fields based on BQML Parameters ------ {
  dimension: project_name {
    type: string
  }

  dimension: project_id {
    type: string
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date_raw
    sql: ${usage_start_date} || ${project_name} ;;
  }
#  ------ END Customized Fields based on BQML Parameters ------ }

  dimension: usage_start_date {
    type: date
    datatype: date
    sql: DATE(${TABLE}.usage_start_date) ;;
    convert_tz: no
  }

  dimension_group: usage {
    type: time
    hidden: yes
    timeframes: [date,raw]
    datatype: date
    sql: ${TABLE}.usage_start_date ;;
    convert_tz: no
    html: {{ usage_raw._rendered_value }} ;;
  }

  dimension: total_cost {
    type: number
    sql: ${TABLE}.total_net_cost ;;
  }

  measure: row_count {
    # hidden: yes
    type: count
  }
  measure: total_net_cost {
    type: sum
    sql: ${total_cost} ;;
  }
}
view: project_forecast_data_net_cost {
  # Forecast data, incremental update
  extends: [project_input_data_net_cost]

  derived_table: {
    datagroup_trigger: billing_datagroup
    partition_keys: ["usage_start_date"]
    cluster_keys: ["project_name","project_id"]

    sql:
      WITH
        avg_monthly_spend_by_project AS ( SELECT * FROM ${project_avg_monthly_spend.SQL_TABLE_NAME} )
      SELECT
        (DATE(gcp_billing_export.usage_start_date)) AS usage_start_date,
        COALESCE(gcp_billing_export.project_id, "Null Project ID") AS project_id,
        gcp_billing_export.project_name AS project_name,
        SUM(gcp_billing_export.total_net_cost) AS total_net_cost
      FROM
        ${project_daily_spend.SQL_TABLE_NAME} AS gcp_billing_export

      -- Filter out records with less than $1,000 average monthly spend & have at least 3 months history
      INNER JOIN
      avg_monthly_spend_by_project
      ON COALESCE(gcp_billing_export.project_id, "Null Project ID") = avg_monthly_spend_by_project.project_id
      GROUP BY
      1, 2, 3
      ;;
  }

}
