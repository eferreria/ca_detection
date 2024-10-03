datagroup: monthly_on_day_2 {
  sql_trigger:
  SELECT CASE WHEN EXTRACT(day FROM CURRENT_DATE()) >= 2
              THEN EXTRACT(month from DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH))
              ELSE EXTRACT(month FROM CURRENT_DATE()) END ;;
}

datagroup: does_not_update {
  sql_trigger: 1 ;;
}

datagroup: daily_datagroup {
  sql_trigger: select MAX(partition_date) from `@{BILLING_TABLE}` ;;
  max_cache_age: "24 hours"
}

datagroup: near_real_time {
  sql_trigger: select count(*) from `@{BILLING_TABLE}` ;;
  max_cache_age: "1 hour"
}
