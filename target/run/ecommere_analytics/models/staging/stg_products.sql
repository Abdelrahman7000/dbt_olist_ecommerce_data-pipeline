
  create view "ecommerce_db"."raw"."stg_products__dbt_tmp"
    
    
  as (
    with products as (
    select *
    from "ecommerce_db"."raw"."products"

)

select * from products
  );