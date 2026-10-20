with order_items as(
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
from order_items 