view: zcta_to_tract_w_state {
  sql_table_name: `looker-datablocks.acs_fast_facts.zcta_to_tract_w_state`
    ;;

  dimension: _arealandpt {
    type: number
    sql: ${TABLE}._AREALANDPT ;;
  }

  dimension: areapt {
    type: number
    sql: ${TABLE}.AREAPT ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}.COUNTY ;;
  }

  dimension: fips {
    type: number
    sql: ${TABLE}.fips ;;
  }

  dimension: geoid {
    type: string
    sql: ${TABLE}.GEOID ;;
  }

  dimension: hupt {
    type: number
    sql: ${TABLE}.HUPT ;;
  }

  dimension: poppt {
    type: number
    sql: ${TABLE}.POPPT ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
  }

  dimension: state_abbreviation {
    type: string
    sql: ${TABLE}.state_abbreviation ;;
  }

  dimension: state_name {
    type: string
    sql: ${TABLE}.state_name ;;
  }

  dimension: tract {
    type: string
    sql: ${TABLE}.TRACT ;;
  }

  dimension: trarea {
    type: number
    sql: ${TABLE}.TRAREA ;;
  }

  dimension: trarealand {
    type: number
    sql: ${TABLE}.TRAREALAND ;;
  }

  dimension: trarealandpct {
    type: number
    sql: ${TABLE}.TRAREALANDPCT ;;
  }

  dimension: trareapct {
    type: number
    sql: ${TABLE}.TRAREAPCT ;;
  }

  dimension: trhu {
    type: number
    sql: ${TABLE}.TRHU ;;
  }

  dimension: trhupct {
    type: number
    sql: ${TABLE}.TRHUPCT ;;
  }

  dimension: trpop {
    type: number
    sql: ${TABLE}.TRPOP ;;
  }

  dimension: trpoppct {
    type: number
    sql: ${TABLE}.TRPOPPCT ;;
  }

  dimension: zarea {
    type: number
    sql: ${TABLE}.ZAREA ;;
  }

  dimension: zarealand {
    type: number
    sql: ${TABLE}.ZAREALAND ;;
  }

  dimension: zarealandpct {
    type: number
    sql: ${TABLE}.ZAREALANDPCT ;;
  }

  dimension: zareapct {
    type: number
    sql: ${TABLE}.ZAREAPCT ;;
  }

  dimension: zcta5 {
    type: string
    sql: ${TABLE}.ZCTA5 ;;
  }

  dimension: zhu {
    type: number
    sql: ${TABLE}.ZHU ;;
  }

  dimension: zhupct {
    type: number
    sql: ${TABLE}.ZHUPCT ;;
  }

  dimension: zpop {
    type: number
    sql: ${TABLE}.ZPOP ;;
  }

  dimension: zpoppct {
    type: number
    sql: ${TABLE}.ZPOPPCT ;;
  }

  measure: count {
    type: count
    drill_fields: [state_name]
  }
}
