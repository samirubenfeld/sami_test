view: future_2017 {
  sql_table_name: ecommerce_forecast.future_2017 ;;

  dimension_group: ds {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.ds ;;
  }

#   dimension: int64_field_0 {
#     type: number
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: yhat {
    type: number
    sql: ${TABLE}.yhat ;;
  }

  dimension: yhat_lower {
    type: number
    sql: ${TABLE}.yhat_lower ;;
  }

  dimension: yhat_upper {
    type: number
    sql: ${TABLE}.yhat_upper ;;
  }

  #MEASURES

  measure: count {
    type: count
    drill_fields: []
  }

  measure: yhat_measure {
    type: sum
    sql: ${yhat} ;;
  }

  measure: yhat_lower_measure {
    type: sum
    sql: ${yhat_lower} ;;
  }

  measure: yhat_upper_measure {
    type: sum
    sql: ${yhat_upper} ;;
  }

}
