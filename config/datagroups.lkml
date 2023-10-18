datagroup: monthly_on_day_2 {
  sql_trigger:
  SELECT CASE WHEN EXTRACT(day FROM CURRENT_DATE()) >= 2
              THEN EXTRACT(month from DATE_ADD(CURRENT_DATE(), INTERVAL 1 MONTH))
              ELSE EXTRACT(month FROM CURRENT_DATE()) END ;;
}

datagroup: does_not_update {
  sql_trigger: 1 ;;
}
