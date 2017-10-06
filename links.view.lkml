view: links {
  sql_table_name: movie_lens.links ;;

  dimension: imdb_id {
    type: number
    sql: ${TABLE}.imdbId ;;
  }

  dimension: movie_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.movieId ;;
  }

  dimension: tmdb_id {
    type: number
    sql: ${TABLE}.tmdbId ;;
  }

  measure: count {
    type: count
    drill_fields: [movies.movie_id]
  }
}
