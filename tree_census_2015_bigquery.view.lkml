view: tree_census_2015_bigquery {
  sql_table_name: nyc_trees.tree_census_2015_bigquery ;;

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
    sql: ${TABLE}.borocode ;;
  }

  dimension: boroname {
    type: string
    sql: ${TABLE}.boroname ;;
  }

  dimension: brch_light {
    type: string
    sql: ${TABLE}.brch_light ;;
  }

  dimension: brch_other {
    type: string
    sql: ${TABLE}.brch_other ;;
  }

  dimension: brch_shoe {
    type: string
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
    type: string
    sql: ${TABLE}.root_grate ;;
  }

  dimension: root_other {
    type: string
    sql: ${TABLE}.root_other ;;
  }

  dimension: root_stone {
    type: string
    sql: ${TABLE}.root_stone ;;
  }

  dimension: sidewalk {
    type: string
    sql: ${TABLE}.sidewalk ;;
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
    type: string
    sql: ${TABLE}.trnk_light ;;
  }

  dimension: trnk_other {
    type: string
    sql: ${TABLE}.trnk_other ;;
  }

  dimension: trunk_wire {
    type: string
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

  dimension: zip_city {
    type: string
    sql: ${TABLE}.zip_city ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  measure: avg_tree_dbh {
    type: average
    sql: ${tree_dbh} ;;
  }

  measure: count {
    type: count
    drill_fields: [boroname, nta_name]
  }
}
