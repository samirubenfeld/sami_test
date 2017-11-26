view: tree_census_1995_bigquery {
  sql_table_name: nyc_trees.tree_census_1995_bigquery ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: borough {
    type: string
    sql: ${TABLE}.borough ;;
  }

  dimension: cb_new {
    type: number
    sql: ${TABLE}.cb_new ;;
  }

  dimension: cb_original {
    type: number
    sql: ${TABLE}.cb_original ;;
  }

#   dimension: censusblock_2010 {
#     type: string
#     map_layer_name: block_group_alt
#     sql: ${TABLE}.censusblock_2010 ;;
#   }

  dimension: censustract_2010 {
    type: string
#     map_layer_name: tract
    sql: ${TABLE}.censustract_2010 ;;
  }

  dimension: diameter {
    type: number
    sql: ${TABLE}.diameter ;;
  }

  dimension: house_number {
    type: string
    sql: ${TABLE}.house_number ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

#   dimension: nta_2010 {
#     type: string
#     map_layer_name: custom_census
#     sql: ${TABLE}.nta_2010 ;;
#   }

  dimension: recordid {
    type: number
    value_format_name: id
    sql: ${TABLE}.recordid ;;
  }

  dimension: segmentid {
    type: number
    value_format_name: id
    sql: ${TABLE}.segmentid ;;
  }

  dimension: sidewalk_condition {
    type: string
    sql: ${TABLE}.sidewalk_condition ;;
  }

  dimension: site {
    type: string
    sql: ${TABLE}.site ;;
  }

  dimension: spc_common {
    type: string
    sql: ${TABLE}.spc_common ;;
  }

  dimension: spc_latin {
    type: string
    sql: ${TABLE}.spc_latin ;;
  }

  filter: species_select_latin {
    suggest_dimension: spc_latin
  }

  dimension: species_comparitor_latin {
    sql:
      CASE WHEN {% condition species_select_latin %} ${spc_latin} {% endcondition %}
      THEN ${spc_latin}
      ELSE 'Rest Of Population'
      END;;
  }

  filter: species_select_common {
    suggest_dimension: spc_common
  }

  dimension: species_comparitor_common {
    sql:
      CASE WHEN {% condition species_select_common %} ${spc_common} {% endcondition %}
      THEN ${spc_common}
      ELSE 'Rest Of Population'
      END;;
  }


  dimension: species {
    type: string
    sql: ${TABLE}.species ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: support_structure {
    type: string
    sql: ${TABLE}.support_structure ;;
  }

  dimension: wires {
    type: string
    sql: ${TABLE}.wires ;;
  }

  dimension: x {
    type: number
    sql: ${TABLE}.x ;;
  }

  dimension: y {
    type: number
    sql: ${TABLE}.y ;;
  }

  dimension: zip_new {
    type: number
    sql: ${TABLE}.zip_new ;;
  }

  dimension: zip_original {
    type: number
    sql: ${TABLE}.zip_original ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


  measure: count_percent {
    type: percent_of_total
    direction: "column"
    value_format: "0.00\%"
    sql:
    ${count} ;;
    description: "Has HTML"
    html:
      <div style="float: left
        ; width:{{value | times: 7}}%
        ; max-width: 75%
        ; border-radius: 25px
        ; font-weight: bold
        ; font-color: white
        ; background-color: rgba(242,56,90,{{value | times: 5 | divided_by: 100}})
        ; text-align:left"> <p style="margin-bottom: 0; margin-left: 4px;">{{ rendered_value }}</p>
      </div>
     ;;
  }

}
