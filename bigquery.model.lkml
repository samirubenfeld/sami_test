connection: "google_bigquery_test_db"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


explore: movies {
  join: ratings {
    type: left_outer
    sql_on: ${movies.movie_id} = ${ratings.movie_id} ;;
    relationship: many_to_one
  }
  join: links {
    type: left_outer
    sql_on: ${movies.movie_id} = ${links.movie_id} ;;
    relationship: many_to_one
  }
  join: tags {
    type: left_outer
    sql_on: ${movies.movie_id} = ${tags.movie_id} ;;
    relationship: many_to_one
  }
}
