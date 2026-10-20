
  create view "ecommerce_db"."raw"."stg_location__dbt_tmp"
    
    
  as (
    with location as (
    select *
    from "ecommerce_db"."raw"."geolocation"

)

select * from location
  );