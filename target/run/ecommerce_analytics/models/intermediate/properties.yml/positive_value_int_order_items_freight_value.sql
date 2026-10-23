
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select *
from "ecommerce_db"."intermediate"."int_order_items"
where freight_value < 0


  
  
      
    ) dbt_internal_test