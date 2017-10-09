view: artworks {
  view_label: "artworks"
  sql_table_name: MOMA.df_clean_2 ;;

  dimension: accession_number {
    type: string
    sql: ${TABLE}.AccessionNumber ;;
  }

  dimension: artist {
    type: string
    sql: ${TABLE}.Artist_A ;;
  }

  dimension: cataloged {
    type: yesno
    sql: ${TABLE}.Cataloged ;;
  }

  dimension: circumference__cm {
    type: number
    sql: ${TABLE}.Circumference__cm_ ;;
  }

  dimension: classification {
    type: string
    sql: ${TABLE}.Classification ;;
  }

  dimension: constituent_id_a {
    type: number
    sql: ${TABLE}.ConstituentID_A ;;
  }

  dimension: credit_line {
    type: string
    sql: ${TABLE}.CreditLine ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension_group: date_acquired {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.DateAcquired ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.Department ;;
  }

  dimension: depth__cm {
    type: number
    sql: ${TABLE}.Depth__cm_ ;;
  }

  dimension: diameter__cm {
    type: number
    sql: ${TABLE}.Diameter__cm_ ;;
  }

  dimension: duration__sec {
    type: number
    sql: ${TABLE}.Duration__sec__ ;;
  }

  dimension: duration_min {
    type: number
    sql: ${duration__sec}/60 ;;
  }

  dimension: height__cm {
    type: number
    sql: ${TABLE}.Height__cm_ ;;
  }

#   dimension: int64_field_0 {
#     type: number
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: length__cm {
    type: number
    sql: ${TABLE}.Length__cm_ ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.Medium ;;
  }

  dimension: object_id {
    type: number
    sql: ${TABLE}.ObjectID ;;
  }

  dimension: seat_height__cm {
    type: number
    sql: ${TABLE}.Seat_Height__cm_ ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }

  dimension: weight__kg {
    type: number
    sql: ${TABLE}.Weight__kg_ ;;
  }

  dimension: width__cm {
    type: number
    sql: ${TABLE}.Width__cm_ ;;
  }

  dimension: artworks_years_until_acquistion {
    type: number
    sql:DATE_DIFF(artworks.DateAcquired,artworks.Date, year)  ;;

  }


# MEASURES



  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: average_depth {
    type: average
    sql: ${depth__cm} ;;
  }

  measure: average_height {
    type: average
    sql: ${height__cm} ;;
  }

  measure: average_width {
    type: average
    sql: ${width__cm} ;;
  }

  set: detail {
    fields: [
      artist,
      title,
      credit_line,
      classification,
      department,
      height__cm,
      depth__cm,
      length__cm,
      cataloged,
      date_date,
      date_year,
      date_month,
      date_week,
      date_acquired_date,
      date_acquired_year,
      date_acquired_month,
      date_acquired_week,

    ]
  }
}
