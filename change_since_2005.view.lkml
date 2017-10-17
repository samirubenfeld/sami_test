view: change_since_2005 {
  derived_table: {
    sql: SELECT
        IFNULL(a.upper_latin, b.upper_latin) as upper_latin,
        IFNULL(count_2015, 0) as count_2015,
        IFNULL(count_2005, 0) as count_2005,
        (IFNULL(count_2015, 0)-IFNULL(count_2005, 0)) AS count_growth,
        (IFNULL(alive_2015, 0)-IFNULL(alive_2005, 0)) as alive_growth,
        (IFNULL(dead_2015, 0)-IFNULL(dead_2005, 0)) as dead_growth
      FROM (
        SELECT
          UPPER(spc_latin) AS upper_latin,
          spc_common,
          COUNT(*) AS count_2015,
          COUNTIF(status="Alive") AS alive_2015,
          COUNTIF(status="Dead") AS dead_2015
        FROM
          `triple-shadow-181317.nyc_trees.tree_census_2015_bigquery`
        WHERE spc_latin != ""
        GROUP BY
          spc_latin,
          spc_common)a
      FULL OUTER JOIN (
        SELECT
          UPPER(spc_latin) AS upper_latin,
          COUNT(*) AS count_2005,
          COUNTIF(status!="Dead") AS alive_2005,
          COUNTIF(status="Dead") AS dead_2005
        FROM
          `triple-shadow-181317.nyc_trees.tree_census_2005_bigquery`
        GROUP BY
          spc_latin)b
      ON
        a.upper_latin=b.upper_latin
      ORDER BY
        count_growth DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: upper_latin {
    type: string
    sql: ${TABLE}.upper_latin ;;
  }

  dimension: count_2015 {
    type: string
    sql: ${TABLE}.count_2015 ;;
  }

  dimension: count_2005 {
    type: string
    sql: ${TABLE}.count_2005 ;;
  }

  dimension: count_growth {
    type: string
    sql: ${TABLE}.count_growth ;;
  }

  dimension: alive_growth {
    type: string
    sql: ${TABLE}.alive_growth ;;
  }

  dimension: dead_growth {
    type: string
    sql: ${TABLE}.dead_growth ;;
  }

  measure: total_2015 {
    type: sum
    sql: ${count_2015} ;;
  }

  measure: total_2005 {
    type: sum
    sql: ${count_2005} ;;
  }

  measure: total_growth {
    type: sum
    sql: ${count_growth} ;;
  }

  measure: total_alive_growth {
    type: sum
    sql: ${alive_growth} ;;
  }

  measure: total_dead_growth {
    type: sum
    sql: ${dead_growth} ;;
  }

  set: detail {
    fields: [
      upper_latin,
      count_2015,
      count_2005,
      count_growth,
      alive_growth,
      dead_growth
    ]
  }
}
