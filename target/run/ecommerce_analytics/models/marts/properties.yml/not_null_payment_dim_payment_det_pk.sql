
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select payment_det_pk
from "ecommerce_db"."marts"."payment_dim"
where payment_det_pk is null



  
  
      
    ) dbt_internal_test