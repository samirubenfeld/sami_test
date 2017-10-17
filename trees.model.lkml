connection: "google_bigquery_test_db"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project



map_layer: custom_census {
  url: "https://gist.githubusercontent.com/samirubenfeld/b6e0cc4feb256cac17b7de5d8d9ba0ce/raw/5bf4a50353882bece32260e7ab67f0b2d2e68e1f/2010CensusTracts.json"
  property_key: "ntacode"
}



 map_layer: custom_map {
   url: "https://gist.githubusercontent.com/samirubenfeld/1b971a1af78bf6d9e844a4d35d7225c8/raw/c639b8d616a374c2d48d3a36349fb65d4807e9b5/query%2520(1).json"
   property_key: "CounDist"
 }

map_layer: custom_borough_map {
url: "https://gist.githubusercontent.com/samirubenfeld/a8714a26c8574c01b92d9ff52b6ef67e/raw/1ce82c3bd978024b871965b3d7227f539c604b4b/nybb_boro%2520(1).json"
property_key: "BoroCode"
}

map_layer: custom_cbnum_map {
  url: "https://gist.githubusercontent.com/samirubenfeld/c2e16e3948950860244d7c5778e471d9/raw/c7e4bd9458557303dd554f83a1d29e2c633cfb44/districts.json"
  property_key: "FID"
}


explore: fall_form {

}


explore: rank_manhattan {

}

explore: rank_brooklyn {


}


explore: rank_brooklyn_base {


}

explore: rank {
  join: tree_census_2015 {
    relationship: many_to_one
    sql_on:  ${rank.spc_latin} = ${tree_census_2015.species_latin} ;;
  }
}


# explore: test {
#   from: tree_census_2015
#   hidden: yes
# }

explore: tree_census_2015 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_2015.species_latin} ;;
  }
}


explore: tree_census_1995 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_1995.spc_latin} ;;
  }
}


explore: tree_census_2005 {

}

explore: tree_species {

}

explore: fall_color_2005 {}

explore: fall_colors {
  extends: [tree_species]

}

explore: change_since_2005 {

}


explore: change_since_1995 {

}

explore: health_pct_2015 {

}

explore: merged_1995_2015 {

}

# explore: trees_1995_clean {
#
# }
#
# explore: trees_2015_clean {
#
# }
