
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    o.order_id,
    o.order_status
from "ecommerce_db"."intermediate"."int_orders" o
left join "ecommerce_db"."intermediate"."int_order_items" i on o.order_id = i.order_id
where i.order_id is null
  and o.order_status not in ('canceled')
  
  
      
    ) dbt_internal_test