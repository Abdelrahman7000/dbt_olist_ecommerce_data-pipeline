
  
    

  create  table "ecommerce_db"."marts"."product_dim__dbt_tmp"
  
  
    as
  
  (
    with products_dim as (
    select 
        md5(cast(coalesce(cast(product_id as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(product_category_name as TEXT), '_dbt_utils_surrogate_key_null_') || '-' || coalesce(cast(product_name_length as TEXT), '_dbt_utils_surrogate_key_null_') as TEXT)) as product_pk,
        product_id,
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_qty
    from "ecommerce_db"."intermediate"."int_products"
) 
 
select *
from products_dim
  );
  