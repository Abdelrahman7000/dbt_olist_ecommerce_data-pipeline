
  
    

  create  table "ecommerce_db"."marts"."location_dim__dbt_tmp"
  
  
    as
  
  (
    WITH location AS (
    SELECT
        md5(cast(coalesce(cast(geolocation_zip_code_prefix as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_lat as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_lng as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_city as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_state as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS    location_pk,

        geolocation_zip_code_prefix,
        geolocation_lat,
        geolocation_lng,
        geolocation_city,
        geolocation_state
    FROM "ecommerce_db"."intermediate"."int_location"
)

SELECT
    *
FROM location
  );
  