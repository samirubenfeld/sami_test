#How has the change in tree species distribution since 1995 affected the form of New York’s Trees?

view: fall_form {
  derived_table: {
    sql: SELECT c.form,
        SUM(d.count_growth) AS change
      FROM (
        SELECT
          form,
          UPPER(species_scientific_name) AS latin
        FROM
          `bigquery-public-data.new_york.tree_species`)c
      JOIN (
        SELECT
          IFNULL(a.upper_latin,
            b.upper_latin) AS latin,
          (IFNULL(count_2015,
              0)-IFNULL(count_1995,
              0)) AS count_growth
        FROM (
          SELECT
            UPPER(spc_latin) AS upper_latin,
            spc_common,
            COUNT(*) AS count_2015
          FROM
            `triple-shadow-181317.nyc_trees.tree_census_2015_bigquery`
          WHERE
            status="Alive"
          GROUP BY
            spc_latin,
            spc_common)a
        FULL OUTER JOIN (
          SELECT
            UPPER(spc_latin) AS upper_latin,
            COUNT(*) AS count_1995
          FROM
            `triple-shadow-181317.nyc_trees.tree_census_1995_bigquery`
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
        form
      ORDER BY
        change DESC

 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: form {
    type: string
    sql: ${TABLE}.form ;;
  }

  dimension: change {
    type: string
    sql: ${TABLE}.change ;;
  }


  measure: change_count {
    type: sum
    sql: ${change} ;;
  }


  set: detail {
    fields: [form, change]
  }
}
