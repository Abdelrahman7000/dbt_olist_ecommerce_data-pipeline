
  create view "ecommerce_db"."raw"."stg_sellers__dbt_tmp"
    
    
  as (
    with sellers as (
    select *
    from "ecommerce_db"."raw"."sellers"

)

select * from sellers
  );