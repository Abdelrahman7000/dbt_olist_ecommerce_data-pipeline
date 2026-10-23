
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "ecommerce_db"."marts"."order_fct"--"ecommerce_db"."intermediate"."int_orders"
where order_status = 'delivered'
  and order_delivered_customer_date is null
  
  
      
    ) dbt_internal_test