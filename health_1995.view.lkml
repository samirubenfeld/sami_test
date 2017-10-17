view: health_1995 {
  derived_table: {
    sql: WITH status_pct_1995 AS (SELECT
        UPPER(spc_latin) as spc_latin,
        UPPER(spc_common) as spc_common,
        COUNT(*) AS count,
        ROUND(COUNTIF(status="Good")/COUNT(*)*100) AS good_pct,
        ROUND(COUNTIF(status="Excellent")/COUNT(*)*100) AS excellent_pct,
        ROUND(COUNTIF(status="Poor")/COUNT(*)*100) AS poor_pct
      FROM
        `triple-shadow-181317.nyc_trees.tree_census_1995`
      WHERE
        status != "Dead"
      GROUP BY
        spc_latin,
        spc_common
      ORDER BY
        count DESC
       )
SELECT
  status_pct_1995.spc_common  AS status_pct_1995_spc_common,
  status_pct_1995.spc_latin  AS status_pct_1995_spc_latin,
  status_pct_1995.good_pct  AS status_pct_1995_good_pct,
  status_pct_1995.excellent_pct  AS status_pct_1995_excellent_pct,
  COALESCE(SUM(status_pct_1995.count ), 0) AS status_pct_1995_total
FROM status_pct_1995

GROUP BY 1,2,3,4
ORDER BY 5 DESC
LIMIT 10
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: status_pct_1995_spc_common {
    type: string
    sql: ${TABLE}.status_pct_1995_spc_common ;;
  }

  dimension: status_pct_1995_spc_latin {
    type: string
    sql: ${TABLE}.status_pct_1995_spc_latin ;;
  }

  dimension: status_pct_1995_good_pct {
    type: string
    sql: ${TABLE}.status_pct_1995_good_pct ;;
  }

  dimension: status_pct_1995_excellent_pct {
    type: string
    sql: ${TABLE}.status_pct_1995_excellent_pct ;;
  }

  dimension: status_pct_1995_total {
    type: string
    sql: ${TABLE}.status_pct_1995_total ;;
  }

  set: detail {
    fields: [status_pct_1995_spc_common, status_pct_1995_spc_latin, status_pct_1995_good_pct, status_pct_1995_excellent_pct, status_pct_1995_total]
  }
}
