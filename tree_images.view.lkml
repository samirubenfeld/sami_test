view: tree_images {
  sql_table_name: nyc_trees.tree_images ;;

  dimension: image {
    type: string
    sql: ${TABLE}.image_link ;;
  }

  dimension: species_common {
    type: string
    sql: ${TABLE}.species_common ;;
  }

  dimension: species_latin {
    type: string
    sql: ${TABLE}.species_latin ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
