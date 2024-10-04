view: testing {
  derived_table: {
    sql:
    select 1 as NOK, 'OK' as status union all
    select 0 as NOK, 'NOK' as status


    ;;
  }

  dimension: nok {
    sql:  ${TABLE}.NOK;;
    type: number
  }

  dimension: status {
    type: string
  }

  dimension: status_icon {
    type: string
    sql: case
    when ${status} = 'OK' then '🟢'
    else '🔴'
    end
    ;;
  }

 }


explore: testing {}
