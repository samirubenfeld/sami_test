view: taxi_vs_bikes_2015 {
  sql_table_name: `fh-bigquery.public_dump.taxi_vs_bikes_2015`
    ;;

  dimension: bike_minutes {
    type: number
    sql: ${TABLE}.bike_minutes ;;
  }

  dimension: bike_trips {
    type: number
    sql: ${TABLE}.bike_trips ;;
  }

  dimension: end {
    type: string
    sql: ${TABLE}.`end` ;;
  }

  dimension: lat1 {
    type: number
    sql: ${TABLE}.lat1 ;;
  }

  dimension: lat2 {
    type: number
    sql: ${TABLE}.lat2 ;;
  }

  dimension: location_1 {
    type: location
    sql_latitude: ${TABLE}.lat1;;
    sql_longitude:${TABLE}.lon1;;
  }

  dimension: location_2 {
    type: location
    sql_latitude: ${TABLE}.lat2;;
    sql_longitude:${TABLE}.lon2;;
  }

  dimension: lon1 {
    type: number
    sql: ${TABLE}.lon1 ;;
  }

  dimension: lon2 {
    type: number
    sql: ${TABLE}.lon2 ;;
  }

  dimension: start {
    type: string
    sql: ${TABLE}.start ;;
  }

  dimension: taxi_minutes {
    type: number
    sql: ${TABLE}.taxi_minutes ;;
  }

  dimension: taxi_trips {
    type: number
    sql: ${TABLE}.taxi_trips ;;
  }


  #MEASURES

  measure: taxi_trips_sum {
    type: sum
    sql: ${TABLE}.taxi_trips ;;
  }

  measure: taxi_minutes_sum {
    type: sum
    sql: ${TABLE}.taxi_minutes ;;
  }

  measure: bike_minutes_sum {
    type: sum
    sql: ${TABLE}.bike_minutes ;;
  }

  measure: bike_trips_sum {
    type: sum
    sql: ${TABLE}.bike_trips ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
