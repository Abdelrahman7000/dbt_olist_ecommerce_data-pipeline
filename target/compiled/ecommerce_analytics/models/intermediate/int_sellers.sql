with sellers as (
    select 
        seller_id,
        seller_zip_code_prefix,
        lower(seller_city),
        upper(seller_state)
    from "ecommerce_db"."raw"."stg_sellers"
)

select *
from sellers