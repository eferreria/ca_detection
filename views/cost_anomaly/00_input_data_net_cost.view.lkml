explore: project_daily_spend {}
explore: project_avg_monthly_spend {}
explore: project_forecast_data_net_cost {}
view: project_daily_spend {
  # incremental update, source for all project tables
  derived_table: {
    datagroup_trigger: near_real_time
    partition_keys: ["usage_start_date"]
    # increment_key: "partition_date"
    # increment_offset: 0
    sql:
    SELECT
              gcp_billing_export.project.id AS project_id,
              -- gcp_billing_export.app_id as app_id,
              -- gcp_billing_export.env as env,
              gcp_billing_export.project.name  AS project_name,
              TIMESTAMP_TRUNC(usage_start_time, DAY, 'America/Los_Angeles') as usage_start_date,
              partition_date,
              (SUM(CAST(cost AS NUMERIC)) + SUM(IFNULL((SELECT SUM (CAST(c.amount AS NUMERIC)) FROM UNNEST(credits) AS c), 0))) AS total_net_cost
          FROM
            ${gcp_billing_export.SQL_TABLE_NAME} AS gcp_billing_export
          WHERE
              -- Filter out Marketplace purchases
              project.name IS NOT NULL
        -- Use last 57 weeks (~13 months) of billing data to train model
        -- AND DATE(gcp_billing_export.usage_start_time) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
        AND
        DATE(gcp_billing_export.partition_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
        -- {% incrementcondition %} partition_date {% endincrementcondition %}
        GROUP BY
        1,
        2,
        3, 4
        --, 5, 6
    ;;
  }

  dimension: net_cost {
    type: number
    sql: ${TABLE}.total_net_cost ;;
  }
  measure: total_net_cost {
    type: sum
    sql: ${net_cost} ;;

  }

  dimension: project_id {}
  dimension: project_name {}
  dimension: partition_date {
    type: date_time
    sql: ${TABLE}.partition_date ;;
  }
  dimension: usage_start_date {
    type: date_time
    sql: ${TABLE}.usage_start_date ;;
  }
}
view: project_avg_monthly_spend {
  # calculate monthly avg spend, 57 week window
  derived_table: {
    datagroup_trigger: monthly_on_day_2
    sql:
    WITH

          monthly_project_spend AS (
          SELECT
          project_id,
          project_name,
          (FORMAT_TIMESTAMP('%Y-%m', gcp_billing_export.usage_start_date , 'America/Los_Angeles')) AS usage_start_month,
          SUM(total_net_cost) as total_net_cost
          FROM
          ${project_daily_spend.SQL_TABLE_NAME} AS gcp_billing_export
          WHERE
          -- Filter out Marketplace purchases
          project_name IS NOT NULL
          -- Use last 57 weeks (~13 months) of billing data to train model
          AND DATE(gcp_billing_export.usage_start_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
          -- AND DATE(gcp_billing_export.partition_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
          GROUP BY
          1,
          2,
          3
          )

      -- Get a list of all projects with more than $1,000 monthly average spend
      SELECT
      project_id,
      project_name,
      AVG(total_net_cost)
      FROM monthly_project_spend
      GROUP BY 1, 2
      HAVING
      AVG(total_net_cost) > 1000
      ;;
  }
  measure: count {
    type: count
  }
}
view: project_input_data_net_cost {
  ## Select data to be used in the ARIMA model

  ## Level of detail: usage start date, project
  ## Timeframe: past 57 weeks (~1 year)
  ## Filter criteria: GCP projects which have at least $1000 average monthly spend (increase threshold if retraining cadence is short (<2 weeks))
  ## Metric: sum(cost) for ARIMA model

  derived_table: {
    datagroup_trigger: monthly_on_day_2
    partition_keys: ["usage_start_date"]
    cluster_keys: ["project_name","project_id"]
    sql:
      WITH
        avg_monthly_spend_by_project AS (
        SELECT
        *
        FROM
        ${project_avg_monthly_spend.SQL_TABLE_NAME}
      )
      SELECT
      (DATE(gcp_billing_export.usage_start_time)) AS usage_start_date,
      gcp_billing_export.project.id AS project_id,
      gcp_billing_export.project.name AS project_name,
      (SUM(CAST(cost AS NUMERIC)) + SUM(IFNULL((SELECT SUM (CAST(c.amount AS NUMERIC)) FROM UNNEST(credits) AS c), 0))) AS total_net_cost
      FROM
      ${gcp_billing_export.SQL_TABLE_NAME} AS gcp_billing_export

      -- Filter out projects with less than $1,000 average monthly spend
      INNER JOIN
      avg_monthly_spend_by_project
      ON gcp_billing_export.project.id = avg_monthly_spend_by_project.project_id

      -- Use last 57 weeks (~13 months) of billing data to train model
      WHERE
      -- DATE(gcp_billing_export.usage_start_time) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
      DATE(gcp_billing_export.partition_date)  >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
      GROUP BY
      1, 2, 3
      ;;
  }

  dimension: pk {
    primary_key: yes
    hidden: yes
    type: date_raw
    sql: ${usage_start_date} || ${project_name} ;;
  }

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

  dimension: project_name {
    type: string
  }

  dimension: project_id {
    type: string
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
  # forecast data, incremental update
  extends: [project_input_data_net_cost]
  derived_table: {
    datagroup_trigger: near_real_time
    partition_keys: ["usage_start_date"]
    cluster_keys: ["project_name","project_id"]
    # increment_key: "usage_start_date"
    # increment_offset: 45
    sql:
      WITH

                    avg_monthly_spend_by_project AS (
                    SELECT
                    *
                    FROM
                    ${project_avg_monthly_spend.SQL_TABLE_NAME}
                  )
                  SELECT
                  (DATE(gcp_billing_export.usage_start_date)) AS usage_start_date,
                  gcp_billing_export.project_id AS project_id,
                  gcp_billing_export.project_name AS project_name,
                  SUM(gcp_billing_export.total_net_cost) AS total_net_cost
                  FROM
                  ${project_daily_spend.SQL_TABLE_NAME} AS gcp_billing_export

      -- Filter out projects with less than $1,000 average monthly spend
      INNER JOIN
      avg_monthly_spend_by_project
      ON gcp_billing_export.project_id = avg_monthly_spend_by_project.project_id

      -- Use last 57 weeks (~13 months) of billing data to train model
      -- WHERE
      -- DATE(gcp_billing_export.usage_start_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
      -- DATE(gcp_billing_export.partition_date)  >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
      GROUP BY
      1, 2, 3
      ;;
  }

}
