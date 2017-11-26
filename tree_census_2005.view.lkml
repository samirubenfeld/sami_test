view: tree_census_2005 {
  sql_table_name: nyc_trees.tree_census_2005 ;;

  dimension: boro_ct {
    type: number
    sql: ${TABLE}.boro_ct ;;
  }

  dimension: borocode {
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
    type: yesno
    sql: ${TABLE}.horz_blck ;;
  }

  dimension: horz_grate {
    type: yesno
    sql: ${TABLE}.horz_grate ;;
  }

  dimension: horz_other {
    type: yesno
    sql: ${TABLE}.horz_other ;;
  }

  dimension: horz_plant {
    type: yesno
    sql: ${TABLE}.horz_plant ;;
  }

  dimension: inf_canopy {
    type: yesno
    sql: ${TABLE}.inf_canopy ;;
  }

  dimension: inf_guard {
    type: yesno
    sql: ${TABLE}.inf_guard ;;
  }

  dimension: inf_lights {
    type: yesno
    sql: ${TABLE}.inf_lights ;;
  }

  dimension: inf_other {
    type: yesno
    sql: ${TABLE}.inf_other ;;
  }

  dimension: inf_outlet {
    type: yesno
    sql: ${TABLE}.inf_outlet ;;
  }

  dimension: inf_paving {
    type: yesno
    sql: ${TABLE}.inf_paving ;;
  }

  dimension: inf_shoes {
    type: yesno
    sql: ${TABLE}.inf_shoes ;;
  }

  dimension: inf_wires {
    type: yesno
    sql: ${TABLE}.inf_wires ;;
  }

  dimension: location_1 {
    type: string
    sql: ${TABLE}.location_1 ;;
  }

  dimension: nta {
    type: string
    sql: ${TABLE}.nta ;;
  }

  dimension: nta_name {
    type: string
    sql: ${TABLE}.nta_name ;;
  }

  dimension: objectid {
    type: string
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
    type: yesno
    sql: ${TABLE}.sidw_crack ;;
  }

  dimension: sidw_raise {
    type: yesno
    sql: ${TABLE}.sidw_raise ;;
  }

  dimension: soil_lvl {
    type: string
    sql: ${TABLE}.soil_lvl ;;
  }


  dimension: species_common {
    type: string
    sql: ${TABLE}.spc_common ;;
  }

  dimension: species_latin {
    primary_key:  yes
    type: string
    sql: ${TABLE}.spc_latin ;;
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
    type: yesno
    sql: ${TABLE}.vert_other ;;
  }

  dimension: vert_pgrd {
    type: yesno
    sql: ${TABLE}.vert_pgrd ;;
  }

  dimension: vert_tgrd {
    type: yesno
    sql: ${TABLE}.vert_tgrd ;;
  }

  dimension: vert_wall {
    type: yesno
    sql: ${TABLE}.vert_wall ;;
  }

  dimension: wire_2nd {
    type: yesno
    sql: ${TABLE}.wire_2nd ;;
  }

  dimension: wire_htap {
    type: yesno
    sql: ${TABLE}.wire_htap ;;
  }

  dimension: wire_other {
    type: yesno
    sql: ${TABLE}.wire_other ;;
  }

  dimension: wire_prime {
    type: yesno
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


  dimension: city {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.zip_city ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  #MEASURES


  measure: inf_canopy_count {
    group_label: "Urban Conflict Counts"
    type: count
    filters: {
      field: inf_canopy
      value: "Yes"
    }
  }

  measure: count {
    type: count
    drill_fields: [boroname, nta_name]
  }
}
