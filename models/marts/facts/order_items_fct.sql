{# with order_items as(
    select 
        ot.*,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm

    from {{ ref('int_order_items') }} ot
    join {{ ref('int_products') }} p using(product_id)
)
  
select *
from order_items  #}


{{
    config(
        materialized='incremental',
        unique_key='order_item_pk',
        incremental_strategy='merge'
    )
}}

with source_data as (
 
    select 
        ot.order_item_pk,
        ot.order_id,
        of.order_pk,
        ot.order_item_id,
        --ot.seller_id,
        --ot.product_id,
        s.seller_pk,
        p.product_pk,
        ot.price,
        ot.shipping_limit_date,
        ot.freight_value,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm

    from {{ ref('int_order_items') }} ot
    left join {{ ref('int_products') }} p on p.product_id=ot.product_id
    left join {{ ref('int_sellers') }} s on s.seller_id=ot.seller_id
    left join {{ ref('int_orders') }} of on of.order_id=ot.order_id

)--,
 
{% if is_incremental() %}

,changed_rows as (

    select s.*
    from source_data s
    left join {{ this }} t
        on s.order_id = t.order_id
    where
        t.order_item_pk is null
        --t.order_id is null
        --or s.order_item_pk != t.order_item_pk

)

select * from changed_rows

{% else %}

select * from source_data

{% endif %}
