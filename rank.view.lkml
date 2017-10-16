view: rank {
  derived_table: {
    sql: SELECT
        UPPER(spc_latin) as spc_latin,
        UPPER(spc_common) as spc_common,
        COUNT(*) AS count,
        NTILE(4) OVER (ORDER BY COUNT(*)) AS quartile
      FROM
        `bigquery-public-data.new_york.tree_census_2015`
      WHERE
        status="Alive" AND boroname = "Manhattan"
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

  dimension: rank_count {
    type: string
    sql: ${TABLE}.count ;;
  }

  dimension: quartile {
    type: string
    sql: ${TABLE}.quartile ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [spc_latin, spc_common, rank_count, quartile]
  }
}
