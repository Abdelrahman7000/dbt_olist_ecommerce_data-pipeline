
  create view "ecommerce_db"."raw"."stg_order_payments__dbt_tmp"
    
    
  as (
    with order_payments as (
    select *
    from "ecommerce_db"."raw"."order_payments"

)

select * from order_payments
  );