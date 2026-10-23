




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

    from "ecommerce_db"."intermediate"."int_order_items" ot
    left join "ecommerce_db"."intermediate"."int_products" p on p.product_id=ot.product_id
    left join "ecommerce_db"."intermediate"."int_sellers" s on s.seller_id=ot.seller_id
    left join "ecommerce_db"."intermediate"."int_orders" of on of.order_id=ot.order_id

)--,
 


,changed_rows as (

    select s.*
    from source_data s
    left join "ecommerce_db"."marts"."order_items_fct" t
        on s.order_id = t.order_id
    where
        t.order_item_pk is null
        --t.order_id is null
        --or s.order_item_pk != t.order_item_pk

)

select * from changed_rows

