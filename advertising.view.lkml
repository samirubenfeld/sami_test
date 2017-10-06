view: advertising {
  sql_table_name: ecommerce_forecast.advertising ;;

#   dimension: int64_field_0 {
#     type: number
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: newspaper {
    type: number
    sql: ${TABLE}.Newspaper ;;
  }

  dimension: radio {
    type: number
    sql: ${TABLE}.Radio ;;
  }

  dimension: sales {
    type: number
    sql: ${TABLE}.Sales ;;
  }

  dimension: tv {
    type: number
    sql: ${TABLE}.TV ;;
  }

  dimension: sales_tier {
    type: tier
    tiers: [5, 10, 25, 50]
    sql: ${sales} ;;
  }

  #MEASURES

  measure: count {
    type: count
    drill_fields: [newspaper, tv, radio, sales]
  }

  measure: newspaper_total {
    type: sum
    sql: ${newspaper} ;;
    value_format_name: usd
  }

  measure: radio_total {
    type: sum
    sql: ${radio} ;;
    value_format_name: usd
  }

  measure: sales_total {
    type: sum
    sql: ${sales} ;;
    value_format: "0.00"
  }

  measure: tv_total {
    type: sum
    sql: ${tv} ;;
    value_format_name: usd
  }

  measure: tv_total_alt {
    type: sum
    sql: ${tv} ;;
    value_format: "0.00"
  }

  measure: average_tv_price {
    type: average
    sql: ${tv} ;;
    value_format: "$#,##0.00"
  }

  measure: average_newspaper_price {
    type: average
    sql: ${newspaper} ;;
    value_format: "$#,##0.00"
  }

  measure: average_radio_price {
    type: average
    sql: ${radio} ;;
    value_format: "$#,##0.00"
  }

  measure: aggregate_ad_spend {
    type:  number
    sql:  ${newspaper_total}+${radio_total}+${tv_total} ;;
    value_format: "$#,##0.00"
  }



}
