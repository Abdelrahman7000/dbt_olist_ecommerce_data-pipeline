




with source_data as (

    select 
        ot.*,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm

    from "ecommerce_db"."intermediate"."int_order_items" ot
    join "ecommerce_db"."intermediate"."int_products" p using(product_id)

),



changed_rows as (

    select s.*
    from source_data s
    left join "ecommerce_db"."marts"."order_items_fct" t
        on s.order_id = t.order_id
    where
        t.order_item_key is null
        --t.order_id is null
        --or s.order_item_key != t.order_item_key

)

select * from changed_rows

