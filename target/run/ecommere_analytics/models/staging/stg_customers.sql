
  create view "ecommerce_db"."raw"."stg_customers__dbt_tmp"
    
    
  as (
    with customers as (
    select * 
    
    from "ecommerce_db"."raw"."customers"

)

select * from customers
  );