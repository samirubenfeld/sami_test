view: top_10_locations {
  derived_table: {
    sql: #standardSQL
      SELECT
        boroname,
        latitude,
        longitude,
        COUNT(*) AS count
      FROM
        `bigquery-public-data.new_york.tree_census_2015`
      WHERE latitude IS NOT null AND longitude IS NOT null
      GROUP BY
        latitude, longitude, boroname
      ORDER BY
        count DESC
      LIMIT
        10
       ;;
  }

  dimension: boroname {
    type: string
    sql: ${TABLE}.boroname ;;
  }

  dimension: latitude {
    type: string
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: string
    sql: ${TABLE}.longitude ;;
  }

  dimension: count {
    type: string
    sql: ${TABLE}.count ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  measure: sum {
    type: sum
    sql: ${count} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [boroname, latitude, longitude, count, location]
  }
}
