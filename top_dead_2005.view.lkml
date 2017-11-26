view: top_dead_2005 {
  derived_table: {
    sql: SELECT
        UPPER(spc_latin) as species_latin,
        COUNT(*) AS count
      FROM
        `bigquery-public-data.new_york.tree_census_2005`
      WHERE status = "Dead" AND UPPER(spc_latin) NOT IN ('UNKNOWN DEAD','UNKNOWN')
      GROUP BY
        species_latin
      ORDER BY
        count DESC
      LIMIT
        10
       ;;
  }

  dimension: species_latin {
    type: string
    sql: ${TABLE}.species_latin ;;
  }

  dimension: count {
    type: string
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [species_latin, count]
  }
}
