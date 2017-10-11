view: trees_2015_clean {
  sql_table_name: nyc_trees.2015_clean ;;

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

#   dimension: int64_field_0 {
#     type: number
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: spc_common {
    type: string
    sql: ${TABLE}.SPC_COMMON ;;
  }

  dimension: spc_latin {
    type: string
    sql: ${TABLE}.SPC_LATIN ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.ZIPCODE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
