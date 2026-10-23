with location as (
    SELECT 
        geolocation_zip_code_prefix,
        geolocation_lat :: DOUBLE PRECISION,
        geolocation_lng :: DOUBLE PRECISION,
        lower(geolocation_city) as geolocation_city,
        upper(geolocation_state) as geolocation_state
    FROM "ecommerce_db"."raw"."stg_location"
)
SELECT
     md5(cast(coalesce(cast(geolocation_zip_code_prefix as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_lat as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_lng as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_city as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(geolocation_state as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) AS    location_pk,
    *
FROM location