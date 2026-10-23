
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    seller_pk as unique_field,
    count(*) as n_records

from "ecommerce_db"."marts"."seller_dim"
where seller_pk is not null
group by seller_pk
having count(*) > 1



  
  
      
    ) dbt_internal_test