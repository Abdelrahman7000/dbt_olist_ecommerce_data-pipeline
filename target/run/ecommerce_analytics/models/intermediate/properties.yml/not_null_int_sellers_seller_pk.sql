
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select seller_pk
from "ecommerce_db"."intermediate"."int_sellers"
where seller_pk is null



  
  
      
    ) dbt_internal_test