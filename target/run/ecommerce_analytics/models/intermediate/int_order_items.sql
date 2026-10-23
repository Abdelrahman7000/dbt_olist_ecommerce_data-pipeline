
  
    

  create  table "ecommerce_db"."intermediate"."int_order_items__dbt_tmp"
  
  
    as
  
  (
    with order_items as (
    select 
        order_id :: varchar,
        order_item_id :: Numeric,
        product_id :: varchar,
        seller_id :: varchar,
        shipping_limit_date :: timestamp,
        price :: numeric,
        freight_value :: numeric
    from "ecommerce_db"."raw"."stg_order_items"
)

select
    md5(cast(coalesce(cast(order_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(order_item_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(product_id as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as order_item_pk,
    order_id,
    order_item_id,
    seller_id,
    product_id,
    price,
    shipping_limit_date,
    freight_value
from order_items
  );
  