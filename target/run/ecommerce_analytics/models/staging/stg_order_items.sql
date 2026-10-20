
  create view "ecommerce_db"."raw"."stg_order_items__dbt_tmp"
    
    
  as (
    with order_items as (
    select *
    from "ecommerce_db"."raw"."order_items"

)

select * from order_items
  );