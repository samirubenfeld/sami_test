view: tree_census_2015 {
  sql_table_name: nyc_trees.tree_census_2015 ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: block_id {
    type: number
    sql: ${TABLE}.block_id ;;
  }

  dimension: boro_ct {
    type: number
    sql: ${TABLE}.boro_ct ;;
  }

  dimension: borocode {
    type: number
    map_layer_name: my_boro_layer
    sql: ${TABLE}.borocode ;;
  }

  dimension: boroname {
    type: string
    sql: ${TABLE}.boroname ;;
  }

  dimension: brch_light {
    type: yesno
    sql: ${TABLE}.brch_light ;;
  }

  dimension: brch_other {
    type: yesno
    sql: ${TABLE}.brch_other ;;
  }

  dimension: brch_shoe {
    type: yesno
    sql: ${TABLE}.brch_shoe ;;
  }

  dimension: cb_num {
    type: number
    sql: ${TABLE}.cb_num ;;
  }

  dimension: cncldist {
    type: number
    sql: ${TABLE}.cncldist ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: curb_loc {
    type: string
    sql: ${TABLE}.curb_loc ;;
  }

  dimension: guards {
    type: string
    sql: ${TABLE}.guards ;;
  }

  dimension: health {
    type: string
    sql: ${TABLE}.health ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    sql_latitude:${latitude};;
    sql_longitude:${longitude};;
}

  dimension: rounded_location {
    type: location
    sql_latitude: ROUND(${latitude},2);;
    sql_longitude: ROUND(${longitude},2);;
  }



  dimension: nta {
    type: string
    sql: ${TABLE}.nta ;;
  }

  dimension: nta_name {
    type: string
    sql: ${TABLE}.nta_name ;;
  }

  dimension: problems {
    type: string
    sql: ${TABLE}.problems ;;
  }

  dimension: root_grate {
    type: yesno
    sql: ${TABLE}.root_grate ;;
  }

  dimension: root_other {
    type: yesno
    sql: ${TABLE}.root_other ;;
  }

  dimension: root_stone {
    type: yesno
    sql: ${TABLE}.root_stone ;;
  }

  dimension: sidewalk {
    type: string
    sql: ${TABLE}.sidewalk ;;
  }

  dimension: species_common {
    type: string
    sql: ${TABLE}.spc_common ;;
  }

  dimension: species_latin {
    type: string
    sql: UPPER(${TABLE}.spc_latin) ;;
  }

  dimension: st_assem {
    type: number
    sql: ${TABLE}.st_assem ;;
  }

  dimension: st_senate {
    type: number
    sql: ${TABLE}.st_senate ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: steward {
    type: string
    sql: ${TABLE}.steward ;;
  }

  dimension: stump_diam {
    type: number
    sql: ${TABLE}.stump_diam ;;
  }

  dimension: tree_dbh {
    type: number
    sql: ${TABLE}.tree_dbh ;;
  }

  dimension: tree_id {
    type: number
    sql: ${TABLE}.tree_id ;;
  }

  dimension: trnk_light {
    type: yesno
    sql: ${TABLE}.trnk_light ;;
  }

  dimension: trnk_other {
    type: yesno
    sql: ${TABLE}.trnk_other ;;
  }

  dimension: trunk_wire {
    type: yesno
    sql: ${TABLE}.trunk_wire ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: x_sp {
    type: number
    sql: ${TABLE}.x_sp ;;
  }

  dimension: y_sp {
    type: number
    sql: ${TABLE}.y_sp ;;
  }

  dimension: city {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.zip_city ;;
  }


  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  measure: count {
    type: count
    drill_fields: [boroname, nta_name]
  }
}
