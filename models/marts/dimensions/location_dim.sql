WITH location AS (
    SELECT
        {{ dbt_utils.generate_surrogate_key([
        'geolocation_zip_code_prefix',
        'geolocation_lat',
        'geolocation_lng',
        'geolocation_city',
        'geolocation_state'
        ]) }} AS    location_pk,

        geolocation_zip_code_prefix,
        geolocation_lat,
        geolocation_lng,
        geolocation_city,
        geolocation_state
    FROM {{ ref('int_location') }}
)

SELECT
    *
FROM location