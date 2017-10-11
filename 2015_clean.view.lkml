view: trees_2015_clean {
  sql_table_name: nyc_trees.2015_clean ;;


  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: location {
    type: location
    sql_latitude:${latitude};;
    sql_longitude:${longitude};;
  }

  dimension: spc_common {
    type: string
    sql: ${TABLE}.SPC_COMMON ;;
  }

  dimension: spc_latin {
    primary_key: yes
    type: string
    sql: ${TABLE}.SPC_LATIN ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }



  dimension: year {
    type: number
     sql: ${TABLE}.year ;;
    }

#   dimension: year {
#     type: date_year
#     sql: ${TABLE}.year ;;
#   }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.ZIPCODE ;;
  }

  measure: count {
    type: count
    drill_fields: [spc_latin, spc_common]
  }
}
