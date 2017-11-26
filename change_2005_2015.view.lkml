view: change_2005_2015 {
  derived_table: {
    sql: SELECT
        IFNULL(a.borocode, b.borocode) as borocode,
        IFNULL(count_2015, 0) as count_2015,
        IFNULL(count_2005, 0) as count_2005,
        (IFNULL(count_2015, 0)-IFNULL(count_2005, 0)) AS count_growth,
        (IFNULL(alive_2015, 0)-IFNULL(alive_2005, 0)) as alive_growth,
        (IFNULL(dead_2015, 0)-IFNULL(dead_2005, 0)) as dead_growth
      FROM (
        SELECT
         borocode,
          COUNT(*) AS count_2015,
          COUNTIF(status="Alive") AS alive_2015,
          COUNTIF(status="Dead") AS dead_2015
        FROM
          `bigquery-public-data.new_york.tree_census_2015`
        GROUP BY
          borocode)a
      LEFT OUTER JOIN (
        SELECT
          borocode,
          COUNT(*) AS count_2005,
          COUNTIF(status!="Dead") AS alive_2005,
          COUNTIF(status="Dead") AS dead_2005
        FROM
          `bigquery-public-data.new_york.tree_census_2005`
        GROUP BY
          borocode)b
      ON
        a.borocode=b.borocode
      ORDER BY
        count_growth DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: borocode {
    type: string
    sql: ${TABLE}.borocode ;;
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

  #MEASURES

  measure: sum_count_2005 {
    type: sum
    sql: ${count_2005} ;;
  }

  measure: sum_count_2015 {
    type: sum
    sql: ${count_2015} ;;
  }

  measure: sum_count_growth {
    type: sum
    sql: ${count_growth} ;;
  }

  measure: sum_dead_growth {
    type: sum
    sql: ${dead_growth} ;;
  }

  measure: sum_alive_growth {
    type: sum
    sql: ${alive_growth} ;;
  }



  set: detail {
    fields: [
      borocode,
      count_2015,
      count_2005,
      count_growth,
      alive_growth,
      dead_growth
    ]
  }
}
