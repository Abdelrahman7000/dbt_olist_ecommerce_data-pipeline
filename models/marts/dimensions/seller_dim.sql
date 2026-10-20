with seller_snapshots as (
    select * from {{ ref('snapshot_sellers') }}
)

select
    -- Generate dynamic surrogate key for each dimensional revision
    {{ dbt_utils.generate_surrogate_key(['seller_id', 'dbt_valid_from']) }} as seller_pk,
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    (dbt_valid_to is null) as is_current
from seller_snapshots