view: top_nyc_locations {
  derived_table: {
    sql: SELECT
        latitude,
        longitude,
        COUNT(*) AS count
      FROM
        `triple-shadow-181317.nyc_trees.tree_census_2015_bigquery`
      WHERE latitude IS NOT null AND longitude IS NOT null
      GROUP BY
        latitude, longitude
      ORDER BY
        count DESC
      LIMIT
        10
       ;;
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

  set: detail {
    fields: [latitude, longitude, count, location]
  }
}
