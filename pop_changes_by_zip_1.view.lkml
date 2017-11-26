view: pop_changes_by_zip_1 {
  derived_table: {
    sql: SELECT
        IFNULL(a.zipcode, b.zipcode) as zipcode,
        IFNULL(count_2015, 0) as count_2015,
        IFNULL(count_1995, 0) as count_1995,
        (IFNULL(alive_2015, 0)-IFNULL(alive_1995, 0)) as alive_growth,
        (IFNULL(dead_2015, 0)-IFNULL(dead_1995, 0)) as dead_growth,
        (IFNULL(count_2015, 0)-IFNULL(count_1995, 0)) AS pop_chg,
        ROUND((count_2015 - count_1995)/NULLIF(count_1995,0) * 100, 2) AS pop_pct_chg,
         ABS((count_2015- count_1995)/NULLIF(count_1995,0)) AS abs_pct_chg
      FROM (
        SELECT
          zipcode,
          COUNT(*) AS count_2015,
          COUNTIF(status="Alive") AS alive_2015,
          COUNTIF(status="Dead") AS dead_2015
        FROM
          `bigquery-public-data.new_york.tree_census_2015`
        GROUP BY
         zipcode)a
      INNER JOIN (
        SELECT
          zip_new as zipcode,
          COUNT(*) AS count_1995,
          COUNTIF(status!="Dead") AS alive_1995,
          COUNTIF(status="Dead") AS dead_1995
        FROM
          `bigquery-public-data.new_york.tree_census_1995`
        GROUP BY
          zipcode)b
      ON
        a.zipcode=b.zipcode
      ORDER BY
        abs_pct_chg DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: zipcode {
    type: string
    sql: ${TABLE}.zipcode ;;
  }

  dimension: count_2015 {
    type: string
    sql: ${TABLE}.count_2015 ;;
  }

  dimension: count_1995 {
    type: string
    sql: ${TABLE}.count_1995 ;;
  }

  dimension: alive_growth {
    type: string
    sql: ${TABLE}.alive_growth ;;
  }

  dimension: dead_growth {
    type: string
    sql: ${TABLE}.dead_growth ;;
  }

  dimension: pop_chg {
    type: string
    sql: ${TABLE}.pop_chg ;;
  }

  dimension: pop_pct_chg {
    type: string
    sql: ${TABLE}.pop_pct_chg ;;
  }

  dimension: abs_pct_chg {
    type: string
    sql: ${TABLE}.abs_pct_chg ;;
  }

  set: detail {
    fields: [
      zipcode,
      count_2015,
      count_1995,
      alive_growth,
      dead_growth,
      pop_chg,
      pop_pct_chg,
      abs_pct_chg
    ]
  }
}
