
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  

select *
from "ecommerce_db"."intermediate"."int_order_reviews"
where review_answer_timestamp < review_creation_date


  
  
      
    ) dbt_internal_test