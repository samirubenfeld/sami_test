view: movies {
  sql_table_name: movie_lens.movies ;;

  dimension: movie_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.movieId ;;
  }

  dimension: genres {
    type: string
    sql: ${TABLE}.genres ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [movie_id, links.count, ratings.count, tags.count]
  }
}
