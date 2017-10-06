view: future {
  sql_table_name: ecommerce_forecast.future ;;

  dimension: daily {
    type: number
    sql: ${TABLE}.daily ;;
  }

  dimension: daily_lower {
    type: number
    sql: ${TABLE}.daily_lower ;;
  }

  dimension: daily_upper {
    type: number
    sql: ${TABLE}.daily_upper ;;
  }

  dimension_group: ds {
    alias: [timeperiod]
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

  dimension: seasonal {
    type: number
    sql: ${TABLE}.seasonal ;;
  }

  dimension: seasonal_lower {
    type: number
    sql: ${TABLE}.seasonal_lower ;;
  }

  dimension: seasonal_upper {
    type: number
    sql: ${TABLE}.seasonal_upper ;;
  }

  dimension: seasonalities {
    type: number
    sql: ${TABLE}.seasonalities ;;
  }

  dimension: seasonalities_lower {
    type: number
    sql: ${TABLE}.seasonalities_lower ;;
  }

  dimension: seasonalities_upper {
    type: number
    sql: ${TABLE}.seasonalities_upper ;;
  }

  dimension: trend {
    type: number
    sql: ${TABLE}.trend ;;
  }

  dimension: trend_lower {
    type: number
    sql: ${TABLE}.trend_lower ;;
  }

  dimension: trend_upper {
    type: number
    sql: ${TABLE}.trend_upper ;;
  }

  dimension: weekly {
    type: number
    sql: ${TABLE}.weekly ;;
  }

  dimension: weekly_lower {
    type: number
    sql: ${TABLE}.weekly_lower ;;
  }

  dimension: weekly_upper {
    type: number
    sql: ${TABLE}.weekly_upper ;;
  }

  dimension: yearly {
    type: number
    sql: ${TABLE}.yearly ;;
  }

  dimension: yearly_lower {
    type: number
    sql: ${TABLE}.yearly_lower ;;
  }

  dimension: yearly_upper {
    type: number
    sql: ${TABLE}.yearly_upper ;;
  }

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

### MEASURES

  measure: yhat_total {
    type: sum
    sql: ${TABLE}.yhat ;;
  }

  measure: yhat_lower_total {
    type: sum
    sql: ${TABLE}.yhat_lower ;;
  }

  measure: yhat_upper_total {
    type: sum
    sql: ${yhat_upper};;
  }

  measure: seasonal_total {
    type: sum
    sql: ${seasonal} ;;
  }

  measure: seasonal_lower_total {
    type: sum
    sql: ${seasonal_lower} ;;
  }

  measure: seasonal_upper_total {
    type: sum
    sql: ${seasonal_upper} ;;
  }

  measure: trend_total {
    type: sum
    sql: ${trend} ;;
  }

  measure: trend_lower_total {
    type: sum
    sql: ${trend_lower} ;;
  }

  measure: trend_upper_total {
    type: sum
    sql: ${trend_upper} ;;
  }

  measure: yearly_total {
    type: sum
    sql: ${yearly} ;;
  }

  measure: yearly_lower_total {
    type: sum
    sql: ${yearly_lower} ;;
  }

  measure: yearly_upper_total {
    type: sum
    sql: ${yearly_upper} ;;
  }

  measure: weekly_total {
    type: sum
    sql: ${weekly} ;;
  }

  measure: weekly_lower_total {
    type: sum
    sql: ${weekly_lower} ;;
  }

  measure: weekly_upper_total {
    type: sum
    sql: ${weekly_upper} ;;
  }

  measure: daily_total {
    type: sum
    sql: ${daily};;
  }

  measure: daily_lower_total {
    type: sum
    sql: ${daily_lower} ;;
  }

  measure: daily_upper_total {
    type: sum
    sql: ${daily_upper} ;;
  }

  measure: seasonalities_total {
    type: sum
    sql: ${seasonalities} ;;
  }

  measure: seasonalities_lower_total {
    type: sum
    sql: ${seasonalities_lower} ;;
  }

  measure: seasonalities_upper_total {
    type: sum
    sql: ${seasonalities_upper} ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
