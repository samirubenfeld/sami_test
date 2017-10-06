view: tags {
  sql_table_name: movie_lens.tags ;;

  dimension: movie_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movieId ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.userId ;;
  }

  measure: count {
    type: count
    drill_fields: [movies.movie_id]
  }
}
