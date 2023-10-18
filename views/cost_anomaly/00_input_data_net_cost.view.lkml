view: input_data_net_cost {
  ## Select data to be used in the ARIMA model

  ## Level of detail: usage start date, project
  ## Timeframe: past 57 weeks (~1 year)
  ## Filter criteria: GCP projects which have at least $1000 average monthly spend (increase threshold if retraining cadence is short (<2 weeks))
  ## Metric: sum(cost) for ARIMA model

  # derived_table: {
  #   datagroup_trigger: does_not_update
  #   partition_keys: ["usage_start_date"]
  #   cluster_keys: ["project_name","project_id"]
  #   sql:
  #     WITH
  #       gcp_billing_export AS (
  #         SELECT
  #           *,
  #           GENERATE_UUID() as pk
  #         FROM `gcp_billing_export.pso_eng_gcp_billing_export_v1_0090FE_ED3D81_AF8E3B`
  #       )
  #       ,monthly_project_spend AS (
  #         SELECT
  #             COALESCE(IF(gcp_billing_export.service.description = 'Support', 'Support', gcp_billing_export.project.id),"Unknown")  AS gcp_billing_export_project__id,
  #             gcp_billing_export.project.name  AS project_name,
  #                 (FORMAT_TIMESTAMP('%Y-%m', gcp_billing_export.usage_start_time , 'America/Chicago')) AS usage_start_month,
  #                 ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( (gcp_billing_export.cost ) ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk )  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk )  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk )  AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk )  AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS NUMERIC), 0), 6) - COALESCE(SUM(-1* gcp_billing_export__credits.amount   ), 0) AS total_net_cost
  #         FROM
  #           gcp_billing_export AS gcp_billing_export
  #           LEFT JOIN UNNEST(gcp_billing_export.credits) as gcp_billing_export__credits
  #         WHERE
  #             -- Filter out Marketplace purchases
  #             project.name IS NOT NULL
  #       -- Use last 57 weeks (~13 months) of billing data to train model
  #       AND DATE(gcp_billing_export.usage_start_time) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
  #       GROUP BY
  #       1,
  #       2,
  #       3
  #       )

  #     -- Get a list of all projects with more than $1,000 monthly average spend
  #     ,avg_monthly_spend_by_project AS (
  #       SELECT
  #       project_name,
  #       AVG(total_net_cost)
  #       FROM monthly_project_spend
  #       GROUP BY 1
  #       HAVING
  #       AVG(total_net_cost) > 1000
  #     )
  #     SELECT
  #     (DATE(gcp_billing_export.usage_start_time)) AS usage_start_date,
  #     COALESCE(IF(gcp_billing_export.service.description = 'Support', 'Support', gcp_billing_export.project.id), "UNKNOWN") AS project_id,
  #     gcp_billing_export.project.name AS project_name,
  #     ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( (gcp_billing_export.cost ) , 0)*(1 / 1000*1.0), 9) AS NUMERIC) + (CAST(CAST(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk ) AS STRING))), 1, 15)) AS int64) AS NUMERIC) * 4294967296 + CAST(CAST(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk ) AS STRING))), 16, 8)) AS int64) AS NUMERIC)) * 0.000000001 )) - SUM(DISTINCT (CAST(CAST(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk ) AS STRING))), 1, 15)) AS int64) AS NUMERIC) * 4294967296 + CAST(CAST(concat('0x', substr(to_hex(md5(CAST( (gcp_billing_export.pk ) AS STRING))), 16, 8)) AS int64) AS NUMERIC)) * 0.000000001) ) / (1 / 1000*1.0) AS NUMERIC), 0), 6) - COALESCE(SUM( - 1* gcp_billing_export__credits.amount ), 0) AS total_net_cost
  #     FROM
  #     gcp_billing_export AS gcp_billing_export
  #     LEFT JOIN
  #     UNNEST(gcp_billing_export.credits) AS gcp_billing_export__credits

  #     -- Filter out projects with less than $1,000 average monthly spend
  #     INNER JOIN
  #     avg_monthly_spend_by_project
  #     ON gcp_billing_export.project.name = avg_monthly_spend_by_project.project_name

  #     -- Use last 57 weeks (~13 months) of billing data to train model
  #     WHERE
  #     DATE(gcp_billing_export.usage_start_time) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 DAY), INTERVAL (57*7) DAY)
  #     GROUP BY
  #     1, 2, 3
  #     ;;
  # }

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
    hidden: yes
    type: count
  }
}



