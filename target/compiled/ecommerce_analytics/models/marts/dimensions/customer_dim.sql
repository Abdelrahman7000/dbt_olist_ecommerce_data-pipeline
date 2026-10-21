with customer_snapshots as (
    select * from "ecommerce_db"."snapshots"."snapshot_customers"
)

select
    -- Generate dynamic surrogate key for each dimensional revision
    md5(cast(coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_unique_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_zip_code_prefix as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(customer_city as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customer_pk,
    --md5(cast(coalesce(cast(customer_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(dbt_valid_from as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as customer_pk,
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state,
    dbt_valid_from as valid_from,
    dbt_valid_to as valid_to,
    (dbt_valid_to is null) as is_current
from customer_snapshots