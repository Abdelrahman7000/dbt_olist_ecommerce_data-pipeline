with sellers as (
    select 
        md5(cast(coalesce(cast(seller_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(seller_zip_code_prefix as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(seller_city as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as seller_pk,
        seller_id,
        seller_zip_code_prefix,
        lower(seller_city) as seller_city,
        upper(seller_state) as seller_state
    from "ecommerce_db"."raw"."stg_sellers"
)

select *
from sellers