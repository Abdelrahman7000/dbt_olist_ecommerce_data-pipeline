
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select *
from "ecommerce_db"."intermediate"."int_orders"
where order_delivered_customer_date < order_purchase_timestamp


  
  
      
    ) dbt_internal_test