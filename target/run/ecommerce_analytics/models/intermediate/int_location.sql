
  
    

  create  table "ecommerce_db"."intermediate"."int_location__dbt_tmp"
  
  
    as
  
  (
    with location as (
    SELECT 
        geolocation_zip_code_prefix,
        geolocation_lat :: DOUBLE PRECISION,
        geolocation_lng :: DOUBLE PRECISION,
        lower(geolocation_city) as geolocation_city,
        upper(geolocation_state) as geolocation_state
    FROM "ecommerce_db"."raw"."stg_location"
)
SELECT *
FROM location
  );
  