view: bqml_model_info__feature_info {

  dimension: bqml_model_info__feature_info {
    type: string
    hidden: yes
    sql: bqml_model_info__feature_info ;;
  }

  dimension: category_count {
    type: number
    sql: category_count ;;
  }

  dimension: input {
    type: string
    sql: input ;;
  }

  dimension: max {
    type: number
    sql: max ;;
  }

  dimension: median {
    type: number
    sql: median ;;
  }

  dimension: min {
    type: number
    sql: min ;;
  }

  dimension: null_count {
    type: number
    sql: null_count ;;
  }

  dimension: stddev {
    type: number
    sql: stddev ;;
  }

  measure: row_count {
    label: "Number of Rows"
    type: number
#Update SQL parameter to  dimension you want to filter on  sql: max(case when ${input}='site_num' then ${category_count} end);;
    sql: max(case when ${input}='currency' then ${category_count} end);;
    value_format_name: decimal_0
  }

}
