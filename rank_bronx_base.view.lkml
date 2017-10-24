view: rank_bronx_base {
  derived_table: {
    sql:    SELECT
        UPPER(spc_latin) as spc_latin,
        UPPER(spc_common) as spc_common,
        COUNT(*) AS count,
        NTILE(4) OVER (ORDER BY COUNT(*)) AS quartile
      FROM
        `bigquery-public-data.new_york.tree_census_2015`
      WHERE
        status="Alive" AND boroname = "Bronx"
      GROUP BY
        spc_latin,
        spc_common
      ORDER BY
        count DESC;;
  }

  dimension: spc_latin {
    primary_key:  yes
    type: string
    sql: ${TABLE}.spc_latin ;;
  }

  dimension: spc_common {
    type: string
    sql: ${TABLE}.spc_common ;;
  }

#   dimension: health {
#     type: string
#     sql: ${TABLE}.health ;;
#   }

#   dimension: cb_num {
#     description: "Community board in which tree point is located"
#     type: number
#     map_layer_name: custom_cbnum_map
#     sql: ${TABLE}.cb_num ;;
#   }

#   dimension: rank_count {
#     type: string
#     sql: ${TABLE}.count ;;
#   }

  dimension: quartile {
    type: number
    sql: ${TABLE}.quartile ;;
  }

  measure: total {
    type: sum
    sql: ${TABLE}.count ;;
  }

  measure: percent_of_total {
    type: percent_of_total
    sql: ${total};;
  }



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [spc_latin, spc_common, quartile]
  }
}
