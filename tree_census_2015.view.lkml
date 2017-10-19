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
    map_layer_name: custom_borough_map
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
    map_layer_name: custom_cbnum_map
    sql: ${TABLE}.cb_num ;;
  }

  dimension: cncldist {
    type: number
    map_layer_name: custom_map
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
    map_layer_name: custom_census
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
    sql: UPPER(${TABLE}.spc_common) ;;
    html: {{ value | upcase}} ;;
  }

  dimension: species_latin {
    primary_key:  yes
    type: string
    sql: UPPER(${TABLE}.spc_latin) ;;
  }

  filter: species_select_latin {
    suggest_dimension: species_latin
  }

  dimension: species_comparitor_latin {
    sql:
      CASE WHEN {% condition species_select_latin %} ${species_latin} {% endcondition %}
      THEN ${species_latin}
      ELSE 'Rest Of Population'
      END;;
  }

  filter: species_select_common {
    suggest_dimension: species_common
  }

  dimension: species_comparitor_common {
    sql:
      CASE WHEN {% condition species_select_common %} ${species_common} {% endcondition %}
      THEN ${species_common}
      ELSE 'Rest Of Population'
      END;;
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


  dimension: zipcode_cast {
    type: zipcode
    sql: LPAD(CAST(${TABLE}.zipcode as STRING), 5, '0') ;;
  }

  dimension: zipcode_alt {
    type: number
    sql: ${TABLE}.zipcode ;;
    value_format: "0"
  }

  measure: west_side_count {
    type: count
    filters: {
      field: zipcode_alt
      value: "10012, 10013, 10014"
    }
  }


  measure: lower_manhattan_count {
    type: count
    filters: {
      field: zipcode_alt
      value:  "10004, 10005, 10006, 10007, 10038, 10280"
    }
  }




  measure: count {
    type: count
    drill_fields: [boroname, health, nta_name]
  }

  measure: avg_tree_dbh {
    type: average
    sql: ${tree_dbh} ;;
    value_format: "0.00"
  }


  measure: poor_count {
    type: count
    filters: {
      field: health
      value: "Poor"
    }
  }

  measure: good_count {
    type: count
    filters: {
      field: health
      value: "Good"
    }
  }

  measure: fair_count {
    type: count
    filters: {
      field: health
      value: "Fair"
    }
  }


  measure: manhattan_count {
    type: count
    filters: {
      field: borocode
      value: "1"
    }
  }

  measure: bronx_count {
    type: count
    filters: {
      field: borocode
      value: "2"
    }
  }


  measure: brooklyn_count {
    type: count
    filters: {
      field: borocode
      value: "3"
    }
  }

  measure: queens_count {
    type: count
    filters: {
      field: borocode
      value: "4"
    }
  }

  measure: staten_island_count {
    type: count
    filters: {
      field: borocode
      value: "5"
    }
  }


  measure: percent_manhattan {
    type: number
    sql: 100.0 * ${manhattan_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_bronx {
    type: number
    sql: 100.0 * ${bronx_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_brooklyn {
    type: number
    sql: 100.0 * ${brooklyn_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_queens {
    type: number
    sql: 100.0 * ${queens_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_staten_island {
    type: number
    sql: 100.0 * ${staten_island_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_poor {
    type: number
    sql: 100.0 * ${poor_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }

  measure: percent_fair {
    type: number
    sql: 100.0 * ${fair_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }

  measure: percent_good {
    type: number
    sql: 100.0 * ${good_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }
}
