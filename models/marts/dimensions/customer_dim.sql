with customer_snapshots as (
    select * from {{ ref('snapshot_customers') }}
)

select
    -- Generate dynamic surrogate key for each dimensional revision
    {{ dbt_utils.generate_surrogate_key(['customer_id', 'customer_unique_id','customer_zip_code_prefix','customer_city']) }} as customer_pk,
    --{{ dbt_utils.generate_surrogate_key(['customer_id', 'dbt_valid_from']) }} as customer_pk,
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    (dbt_valid_to is null) as is_current
from customer_snapshots

