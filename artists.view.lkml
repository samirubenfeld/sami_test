view: artists {
  sql_table_name: MOMA.artists ;;

  dimension: artist_bio {
    type: string
    sql: ${TABLE}.ArtistBio ;;
  }

  dimension: begin_date {
    type: number
    sql: ${TABLE}.BeginDate ;;
  }

  dimension: constituent_id {
    type: number
    sql: ${TABLE}.ConstituentID ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.DisplayName ;;
  }

  dimension: end_date {
    type: number
    sql: ${TABLE}.EndDate ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.Gender ;;
  }

#   dimension: int64_field_0 {
#     type: number
#     sql: ${TABLE}.int64_field_0 ;;
#   }

  dimension: nationality {
    type: string
    sql: ${TABLE}.Nationality ;;
  }

  measure: count {
    type: count
    drill_fields: [gender]
  }
}
