connection: "google_bigquery_test_db"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project





# map_layer: my_boro_layer {
#   file: "nyu_2451_34154.json"
#   feature_key: "BOROCODE"
# }

explore: test {
  from: tree_census_2015
  hidden: yes
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

explore: trees_1995_clean {

}

explore: trees_2015_clean {

}
