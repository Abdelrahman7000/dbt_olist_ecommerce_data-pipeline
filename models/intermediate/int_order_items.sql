with order_items as (
    select 
        order_id :: varchar,
        order_item_id :: Numeric,
        product_id :: varchar,
        seller_id :: varchar,
        shipping_limit_date :: timestamp,
        price :: numeric,
        freight_value :: numeric
    from {{ ref('stg_order_items') }}
)

select
    {{ dbt_utils.generate_surrogate_key(['order_id', 'order_item_id','product_id'])}} as order_item_pk,
    order_id,
    order_item_id,
    seller_id,
    product_id,
    price,
    shipping_limit_date,
    freight_value
from order_items 