view: ratings {
  sql_table_name: movie_lens.ratings ;;

  dimension: movie_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movieId ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: timestamp {
    type: number
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.userId ;;
  }

  measure: rating_total {
    type: sum
    sql: ${TABLE}.rating ;;
  }

  measure: rating_average {
    type: average
    sql: ${TABLE}.rating ;;
  }

  measure: rating_min {
    type: min
    sql: ${TABLE}.rating ;;
  }

  measure: rating_max {
    type: max
    sql: ${TABLE}.rating ;;
  }

  measure: count {
    type: count
    drill_fields: [movies.movie_id]
  }
}
