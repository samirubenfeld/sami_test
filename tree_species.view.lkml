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




  dimension: fall_color_fix {
    sql: CASE WHEN ${fall_color} = 'Cream' THEN 'Cream'
              WHEN ${fall_color} = 'Maroon' THEN 'Maroon'
              WHEN ${fall_color} = 'Orange/Brown' THEN 'Orange/Brown'
              WHEN ${fall_color} = 'Purple/Maroon' THEN 'Purple/Maroon'
              WHEN ${fall_color} = 'Red' THEN 'Red'
              WHEN ${fall_color} = 'Red/Bronze' THEN 'Red/Bronze'
              WHEN ${fall_color} = 'Yellow' THEN 'Yellow'
              WHEN ${fall_color} = 'Yellow/Orange' THEN 'Yellow/Orange'
              WHEN ${fall_color} = 'Red/ Yellow' OR ${fall_color} = 'Red/ yellow' THEN 'Red/Yellow'
              WHEN ${fall_color} = 'Yellow/Bronze' OR ${fall_color} = 'Yellow/ Bronze' THEN 'Yellow/Bronze'
              WHEN ${fall_color} = 'Red/Orange' THEN 'Red/Orange'
              ELSE NULL
         END ;;
  }

  dimension: fall_color_alt {
    type: string
    sql: ${fall_color_fix};;
    html:
      {% if value == 'Cream' %}
        <div style="border-radius: 25px; color: black; background-color:#DEC6AC; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Maroon' %}
        <div style="border-radius: 25px; color: white; background-color:#800000; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Orange/Brown' %}
        <div style="border-radius: 25px; color: black; background-color:#ee7600; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Purple/Maroon' %}
        <div style="border-radius: 25px; color: white; background-color:#800020; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Red' %}
        <div style="border-radius: 25px; color: black; background-color:#fa0000; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Red/Bronze' %}
        <div style="border-radius: 25px; color: black; background-color:#cd5832; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Yellow' %}
        <div style="border-radius: 25px; color: black; background-color:#FFC300; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Yellow/Orange' %}
        <div style="border-radius: 25px; color: black; background-color:#ffae42; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Red/Yellow' %}
        <div style="border-radius: 25px; color: black; background-color:#F9A825; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Yellow/Bronze' %}
        <div style="border-radius: 25px; color: black; background-color:#d99058; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Red/Orange' %}
        <div style="border-radius: 25px; color: black; background-color:#FF4500; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% endif %}
    ;;
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


#   measure: pct_yellow {
#     label: "Yellow % of Tree Colors"
#     group_label: "Colors"
#     type: number
#     value_format_name: percent_2
#     sql: ${sum_yellow}/NULLIF(${count}, 0) ;;
#     }

#   measure: total_population {
#     description: "Total Population"
#     type: sum
#     sql: ${TABLE}.total ;;
#   }



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

  dimension: tree_size_alt {
    type: string
    sql: ${TABLE}.tree_size ;;
    html:
      {% if value == 'Large (Mature Height > 50 ft)' %}
        <div style="background-color:#D5EFEE">{{ value }}</div>
      {% elsif value == 'Medium (Mature Height 35-50 ft)' or value == 'Intermediate (Mature Height 25-35 ft)' %}
        <div style="background-color:#FCECCC">{{ value }}</div>
      {% elsif value == 'Small (Mature Height < 25 ft)' %}
        <div style="background-color:#EFD5D6">{{ value }}</div>
      {% endif %}
    ;;
  }





  measure: count {
    type: count
    drill_fields: [tree_size_alt, growth_rate, fall_color_alt, form, location_tolerances, species_common_name, species_scientific_name]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      species_common_name,
      species_scientific_name
    ]
  }
}
