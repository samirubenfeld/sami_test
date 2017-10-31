view: tree_images {
  sql_table_name: nyc_trees.tree_images ;;


  dimension: image_link {
    type: string
    sql: ${TABLE}.image_link ;;
    link: {
      label: "Image"
      url: "{{ value }}"
    }
  }

  dimension: image {
    sql: ${image_link};;
    html: <img src="{{ value }}" width="100" height="100"/>;;
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
