with location as (
    SELECT 
        geolocation_zip_code_prefix,
        geolocation_lat :: DOUBLE PRECISION,
        geolocation_lng :: DOUBLE PRECISION,
        lower(geolocation_city) as geolocation_city,
        upper(geolocation_state) as geolocation_state
    FROM {{ ref('stg_location') }}
)
SELECT
     {{ dbt_utils.generate_surrogate_key([
        'geolocation_zip_code_prefix',
        'geolocation_lat',
        'geolocation_lng',
        'geolocation_city',
        'geolocation_state'
        ]) }} AS    location_pk,
    *
FROM location



