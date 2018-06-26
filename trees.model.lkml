connection: "google_bigquery_test_db"

include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project
# include: "bq.*.view.lkml"
# include: "/test_datablocks/bq.explore.lkml"



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


map_layer: custom_st_assembly {
  url: "https://gist.githubusercontent.com/samirubenfeld/db3f5d6af09c7d521d0d31176f5c672a/raw/6d162765434f92f5e292ba22d83722fd06cddd57/stassem.json"
  property_key: "AssemDist"
}

map_layer: custom_manhattan_map {
  url: "https://gist.githubusercontent.com/samirubenfeld/99de6d1f34d89175d1b2c4c00e801ea8/raw/87ead24cc274efe86ee02174b53fe2bed86caf8f/manhattan_tracts.json"
  property_key: "ntacode"
}

map_layer: custom_brooklyn_map {
  url: "https://gist.githubusercontent.com/samirubenfeld/e16a290baa71f74ce6d0d372968eadac/raw/56ff3c11a0ea7cc6a45c51d04b61b8436bd94000/brooklyn_tracts.json"
  property_key: "ntacode"
}

map_layer: custom_queens_map {
  url: "https://gist.githubusercontent.com/samirubenfeld/b14309f1aed70f6b98cf4f58d6e349b7/raw/7a5e43c5454542a2461d034d44ef8df41718c405/queens_tracts.json"
  property_key: "ntacode"
}


map_layer: custom_si_map {
  url: "https://gist.githubusercontent.com/samirubenfeld/702613d454eb8f78d880a2bccc801ac1/raw/0dabcf2b8adb9cf777dd1e4acbb1fea23e124448/statenisle_tracts.json"
  property_key: "ntacode"
}

map_layer: custom_bronx_map {
  url: "https://gist.githubusercontent.com/samirubenfeld/0291ef9134e78d94dac3398dccace4c5/raw/8a24a39041276e5fae792d1742321e07ad18f3aa/bronx_tracts.json"
  property_key: "ntacode"
}


map_layer: custom_nta {
  url: "https://gist.githubusercontent.com/samirubenfeld/b6e0cc4feb256cac17b7de5d8d9ba0ce/raw/5bf4a50353882bece32260e7ab67f0b2d2e68e1f/2010CensusTracts.json"
  property_key: "ntacode"
}

map_layer: custom_neighborhoods {
  url: "https://gist.githubusercontent.com/samirubenfeld/3c2c888b779b694107a32ab7050e61b8/raw/6a936ba08539271f9639cb9b8d2533c60006fc43/neighborhoods.json"
  property_key: "neighborhood"
}


 map_layer: custom_council{
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
  hidden: yes

}


explore: pop_changes_by_zip {}


explore: rank_queens {
  hidden: yes

}


explore: rank_queens_base {
  hidden: yes
}

explore: rank_manhattan {
  hidden: yes

}

explore: rank_brooklyn {
  hidden: yes


}


explore: rank_brooklyn_base {
  hidden: yes


}

explore: rank {
  hidden:  yes

}

explore: change_2005_2015 {}


explore: top_nyc_locations {}


# explore: test {
#   from: tree_census_2015
#   hidden: yes
# }

explore: healthy_1995 {
  hidden: yes
}

explore: tree_census_2015 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_2015.species_latin} ;;
  }
  join: tree_images {
    relationship: many_to_one
    sql_on: ${tree_census_2015.species_latin} = ${tree_images.species_latin} ;;
  }

}


explore: tree_census_2015_bigquery {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_2015_bigquery.species_latin} ;;
  }
  join: tree_images {
    relationship: many_to_one
    sql_on: ${tree_census_2015_bigquery.species_latin} = ${tree_images.species_latin} ;;
  }

}





explore: tree_census_1995 {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_1995.spc_latin} ;;
  }
}


explore: fast_facts {
  from: bq_logrecno_bg_map
  join: block_group_facts {
    from: block_group_facts
    view_label: "Fast Facts"
    sql_on: ${fast_facts.block_group} = ${block_group_facts.logrecno_bg_map_block_group};;
    relationship: one_to_one
    }
  join: tract_zcta_map {
    from: tract_zcta_map
    sql_on: ${fast_facts.geoid11} = ${tract_zcta_map.geoid11};;
    relationship: many_to_one
    }
  join: zcta_distances {
    from: zcta_distances
    sql_on: ${tract_zcta_map.ZCTA5} = ${zcta_distances.zip2} ;;
    relationship: one_to_one
    required_joins: [tract_zcta_map]
    }
  join: tree_census_2015 {
    from: tree_census_2015
      sql_on: ${tree_census_2015.zipcode_cast} = ${tract_zcta_map.ZCTA5} ;;
     relationship: one_to_one
     }
  }


explore: tree_images {

}


# explore: tree_census_2005 {
#
# }
#
explore: tree_species {

}


explore: rank_bronx {

}

explore: rank_bronx_base {

}
#
# explore: fall_color_2005 {}

explore: fall_colors {
  extends: [tree_species]

}


explore: top_10_locations {
#   hidden: yes
}

explore: change_since_2005 {
  hidden: yes

}

# explore: tree_census_2015_bigquery {
#
# }

explore: tree_census_2005_bigquery {
  join: tree_species {
    relationship: many_to_one
    sql_on:  ${tree_species.species_scientific_name} = ${tree_census_2005_bigquery.spc_latin} ;;
  }
  join: tree_images {
    relationship: many_to_one
    sql_on: ${tree_census_2005_bigquery.spc_latin} = ${tree_images.species_latin} ;;
  }


}


explore: tree_census_1995_bigquery {

}


explore: change_since_1995 {
  hidden: yes

}

explore: health_pct_2015 {
  hidden: yes

}

explore: growth_1995_2005 {

}


explore: merged_1995_2015 {
  hidden: yes

}
