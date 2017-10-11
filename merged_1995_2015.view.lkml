view: merged_1995_2015 {
  derived_table: {
    sql: SELECT * FROM `triple-shadow-181317.nyc_trees.1995_clean`
      WHERE LATITUDE != 1 AND LONGITUDE != 1
      UNION ALL
      SELECT * FROM `triple-shadow-181317.nyc_trees.2015_clean`
      WHERE LATITUDE != 1 AND LONGITUDE != 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }



#   dimension: int64_field_0 {
#     type: string
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.ZIPCODE ;;
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

  dimension: latitude {
    type: string
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.LONGITUDE ;;
  }


  dimension: date {
    type: date_year
    sql: ${TABLE}.date ;;
  }

  dimension: rounded_location {
    type: location
    sql_latitude: ROUND(${latitude},2);;
    sql_longitude: ROUND(${longitude},2);;
  }


  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  set: detail {
    fields: [
      zipcode,
      spc_common,
      spc_latin,
      status,
      latitude,
      longitude,
      date,
      location
    ]
  }
}
