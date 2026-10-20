with products_dim as (
    select 
        product_id,
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_qty
    from {{ ref('int_products') }}
) 

select *
from products_dim