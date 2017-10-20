
view: tract_zcta_map {
  label: "Geography"
  derived_table: {
    sql:
      SELECT geoid, ZCTA5  FROM
      (select *,  ROW_NUMBER() OVER (PARTITION BY GEOID ORDER BY ZPOPPCT DESC) row_num
      from `looker-datablocks.acs_fast_facts.zcta_to_tract_w_state`)
      WHERE row_num = 1;;

    }
    view_label: "Geography"
    dimension: geoid11 {sql: ${TABLE}.geoid;; hidden:yes}
    dimension: ZCTA5 {
      sql: LPAD(CAST(${TABLE}.ZCTA5 as STRING), 5, '0');;
      type: zipcode
      label: "ZIP (ZCTA)"
    }
  }
