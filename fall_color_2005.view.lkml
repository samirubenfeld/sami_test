view: fall_color_2005 {
  derived_table: {
    sql: SELECT
        c.fall_color,
        SUM(d.count_growth) AS change
      FROM (
        SELECT
          fall_color,
          UPPER(species_scientific_name) AS latin
        FROM
          `bigquery-public-data.new_york.tree_species`)c
      JOIN (
        SELECT
          IFNULL(a.upper_latin,
            b.upper_latin) AS latin,
          (IFNULL(count_2015,
              0)-IFNULL(count_2005,
              0)) AS count_growth
        FROM (
          SELECT
            UPPER(spc_latin) AS upper_latin,
            spc_common,
            COUNT(*) AS count_2015
          FROM
            `triple-shadow-181317.nyc_trees.tree_census_2015`
          WHERE
            status="Alive"
          GROUP BY
            spc_latin,
            spc_common)a
        FULL OUTER JOIN (
          SELECT
            UPPER(spc_latin) AS upper_latin,
            COUNT(*) AS count_2005
          FROM
            `triple-shadow-181317.nyc_trees.tree_census_2005`
          WHERE
            status !="Dead"
          GROUP BY
            spc_latin)b
        ON
          a.upper_latin=b.upper_latin
        ORDER BY
          count_growth DESC)d
      ON
        d.latin=c.latin
      GROUP BY
        fall_color
      ORDER BY
        change DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: change_count {
    type: sum
    sql: ${change} ;;
  }

  dimension: fall_color {
    type: string
    sql: ${TABLE}.fall_color ;;
  }

  dimension: change {
    type: string
    sql: ${TABLE}.change ;;
  }

  set: detail {
    fields: [fall_color, change]
  }
}
