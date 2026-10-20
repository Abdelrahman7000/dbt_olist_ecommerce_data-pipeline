
  
    

  create  table "ecommerce_db"."marts"."order_items_fct__dbt_tmp"
  
  
    as
  
  (
    with order_items as(
    select 
        ot.*,
        p.product_weight_g,
        p.product_length_cm,
        p.product_height_cm,
        p.product_width_cm

    from "ecommerce_db"."intermediate"."int_order_items" ot
    join "ecommerce_db"."intermediate"."int_products" p using(product_id)
)

select *
from order_items
  );
  