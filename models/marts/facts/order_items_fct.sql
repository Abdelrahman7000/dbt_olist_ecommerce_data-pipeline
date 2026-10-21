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
        unique_key='order_item_key',
        incremental_strategy='merge'
    )
}}

with source_data as (

    select 
        ot.*,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm

    from {{ ref('int_order_items') }} ot
    join {{ ref('int_products') }} p using(product_id)

),

{% if is_incremental() %}

changed_rows as (

    select s.*
    from source_data s
    left join {{ this }} t
        on s.order_id = t.order_id
    where
        t.order_item_key is null
        --t.order_id is null
        --or s.order_item_key != t.order_item_key

)

select * from changed_rows

{% else %}

select * from source_data

{% endif %}
