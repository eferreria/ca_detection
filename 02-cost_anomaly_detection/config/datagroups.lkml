datagroup: monthly_on_day_2 {
  sql_trigger:
  SELECT CASE WHEN EXTRACT(day FROM CURRENT_DATE()) >= 2
              THEN EXTRACT(month from DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH))
              ELSE EXTRACT(month FROM CURRENT_DATE()) END ;;
}

datagroup: does_not_update {
  sql_trigger: 1 ;;
}

# This needs to be usage date to prevent full table scans
datagroup: daily_datagroup {
  sql_trigger: select MAX(partition_date) from `@{BILLING_TABLE}` ;;
  max_cache_age: "24 hours"
  description: "Triggers a rebuild when new records are added"
}

datagroup: near_real_time {
  sql_trigger: select count(*) from `@{BILLING_TABLE}` ;;
  max_cache_age: "1 hour"
}

datagroup: billing_datagroup {
  sql_trigger: select MAX(usage_date) from `@{BILLING_TABLE}` ;;
  max_cache_age: "24 hour"
  description: "Triggers a rebuild when new data is exported"
}

datagroup: pricing_datagroup {
  sql_trigger: select count(*) from `@{PRICING_TABLE}` ;;
  max_cache_age: "24 hour"
  description: "Triggers a rebuild when records are added"
}

# Use for specific TIME to update window
# datagroup: monthly_on_day_2 {
#   sql_trigger:
#   SELECT
#       CASE
#         -- When we are on second day of the month
#         WHEN EXTRACT(day FROM CURRENT_DATE()) = 2 THEN
#           -- Trigger at 15 UTC (11am EST)
#           CASE WHEN EXTRACT(HOUR FROM current_timestamp()) >= 15
#           THEN EXTRACT(month from DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH))
#           ELSE EXTRACT(month FROM CURRENT_DATE())
#           END
#         -- When it is past the second day of the month
#         WHEN EXTRACT(day FROM CURRENT_DATE()) > 2
#           THEN EXTRACT(month from DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH))

#     ELSE EXTRACT(month FROM CURRENT_DATE())
#     END as month_v2 ;;
# }
