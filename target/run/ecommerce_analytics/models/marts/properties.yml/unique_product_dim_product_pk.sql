
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    product_pk as unique_field,
    count(*) as n_records

from "ecommerce_db"."marts"."product_dim"
where product_pk is not null
group by product_pk
having count(*) > 1



  
  
      
    ) dbt_internal_test