view: tree_census_2005_bigquery {
  sql_table_name: nyc_trees.tree_census_2005_bigquery ;;

  dimension: boro_ct {
    type: number
    sql: ${TABLE}.boro_ct ;;
  }

  dimension: borocode {
    description: "Borough tree is in, using a one-digit borough code: 1 – Manhattan, 2 – Bronx, 3 – Brooklyn, 4 – Queens, 5 – Staten Island"
    type: number
    sql: ${TABLE}.borocode ;;
  }

  dimension: boroname {
    type: string
    sql: ${TABLE}.boroname ;;
  }

  dimension: cb_num {
    type: number
    sql: ${TABLE}.cb_num ;;
  }

  dimension: cen_year {
    type: number
    sql: ${TABLE}.cen_year ;;
  }

  dimension: cncldist {
    type: number
    sql: ${TABLE}.cncldist ;;
  }

  dimension: horz_blck {
    type: string
    sql: ${TABLE}.horz_blck ;;
  }

  dimension: horz_grate {
    type: string
    sql: ${TABLE}.horz_grate ;;
  }

  dimension: horz_other {
    type: string
    sql: ${TABLE}.horz_other ;;
  }

  dimension: horz_plant {
    type: string
    sql: ${TABLE}.horz_plant ;;
  }

  dimension: inf_canopy {
    type: string
    sql: ${TABLE}.inf_canopy ;;
  }

  dimension: inf_guard {
    type: string
    sql: ${TABLE}.inf_guard ;;
  }

  dimension: inf_lights {
    type: string
    sql: ${TABLE}.inf_lights ;;
  }

  dimension: inf_other {
    type: string
    sql: ${TABLE}.inf_other ;;
  }

  dimension: inf_outlet {
    type: string
    sql: ${TABLE}.inf_outlet ;;
  }

  dimension: inf_paving {
    type: string
    sql: ${TABLE}.inf_paving ;;
  }

  dimension: inf_shoes {
    type: string
    sql: ${TABLE}.inf_shoes ;;
  }

  dimension: inf_wires {
    type: string
    sql: ${TABLE}.inf_wires ;;
  }

  dimension: location_1 {
    type: string
    sql: ${TABLE}.location_1 ;;
  }


  dimension: nta {
    type: string
    map_layer_name: custom_nta
    sql: ${TABLE}.nta ;;
  }

  dimension: nta_name {
    type: string
    sql: ${TABLE}.nta_name ;;
  }

  dimension: objectid {
    type: number
    value_format_name: id
    sql: ${TABLE}.objectid ;;
  }

  dimension: objectid_1 {
    type: number
    sql: ${TABLE}.objectid_1 ;;
  }

  dimension: pit_type {
    type: string
    sql: ${TABLE}.pit_type ;;
  }

  dimension: sidw_crack {
    type: string
    sql: ${TABLE}.sidw_crack ;;
  }

  dimension: sidw_raise {
    type: string
    sql: ${TABLE}.sidw_raise ;;
  }

  dimension: soil_lvl {
    type: string
    sql: ${TABLE}.soil_lvl ;;
  }


  dimension: spc_common {
    type: string
    sql: UPPER(${TABLE}.spc_common) ;;
    html: {{ value | upcase}} ;;
  }

  dimension: spc_latin {
    primary_key:  yes
    type: string
    sql: UPPER(${TABLE}.spc_latin) ;;
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


  dimension: st_assem {
    type: number
    sql: ${TABLE}.st_assem ;;
  }

  dimension: st_senate {
    type: number
    sql: ${TABLE}.st_senate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tree_dbh {
    type: number
    sql: ${TABLE}.tree_dbh ;;
  }

  dimension: tree_loc {
    type: string
    sql: ${TABLE}.tree_loc ;;
  }

  dimension: trunk_dmg {
    type: string
    sql: ${TABLE}.trunk_dmg ;;
  }

  dimension: vert_other {
    type: string
    sql: ${TABLE}.vert_other ;;
  }

  dimension: vert_pgrd {
    type: string
    sql: ${TABLE}.vert_pgrd ;;
  }

  dimension: vert_tgrd {
    type: string
    sql: ${TABLE}.vert_tgrd ;;
  }

  dimension: vert_wall {
    type: string
    sql: ${TABLE}.vert_wall ;;
  }

  dimension: wire_2nd {
    type: string
    sql: ${TABLE}.wire_2nd ;;
  }

  dimension: wire_htap {
    type: string
    sql: ${TABLE}.wire_htap ;;
  }

  dimension: wire_other {
    type: string
    sql: ${TABLE}.wire_other ;;
  }

  dimension: wire_prime {
    type: string
    sql: ${TABLE}.wire_prime ;;
  }

  dimension: x_sp {
    type: number
    sql: ${TABLE}.x_sp ;;
  }

  dimension: y_sp {
    type: number
    sql: ${TABLE}.y_sp ;;
  }

  dimension: zip_city {
    type: string
    sql: ${TABLE}.zip_city ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }
  #MEASURES

  measure: excellent_status_count {
    group_label: "Status Count"
    label: "Excellent Tree Health"
    type: count
    filters: {
      field: status
      value: "Excellent"
    }
  }

  measure: percent_excellent {
    type: number
    sql: 100.0 * ${excellent_status_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: good_status_count {
    group_label: "Status Count"
    label: "Good Tree Health"
    type: count
    filters: {
      field: status
      value: "Good"
    }
  }

  measure: percent_good {
    type: number
    sql: 100.0 * ${good_status_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: poor_status_count {
    group_label: "Status Count"
    label: "Poor Tree Health"
    type: count
    filters: {
      field: status
      value: "Poor"
    }
  }

  measure: percent_poor {
    type: number
    sql: 100.0 * ${poor_status_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: dead_status_count {
    group_label: "Status Count"
    label: "Dead"
    type: count
    filters: {
      field: status
      value: "Dead"
    }
  }

  measure: percent_dead {
    type: number
    sql: 100.0 * ${dead_status_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }





  measure: vert_other_count {
    group_label: "Vertical Treatment Types"
    label: "Other Vertical Treatment Present"
    type: count
    filters: {
      field: vert_other
      value: "Yes"
    }
  }


  measure: vert_pgrd_count {
    group_label: "Vertical Treatment Types"
    label: "Perimeter guard present"
    type: count
    filters: {
      field: vert_pgrd
      value: "Yes"
    }
  }

  measure: vert_tgrd_count {
    group_label: "Vertical Treatment Types"
    label: "Tall guard present"
    type: count
    filters: {
      field: vert_tgrd
      value: "Yes"
    }
  }

  measure: vert_wall_count {
    group_label: "Vertical Treatment Types"
    label: "Walled tree well present"
    type: count
    filters: {
      field: vert_wall
      value: "Yes"
    }
  }



  measure: inf_canopy_count {
    group_label: "Urban Conflict Counts"
    label: "Canopy debris present"
    type: count
    filters: {
      field: inf_canopy
      value: "Yes"
    }
  }

  measure: percent_canopy_debris {
    type: number
    sql: 100.0 * ${inf_canopy_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: inf_guard_count {
    group_label: "Urban Conflict Counts"
    label: "Choking guard or grate present"
    type: count
    filters: {
      field: inf_guard
      value: "Yes"
    }
  }

  measure: percent_guard {
    type: number
    sql: 100.0 * ${inf_guard_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: inf_lights_count {
    label: "Tree lights present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_lights
      value: "Yes"
    }
  }

  measure: percent_lights {
    type: number
    sql: 100.0 * ${inf_lights_count} / NULLIF(${count}, 0) ;;
#     value_format: "#.00\%"
    value_format: "0.00\%"
  }



  measure: inf_other_count {
    label: "Other infrastructure conflicts present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_other
      value: "Yes"
    }
  }

  measure: percent_other {
    type: number
    sql: 100.0 * ${inf_other_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: inf_outlet_count {
    label: "Electrical outlet present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_outlet
      value: "Yes"
    }
  }

  measure: percent_outlet {
    type: number
    sql: 100.0 * ${inf_outlet_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: inf_paving_count {
    label: "Close paving present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_paving
      value: "Yes"
    }
  }


  measure: percent_paving {
    type: number
    sql: 100.0 * ${inf_paving_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }



  measure: inf_shoes_count {
    label: "Sneakers present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_shoes
      value: "Yes"
    }
  }

  measure: percent_shoes {
    type: number
    sql: 100.0 * ${inf_shoes_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: inf_wires_count {
    label: "Choking wires present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_wires
      value: "Yes"
    }
  }

  measure: percent_wires_inf {
    type: number
    sql: 100.0 * ${inf_wires_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: wire_2nd_count {
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: wire_2nd
      value: "Yes"
    }
  }

  measure: percent_wires_2nd {
    type: number
    sql: 100.0 * ${wire_2nd_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }

  measure: wire_htap_count {
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: wire_htap
      value: "Yes"
    }
  }

  measure: percent_wires_htp {
    type: number
    sql: 100.0 * ${wire_htap_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }

  measure: wire_other_count {
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: wire_other
      value: "Yes"
    }
  }

  measure: percent_wires_other {
    type: number
    sql: 100.0 * ${wire_other_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }

  measure: wire_prime_count {
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: wire_prime
      value: "Yes"
    }
  }

  measure: percent_wires_prime {
    type: number
    sql: 100.0 * ${wire_prime_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: sidw_crack_count {
    label: "Cracked sidewalk present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: sidw_crack
      value: "Yes"
    }
  }


  measure: percent_sidw_crack {
    type: number
    sql: 100.0 * ${sidw_crack_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }


  measure: sidw_raise_count {
    label: "Raised sidewalk present"
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: sidw_raise
      value: "Yes"
    }
  }

  measure: percent_sidw_raise {
    type: number
    sql: 100.0 * ${sidw_raise_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"
  }

  measure: percent_lights_count {type: number sql: (${percent_lights});;
    html: <div style="float: left
          ; width:{{ value | times:100}}%
          ; background-color: rgba(0,180,0,{{ value | times:100 }})
          ; text-align:left
          ; color: #FFFFFF
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ value | times:100 }}%</p>
          </div>
          <div style="float: left
          ; width:{{ 1| minus:value | times:100}}%
          ; background-color: rgba(0,180,0,0.1)
          ; text-align:right
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 0px; color:rgba(0,0,0,0.0" )>{{value}}</p>
          </div>
      ;;
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



  measure: count {
    type: count
    drill_fields: [tree_images.image, spc_common, spc_latin, count_percent, count]
  }


}
