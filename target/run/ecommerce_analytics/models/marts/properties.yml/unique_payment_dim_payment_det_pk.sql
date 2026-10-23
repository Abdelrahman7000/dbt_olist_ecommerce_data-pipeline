
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    payment_det_pk as unique_field,
    count(*) as n_records

from "ecommerce_db"."marts"."payment_dim"
where payment_det_pk is not null
group by payment_det_pk
having count(*) > 1



  
  
      
    ) dbt_internal_test