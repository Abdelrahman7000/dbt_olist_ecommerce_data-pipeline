
  create view "ecommerce_db"."raw"."stg_order_reviews__dbt_tmp"
    
    
  as (
    with order_reviews as (
    select *
    from "ecommerce_db"."raw"."order_reviews"

)

select * from order_reviews
  );