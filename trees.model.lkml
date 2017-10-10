connection: "google_bigquery_test_db"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

map_layer: my_boro_layer {
  url: "https://www.dropbox.com/s/z9njpdcra3bs4am/nybb.json?dl=0"
   property_key: "BoroCode"
 }

explore: tree_census_2015 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_2015.species_latin} ;;
  }
}

explore: tree_census_2005 {

}

explore: tree_species {

}

explore: fall_color_2005 {}

explore: fall_colors {

}

explore: change_since_2005 {

}


explore: change_since_1995 {

}

explore: health_pct_2015 {

}