# view: input_data_net_cost {
#   ## Select data to be used in the ARIMA model

#   ## level of detail: usage start date, project
#   ## timeframe: past 1.5 years
#   ## projects: GCP projects which have at least $100 spend in the last 1.5 years (78 weeks)
#   ## metrics: sum(cost) for ARIMA model

#   derived_table: {
#     sql:
    # WITH
    #   gcp_billing_export AS (
    #     SELECT
    #       *,
    #       GENERATE_UUID() as pk
    #     FROM
    #       `gcp_billing_export.pso_eng_gcp_billing_export_v1_0090FE_ED3D81_AF8E3B`
    # )
#     SELECT
#         gcp_billing_export_usage_start_date as usage_start_date,
#         gcp_billing_export_project_name as project_name,
#         gcp_billing_export_cost_before_credits + gcp_billing_export_credits_total_credit AS total_cost
#     FROM
#         (
#           SELECT
#             (DATE(gcp_billing_export.usage_start_time )) AS gcp_billing_export_usage_start_date,
#             gcp_billing_export_project.name AS gcp_billing_export_project_name,
#             ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( gcp_billing_export.cost  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS gcp_billing_export_cost_before_credits,
#             COALESCE(SUM(gcp_billing_export_credits.amount ), 0) AS gcp_billing_export_credits_total_credit,
#             ROUND(COALESCE(CAST( ( SUM(DISTINCT (CAST(ROUND(COALESCE( gcp_billing_export.cost  ,0)*(1/1000*1.0), 9) AS NUMERIC) + (cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001 )) - SUM(DISTINCT (cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 1, 15)) as int64) as numeric) * 4294967296 + cast(cast(concat('0x', substr(to_hex(md5(CAST( gcp_billing_export.pk   AS STRING))), 16, 8)) as int64) as numeric)) * 0.000000001) )  / (1/1000*1.0) AS FLOAT64), 0), 6) AS gcp_billing_export_cost_before_credits_0,
#             COALESCE(SUM(gcp_billing_export_credits.amount ), 0) AS gcp_billing_export_credits_total_credit_0
#           FROM gcp_billing_export
#           LEFT JOIN UNNEST([gcp_billing_export.project]) AS gcp_billing_export_project
#           LEFT JOIN UNNEST(credits) AS gcp_billing_export_credits
#           WHERE
#             DATE(gcp_billing_export.usage_start_time) >= DATE_SUB(DATE_SUB(CURRENT_DATE(), INTERVAL 1 day), INTERVAL (78 * 7) DAY)
#           GROUP BY
#             1, 2
#           HAVING
#             (gcp_billing_export_cost_before_credits + gcp_billing_export_credits_total_credit) > 100
#         ) AS t3
#       ;;
#   }

#   dimension: pk {
#     primary_key: yes
#     hidden: yes
#     type: date_raw
#     sql: ${usage_start_date} || ${project_name} ;;
#   }

#   dimension: usage_start_date {
#     type: date
#     datatype: date
#     sql: DATE(${TABLE}.usage_start_date)    ;;
#     convert_tz: no
#   }

#   dimension_group: usage {
#     type: time
#     hidden: yes
#     timeframes: [date,raw]
#     datatype: date
#     sql: ${TABLE}.usage_start_date ;;
#     convert_tz: no
#     html: {{ usage_raw._rendered_value }} ;;
#   }

#   dimension: project_name {
#     type: string
#   }

#   dimension: total_cost {
#     type: number
#     sql: ${TABLE}.total_cost ;;
#   }

#   measure: row_count {
#     hidden: yes
#     type: count
#   }

# }
