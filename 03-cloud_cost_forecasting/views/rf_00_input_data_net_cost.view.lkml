include: "/02-cost_anomaly_detection/views/01_project_cost_anomalies/00_project_input_data_net_cost.view"
view: +project_avg_monthly_spend {
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
                AND DATE(gcp_billing_export.usage_start_date) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (2*57*7) DAY)
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
      AVG(total_net_cost) as avg_net_cost,
      COUNT(1) as project_month_count
      FROM monthly_project_spend
      GROUP BY 1, 2
      HAVING
      AVG(total_net_cost) > 1000 AND
      COUNT(1) >= 6
      ;;
  }
}
