view: tree_census_2015 {
  sql_table_name: nyc_trees.tree_census_2015 ;;

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: block_id {
    group_label: "Location Info"
    type: number
    sql: ${TABLE}.block_id ;;
  }

  dimension: boro_ct {
    group_label: "Location Info"
    type: number
    sql: ${TABLE}.boro_ct ;;
  }

  dimension: borocode {
    group_label: "Location Info"
    type: number
    map_layer_name: custom_borough_map
    sql: ${TABLE}.borocode ;;
  }

  dimension: boroname {
    group_label: "Location Info"
    type: string
    map_layer_name: custom_borough_map
    sql: ${TABLE}.boroname ;;
    drill_fields: [nta_name, zipcode, st_assem]
  }



  dimension: boroname_alt {
    group_label: "Location Info"
    type: string
    sql: ${TABLE}.boroname ;;
    html:
      {% if value == 'Manhattan' %}
        <div style="background-color:#D5EFEE; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Brooklyn' %}
        <div style="background-color:#FCECCC; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Bronx' %}
        <div style="background-color:#EFD5D6; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Queens' %}
        <div style="background-color:#6B9080; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% elsif value == 'Staten Island' %}
        <div style="background-color:#A4C3B2; font-weight: bold; font-size:100%; text-align:center">{{ value }}</div>
      {% endif %}
    ;;
  }


  dimension: brch_light {
    group_label: "Branch Info"
    type: yesno
    sql: ${TABLE}.brch_light ;;
  }

  dimension: brch_other {
    group_label: "Branch Info"
    type: yesno
    sql: ${TABLE}.brch_other ;;
  }

  dimension: brch_shoe {
    group_label: "Branch Info"
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
    map_layer_name: custom_council
    sql: ${TABLE}.cncldist ;;
  }

  dimension_group: created {
    description: "Date trees were mapped"
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
    description: "Presence and type of tree guard"
    type: string
    sql: ${TABLE}.guards ;;
  }

  dimension: health {
    type: string
    sql: ${TABLE}.health ;;
  }

  dimension: latitude {
    type: number
    group_label: "Location Info"
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    group_label: "Location Info"
    sql: ${TABLE}.longitude ;;
  }

  dimension: location {
    type: location
    group_label: "Location Info"
    sql_latitude:${latitude};;
    sql_longitude:${longitude};;
}

  dimension: rounded_location {
    type: location
    group_label: "Location Info"
    sql_latitude: ROUND(${latitude},2);;
    sql_longitude: ROUND(${longitude},2);;
  }



  dimension: nta {
    type: string
    group_label: "Location Info"
    map_layer_name: custom_nta
    sql: ${TABLE}.nta ;;
  }



  dimension: nta_name {
    type: string
    group_label: "Location Info"
    sql: ${TABLE}.nta_name ;;
  }

  dimension: problems {
    type: string
    sql: ${TABLE}.problems ;;
  }

  dimension: root_grate {
    description: "Root problems caused by metal grates"
    group_label: "Root Info"
    type: yesno
    sql: ${TABLE}.root_grate ;;
  }

  dimension: root_other {
    description: "Presence of other root problems"
    group_label: "Root Info"
    type: yesno
    sql: ${TABLE}.root_other ;;
  }

  dimension: root_stone {
    description: "Root problems caused by paving stones in the tree bed"
    group_label: "Root Info"
    type: yesno
    sql: ${TABLE}.root_stone ;;
  }

  dimension: sidewalk {
    description: "Sidewalk damage immediately adjacent to tree"
    type: string
    sql: ${TABLE}.sidewalk ;;
  }

  dimension: species_common {
    type: string
    group_label: "Species Info"
    sql: UPPER(${TABLE}.spc_common) ;;
    html: {{ value | upcase}} ;;
    link: {
      label: "Tree Drilldown"
      url: "/dashboards/25?Tree%20Species%20Common={{ value }}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  dimension: species_latin {
    primary_key:  yes
    group_label: "Species Info"
    type: string
    sql: UPPER(${TABLE}.spc_latin) ;;
  }

  measure: name_count {
    type: count_distinct
    sql: ${species_common} ;;
    drill_fields: [species_common]
  }

  filter: species_count_picker {
    description: "Use with the Species Count measure"
    type: string
    group_label: "Species Info"
    suggest_explore: tree_census_2015
    suggest_dimension: tree_census_2015.species_common
  }

  measure: species_count {
    description: "Use with the Species Count Picker filter-only field"
    type: sum
    group_label: "Species Info"
    sql:
    CASE
      WHEN {% condition species_count_picker %} ${tree_census_2015.species_common} {% endcondition %}
      THEN 1
      ELSE 0
    END
  ;;
  }

  filter: species_select_latin {
    suggest_dimension: species_latin
  }

  dimension: species_comparitor_latin {
    group_label: "Species Info"
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
    group_label: "Species Info"
    sql:
      CASE WHEN {% condition species_select_common %} ${species_common} {% endcondition %}
      THEN ${species_common}
      ELSE 'Rest Of Population'
      END;;
  }

  dimension: st_assem {
    type: number
    group_label: "Location Info"
    map_layer_name: custom_st_assembly
    sql: ${TABLE}.st_assem ;;
  }

  dimension: st_senate {
    type: number
    group_label: "Location Info"
    sql: ${TABLE}.st_senate ;;
  }

  dimension: state {
    type: string
    group_label: "Location Info"
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
    link: {
      url: "https://maps.google.com?q={{value}}"
      label: "Google Maps"
    }
  drill_fields: [city, st_assem, cncldist, cb_num, nta]
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
    description: "Diameter of stump"
    type: number
    sql: ${TABLE}.stump_diam ;;
  }



  dimension: tree_dbh {
    description: "Diameter at breast height of tree"
    type: number
    sql: ${TABLE}.tree_dbh ;;
  }

  dimension: tree_id {
    type: number
    sql: ${TABLE}.tree_id ;;
  }

  dimension: trnk_light {
    description: "Trunk problems caused by lights"
    type: yesno
    group_label: "Trunk Info"
    sql: ${TABLE}.trnk_light ;;
  }

  dimension: trnk_other {
    description: "Presence of other trunk problems"
    type: yesno
    group_label: "Trunk Info"
    sql: ${TABLE}.trnk_other ;;
  }

  dimension: trunk_wire {
    description: "Trunk problems caused by rope or wires"
    type: yesno
    group_label: "Trunk Info"
    sql: ${TABLE}.trunk_wire ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}.user_type ;;
  }

  dimension: x_sp {
    group_label: "Location Info"
    type: number
    sql: ${TABLE}.x_sp ;;
  }

  dimension: y_sp {
    group_label: "Location Info"
    type: number
    sql: ${TABLE}.y_sp ;;
  }

  dimension: city {
    group_label: "Location Info"
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.zip_city ;;
  }


  dimension: zipcode {
    group_label: "Location Info"
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }


  dimension: zipcode_cast {
    group_label: "Location Info"
    type: zipcode
    sql: LPAD(CAST(${TABLE}.zipcode as STRING), 5, '0') ;;
  }

  dimension: zipcode_alt {
    group_label: "Location Info"
    type: number
    sql: ${TABLE}.zipcode ;;
    value_format: "0"
  }

  measure: west_side_count {
    group_label: "Neighborhood Counts"
    type: count
    filters: {
      field: zipcode_alt
      value: "10012, 10013, 10014"
    }
  }


  measure: lower_manhattan_count {
    group_label: "Neighborhood Counts"
    type: count
    filters: {
      field: zipcode_alt
      value:  "10004, 10005, 10006, 10007, 10038, 10280"
    }
  }




  measure: count {
    type: count
    drill_fields: [tree_images.image, boroname_alt, brch_light, brch_other, species_common, species_latin, nta_name]
  }

  measure: avg_tree_dbh {
    group_label: "Tree Size Info"
    type: average
    sql: ${tree_dbh} ;;
    value_format: "0.00"
  }


  measure: avg_stump_diam {
    group_label: "Tree Size Info"
    type: average
    sql: ${stump_diam} ;;
    value_format: "0.00"
  }



  measure: rt_stone_count {
    group_label: "Root Info"
    type: count
    filters: {
      field: root_stone
      value: "Yes"
    }
  }


  measure: percent_rt_stone {
    group_label: "Root Info"
    type: number
    sql: 1.00 * ${rt_stone_count} / NULLIF(${count}, 0) ;;
    value_format: "#.0000\%"

  }


  measure: rt_gt_count {
    group_label: "Root Info"
    type: count
    filters: {
      field: root_grate
      value: "Yes"
    }
  }


  measure: percent_rt_gt {
    group_label: "Root Info"
    type: number
    sql: 1.00 * ${rt_gt_count} / NULLIF(${count}, 0) ;;
    value_format: "#.0000\%"

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



  measure: manhattan_count {
    group_label: "Borough Counts"
    type: count
    filters: {
      field: borocode
      value: "1"
    }
  }

  measure: bronx_count {
    group_label: "Borough Counts"
    type: count
    filters: {
      field: borocode
      value: "2"
    }
  }


  measure: brooklyn_count {
    group_label: "Borough Counts"
    type: count
    filters: {
      field: borocode
      value: "3"
    }
  }

  measure: queens_count {
    group_label: "Borough Counts"
    type: count
    filters: {
      field: borocode
      value: "4"
    }
  }

  measure: staten_island_count {
    group_label: "Borough Counts"
    type: count
    filters: {
      field: borocode
      value: "5"
    }
  }


  measure: percent_manhattan {
    group_label: "Borough Counts"
    type: number
    sql: 100.0 * ${manhattan_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_bronx {
    group_label: "Borough Counts"
    type: number
    sql: 100.0 * ${bronx_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_brooklyn {
    group_label: "Borough Counts"
    type: number
    sql: 100.0 * ${brooklyn_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_queens {
    group_label: "Borough Counts"
    type: number
    sql: 100.0 * ${queens_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }

  measure: percent_staten_island {
    group_label: "Borough Counts"
    type: number
    sql: 100.0 * ${staten_island_count} / NULLIF(${count}, 0) ;;
    value_format: "#.00\%"

  }


}
