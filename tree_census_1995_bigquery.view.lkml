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

  dimension: censusblock_2010 {
    type: string
    map_layer_name: block_group_alt
    sql: ${TABLE}.censusblock_2010 ;;
  }

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

  dimension: nta_2010 {
    type: string
    map_layer_name: custom_census
    sql: ${TABLE}.nta_2010 ;;
  }

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
}
