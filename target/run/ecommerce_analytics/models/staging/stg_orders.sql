
  create view "ecommerce_db"."raw"."stg_orders__dbt_tmp"
    
    
  as (
    with orders as (
    select *
    from "ecommerce_db"."raw"."orders"

)

select * from orders
  );