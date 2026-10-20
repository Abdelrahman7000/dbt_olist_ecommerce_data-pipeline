
  create view "ecommerce_db"."raw"."stg_product_category__dbt_tmp"
    
    
  as (
    with category as (
    select *
    from "ecommerce_db"."raw"."product_category_name_translation"

)

select * from category
  );