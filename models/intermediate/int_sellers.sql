with sellers as (
    select 
        {{ dbt_utils.generate_surrogate_key(['seller_id', 'seller_zip_code_prefix','seller_city']) }} as seller_pk,
        seller_id,
        seller_zip_code_prefix,
        lower(seller_city) as seller_city,
        upper(seller_state) as seller_state
    from {{ ref('stg_sellers') }}
)

select *
from sellers