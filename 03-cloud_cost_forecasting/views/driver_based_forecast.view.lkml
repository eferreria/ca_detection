view: driver_based_forecast {
  sql_table_name: `eaf-barong-da-qa.billing.driver_based_forecast` ;;

  dimension: additional_projected_spend {
    type: number
    sql: ${TABLE}.additional_projected_spend ;;
  }
  dimension_group: budget_start_month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.budget_start_month ;;
  }
  dimension: projectid {
    type: string
    sql: ${TABLE}.projectid ;;
  }
  dimension: yearly_budget {
    type: number
    sql: ${TABLE}.yearly_budget ;;
  }
  measure: count {
    type: count
  }
}
