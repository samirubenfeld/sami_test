view: health_pct_2015 {
  derived_table: {
    sql: SELECT
        UPPER(spc_latin) as spc_latin,
        UPPER(spc_common) as spc_common,
        COUNT(*) AS count,
        ROUND(COUNTIF(health="Good")/COUNT(*)*100) AS healthy_pct
      FROM
        `triple-shadow-181317.nyc_trees.tree_census_2015`
      WHERE
        status="Alive"
      GROUP BY
        spc_latin,
        spc_common
      ORDER BY
        count DESC
       ;;
  }

  dimension: spc_latin {
    type: string
    sql: ${TABLE}.spc_latin ;;
  }

  dimension: spc_common {
    type: string
    sql: ${TABLE}.spc_common ;;
  }

  dimension: count {
    type: string
    sql: ${TABLE}.count ;;
  }

  dimension: healthy_pct {
    type: string
    sql: ${TABLE}.healthy_pct ;;
  }

  measure: total {
    type: sum
    sql: ${count} ;;
  }



  set: detail {
    fields: [spc_latin, spc_common, count, healthy_pct]
  }
}
