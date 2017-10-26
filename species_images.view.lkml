view: species_images {
  sql_table_name: nyc_trees.species_images ;;

  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
    link: {
      label: "Image"
      url: "{{ value }}"
    }
  }

    dimension: species_image {
    sql: ${image};;
    html: <img src="{{ value }}" width="100" height="100"/>;;
    }

#   dimension: int64_field_0 {
#     type: number
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: species_latin {
    type: string
    sql: ${TABLE}.species_latin ;;
  }

  measure: count {
    type: count
    drill_fields: [species_latin, image]
  }
}
