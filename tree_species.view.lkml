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

  measure: cream_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Cream"
    }
  }

  measure: maroon_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Maroon"
    }
  }

  measure: orange_brown_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Orange/Brown"
    }
  }

  measure: purple_maroon_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Purple/Maroon"
    }
  }

  measure: red_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Red"
    }
  }

  measure: red_bronze_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Red/Bronze"
    }
  }

  measure: yellow_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Yellow"
    }
  }

  measure: yellow_orange_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: fall_color
      value: "Yellow/Orange"
    }
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
    html:  {{ value | upcase}} ;;
  }

  dimension: species_scientific_name {
    primary_key: yes
    type: string
    sql:UPPER (${TABLE}.species_scientific_name) ;;
  }

  dimension: tree_size {
    type: string
    sql: ${TABLE}.tree_size ;;
  }



  measure: count {
    type: count
    drill_fields: [species_common_name, species_scientific_name]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      species_common_name,
      species_scientific_name
    ]
  }
}
