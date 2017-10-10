view: tree_species {
  sql_table_name: nyc_trees.tree_species ;;

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: environmental_tolerances {
    type: string
    sql: ${TABLE}.environmental_tolerances ;;
  }

  dimension: fall_color {
    type: string
    sql: ${TABLE}.fall_color ;;
  }

  dimension: form {
    type: string
    sql: ${TABLE}.form ;;
  }

  dimension: growth_rate {
    type: string
    sql: ${TABLE}.growth_rate ;;
  }

  dimension: location_tolerances {
    type: string
    sql: ${TABLE}.location_tolerances ;;
  }

  dimension: notes_suggested_cultivars {
    type: string
    sql: ${TABLE}.notes_suggested_cultivars ;;
  }

  dimension: species_common_name {
    type: string
    sql: ${TABLE}.species_common_name ;;
  }

  dimension: species_scientific_name {
    type: string
    sql: ${TABLE}.species_scientific_name ;;
  }

  dimension: tree_size {
    type: string
    sql: ${TABLE}.tree_size ;;
  }

  measure: count {
    type: count
    drill_fields: [species_common_name, species_scientific_name]
  }
}
