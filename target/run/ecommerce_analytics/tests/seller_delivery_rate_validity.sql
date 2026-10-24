
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select *
from "ecommerce_db"."marts"."seller_dim"
where seller_delayed_delivery_rate_percentage < 0.00 
   or seller_delayed_delivery_rate_percentage > 100.00
  
  
      
    ) dbt_internal_test