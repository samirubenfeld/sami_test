view: health_pct_2015 {
  derived_table: {
    sql: SELECT
        UPPER(boroname) as boroname
        UPPER(spc_latin) as spc_latin,
        UPPER(spc_common) as spc_common,
        COUNT(*) AS count,
        ROUND(COUNTIF(health="Good")/COUNT(*)*100) AS healthy_pct,
        ROUND(COUNTIF(health="Fair")/COUNT(*)*100) AS fair_pct,
        ROUND(COUNTIF(health="Poor")/COUNT(*)*100) AS poor_pct
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

  dimension: boroname {
    type: string
    sql:  ${TABLE}.boroname ;;
  }

  dimension: count {
    type: string
    sql: ${TABLE}.count ;;
  }

  dimension: healthy_pct {
    type: string
    sql: ${TABLE}.healthy_pct ;;
  }

  dimension: fair_pct {
    type: string
    sql: ${TABLE}.fair_pct ;;
  }

  dimension: poor_pct {
    type: string
    sql: ${TABLE}.poor_pct ;;
  }

  measure: percent_healthy {
    type: number
    sql: ${TABLE}.healthy_pct ;;
    value_format: "#.00\%"
  }


  measure: percent_fair {
    type: number
    sql: ${TABLE}.fair_pct ;;
    value_format: "#.00\%"
  }


  measure: percent_poor {
    type: number
    sql: ${TABLE}.poor_pct ;;
    value_format: "#.00\%"
  }


  measure: total {
    type: sum
    sql: ${count} ;;
  }



  set: detail {
    fields: [spc_latin, spc_common, count, healthy_pct]
  }
}
