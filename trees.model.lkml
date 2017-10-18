connection: "google_bigquery_test_db"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project
include: "bq.*.view.lkml"
include: "/test_datablocks/bq.explore.lkml"



map_layer: block_group {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/dwmintz.4mqiv49l/{z}/{x}/{y}.mvt?access_token=pk.eyJ1IjoiZHdtaW50eiIsImEiOiJjajFoemQxejEwMHVtMzJwamw4OXprZWg0In0.qM9sl1WAxbEUMVukVGMazQ"
  feature_key: "us_block_groups_simple-c0qtbp"
  extents_json_url: "https://cdn.rawgit.com/dwmintz/census_extents2/59fa2cd8/bg_extents.json"
#   min_zoom_level: 9
  max_zoom_level: 12
  property_key: "GEOID"
}

map_layer: tract {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/dwmintz.3zfb3asw/{z}/{x}/{y}.mvt?access_token=pk.eyJ1IjoiZHdtaW50eiIsImEiOiJjajFoemQxejEwMHVtMzJwamw4OXprZWg0In0.qM9sl1WAxbEUMVukVGMazQ"
  feature_key: "us_tracts-6w08eq"
  extents_json_url: "https://cdn.rawgit.com/dwmintz/census_extents2/396e32db/tract_extents.json"
  min_zoom_level: 6
  max_zoom_level: 12
  property_key: "GEOID"
}


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

}


# explore: test {
#   from: tree_census_2015
#   hidden: yes
# }

explore: healthy_1995 {}

explore: tree_census_2015 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_2015.species_latin} ;;
  }
  join: bq_zipcode_income_facts {
    sql_on: ${tree_census_2015.zipcode_cast} = ${bq_zipcode_income_facts.ZCTA5} ;;
    type: left_outer
    relationship: many_to_one
    }
  }

explore: tree_census_1995 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_1995.spc_latin} ;;
  }
}


# explore: tree_census_2005 {
#
# }
#
explore: tree_species {

}
#
# explore: fall_color_2005 {}

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
